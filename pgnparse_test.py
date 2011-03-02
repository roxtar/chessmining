import unittest
from pgnparse import *

class TestPgnParse(unittest.TestCase):
    def setUp(self):
        pass

    def testPgnGameTag(self):
        p = PgnGame()
        p.add_tag("Event", "FICS Rated Blitz")
        p.add_tag("Opening", "B00")
        self.assertTrue(len(p.tags) == 2)
        self.assertTrue("Event" in p.tags.keys())

    def testPgnParse(self):
        p = PgnParser()
        p.parse("test1.pgn")
        self.assertTrue(p.db != None)
        self.assertTrue(p.db.current_game != None)
        self.assertTrue(len(p.db.games) > 0)
        self.assertTrue(len(p.db.games) == 3)

        self.assertTrue(len(p.db.games[0].tags.keys()) == 16)
        self.assertTrue(p.db.games[0].tags["White"] == "brokenclock")

if __name__ == '__main__':
    unittest.main()
