class PgnParser:
    def parse(self, file_name):
        try:
            f = open(file_name, "r")
            self.db = PgnDatabase()
            line_num = 0
            while(True):
                line = f.readline()
                line_num += 1
                if(len(line) == 0):
                    break
                else:
                    self.parse_line(line, line_num)
            return self.db
            
        except IOError as (errno, strerrror):
            print "I/O error ({0}): {1}".format(errno, strerror)
    
    def parse_line(self, line, line_num):
        line = line.strip()

        # empty line
        if(len(line) == 0):
            return

        # comment
        if(line.startswith(';')):
            return
        
        if(line.startswith('{')):
            line = self.remove_comment(line, line_num)
            self.parse_line(line, line_num)


        # tag pair
        # currently only handles PGN export format tag pairs
        # i.e tag pairs which span only one line
        if(line.startswith('[')):
            if(line.endswith(']')):        
                self.parse_tag(line, line_num)
            else:
                raise ParseError("Unmatched tag pair ({0}). Line: {1}".format(line, line_num))

        # move text
        if(line.startswith('1.')):
            parse_move_text(line, line_num)
        
    
    def parse_tag(self, line, line_num):
        (sym, val) = self.get_tag(line)

                   
    def get_tag(self, line, line_num):
        # assumes PGN export style tag pairs
        # [Event "FICS rated blitz game"]
        
        if(len(line) == 0):
            return

        sym_start = 1
        sym_end = line.find(' ')
        sym = line[sym_start:sym_end]

        val_start = line.find('"') + 1
        val_end = line.find('"', val_start) - 1
        val = line[val_start: val_end]
        
        return (sym, val)
        
    def parse_move_text(self, line, line_num):
        if(len(line) == 0):
            return
        idx = line.find('.')
        if(idx == -1):
            raise ParseError("Illegal move line ({0}). Line: {1}".format(line, line_num))
        move_num = int(line[:idx])
        idx = idx + 1


                
        pass
    
        
    def remove_comment(self, line, line_num):
        if(len(line) == 0):
            return
        start = line.find('{')
        end = line.find('}')

        if(start == -1 and end == -1):            
            return line

        if(end == -1):
            raise ParseError("No end of comment found ({0}). Line: {1}".format(line, line_num))
            
        if(start == -1):
            raise ParseError("No start of comment found ({0}). Line: {1}".format(line, line_num))
        
        if(end < start):
            raise ParseError("Invalid comment sequence ({0}). Line: {1}". format(line, line_num))
                              
        removed = line.replace(line[start:end+1], '', 1)
        return removed                   


class ParseError(Exception):
    def __init__(self, value):
        self.value = value
    def __str__(self):
        return repr(self.value)

class PgnDatabase:
    def __init__(self):
        pass


class PgnGame:
    def __init__(self):
        pass

