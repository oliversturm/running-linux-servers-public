#!/usr/bin/perl

my %services;
open (my $sf, '<:encoding(UTF-8)', '/etc/services')
	or die "Can't open /etc/services";

while (<$sf>) {
	if (/^[^#\s]/) {
		($name, $port) = $_ =~ m/^([^\s]+)\s+(\d+)/;
		$services{$port} = $name;
	}
}

while (<>) {
	if (/UFW BLOCK/) {
		s/.*DPT=(\d+).*/\1/;
		if ($_ <= 1024) {
			chomp;
			print "$_ (" . ($services{$_} || "unknown") . ")\n";
		}
	}
}

