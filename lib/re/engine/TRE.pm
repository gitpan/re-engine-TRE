package re::engine::TRE;
# ABSTRACT: TRE regular expression engine


use strict;
use utf8;
use warnings qw(all);

use 5.009005;
use XSLoader ();

# All engines should subclass the core Regexp package
our @ISA = 'Regexp';

BEGIN {
    our $VERSION = '0.05'; # VERSION
    XSLoader::load __PACKAGE__, $VERSION;
}


sub import {
    $^H{regcomp} = ENGINE;
}

sub unimport {
    delete $^H{regcomp}
        if $^H{regcomp} == ENGINE;
}

1;

__END__
=pod

=encoding utf8

=head1 NAME

re::engine::TRE - TRE regular expression engine

=head1 VERSION

version 0.05

=head1 SYNOPSIS

    use re::engine::TRE;

    if ("mooh!" =~ /\([mo]*\)/) {
        say $1; # "moo"
    }

=head1 DESCRIPTION

Replaces perl's regex engine in a given lexical scope with POSIX
regular expressions provided by the TRE regular expression
library. tre-0.8.0 is shipped with this module.

=for Pod::Coverage ENGINE

=head1 AUTHORS

=over 4

=item *

Ævar Arnfjörð Bjarmason <avar@cpan.org>

=item *

Stanislaw Pusep <stas@sysd.org>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Ævar Arnfjörð Bjarmason.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

