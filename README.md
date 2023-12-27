# Fork of dhcping
DHCP Daemon Ping Program

This fork of `dhcping` 1.2 (also unreleased 1.3) by Edwin Groothuis <edwin@mavetju.org> (http://www.mavetju.org) collects in a single place bug-fixes and improvements collected over the last 10+ years.

This fork also merges the functionality from `dhcping` 1.4f from https://github.com/nean-and-i/dhcping by Andreas Neuhold <aneuhold@lgi.com> and nean-and-i <nean.and.i@gmail.com>. This is the reason to bump up the version to 1.5

## Changes since 1.4f

* Fix undefined comparissons of static and dynamic strings

## Changes since 1.2 (also unreleased 1.3)

* Get rid of the unused autoconf
* Copy dhcp\_options.h from dhcpdump
* Fix warnings for mismatched sign
* Fix infinite loop when processing arguments (Henrik Stoerner)
* Spelling fixes (A Costa)
* Document -V as extremely verbose option (Joey Schulze)
* Remove option -V and make multiple -v to have the same effect (Nye Liu)
