package Time::Piece::Mutable;

use strict;
use warnings;
use parent 'Time::Piece';

use Exporter 'import';

our $VERSION = '0.001';

our @EXPORT = qw(localtime gmtime);

use constant { map { ($_ => Time::Piece->$_) }
  qw(c_sec c_min c_hour c_mday c_mon c_year c_wday c_yday c_isdst c_epoch c_islocal) };

sub localtime {
  unshift @_, __PACKAGE__ unless eval { $_[0]->isa('Time::Piece') };
  my $class = shift;
  return $class->SUPER::localtime(@_);
}

sub gmtime {
  unshift @_, __PACKAGE__ unless eval { $_[0]->isa('Time::Piece') };
  my $class = shift;
  return $class->SUPER::gmtime(@_);
}

sub sec :lvalue { $_[0][c_sec] }
*second = \&sec;

sub min :lvalue { $_[0][c_min] }
*minute = \&min;

sub hour :lvalue { $_[0][c_hour] }

sub mday :lvalue { $_[0][c_mday] }
*day_of_month = \&mday;

sub _mon :lvalue { $_[0][c_mon] }

sub _year :lvalue { $_[0][c_year] }

sub _wday :lvalue { $_[0][c_wday] }
*day_of_week = \&_wday;

sub yday :lvalue { $_[0][c_yday] }
*day_of_year = \&yday;

sub isdst :lvalue { $_[0][c_isdst] }
*daylight_savings = \&isdst;

sub epoch {
  undef $_[0][c_epoch];
  return $_[0]->SUPER::epoch;
};

1;

=head1 NAME

Time::Piece::Mutable - Time::Piece with mutable attributes

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 BUGS

Report any issues on the public bugtracker.

=head1 AUTHOR

Dan Book <dbook@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2016 by Dan Book.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=head1 SEE ALSO

L<Time::Piece>, L<Time::Moment>
