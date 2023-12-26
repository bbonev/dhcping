# Fork of dhcping
DHCP Daemon Ping Program

This fork of `dhcping` 1.2 (also unreleased 1.3) by Edwin Groothuis, edwin@mavetju.org (http://www.mavetju.org) collects in a single place bug-fixes and improvements collected over the last 10+ years.

## Changes since 1.2 (also unreleased 1.3)

* Get rid of the unused autoconf
* Copy dhcp\_options.h from dhcpdump
* Fix warnings for mismatched sign
* Fix infinite loop when processing arguments (Henrik Stoerner)
* Spelling fixes (A Costa)
* Document -V as extremely verbose option (Joey Schulze)
