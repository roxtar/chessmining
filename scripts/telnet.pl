use Net::Telnet;
$telnet = new Net::Telnet(Timeout=> 20, Errmode=>'die');
$telnet->open("freechess.org");
$telnet->waitfor('/login: $/i');
$telnet->print('GuestGuest');
$telnet->waitfor("/Press return/");
$telnet->print('\n');
$telnet->waitfor('/fics%/');
$telnet->print('set seek off');
$telnet->waitfor('/fics%/');
$telnet->print('set shout off');
$telnet->waitfor('/fics%/');
while(<>) {
    $user = $_;
    $telnet->print("finger $user");
    $telnet->waitfor('/fics%/');
    @output = $telnet->cmd("");
    print @output;
}
close(DONE);
