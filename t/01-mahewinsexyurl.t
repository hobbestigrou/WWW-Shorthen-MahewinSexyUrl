use Test::More;

use LWP::UserAgent;

my $prefix = 'http://msud.pl/';

my $ua = LWP::UserAgent->new();
$ua->timeout(10);
my $r = $ua->get($prefix);
$r->code == 200 ? plan tests => 3
                : plan skip_all => 'http://msud.pl/ not reachable';

use_ok WWW::Shorten::MahewinSexyUrl;

my $url = 'http://search.cpan.org/dist/WWW-Shorten-MahewinSexyUrl/';
my $return = makeashorterlink($url);
my ($code) = $return =~ /(\w+)$/;
like ( $return, qr[^\w+$], 'make it shorter');

eval { &makeashorterlink() };
ok($@, 'makeashorterlink fails with no args');

