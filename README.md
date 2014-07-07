pkg Installer
=============

Bypassing installation requirements check for Mac OS X .pkg files.

[Bug report and feedback][] | [Donation (PayPal)][] | [Follow Me on Twitter (@x43x61x69)][]

[Bug report and feedback]: https://github.com/x43x61x69/OneShot/issues "GitHub"
[Follow Me on Twitter (@x43x61x69)]: https://twitter.com/x43x61x69 "Twitter"
[Donation (PayPal)]: https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=N29VTZVBZLZA4

Description
-----------

*The source code served as an example, it is, by no means, a commercial grade product. It might contain errors or flaws, and it was created for demonstration purpose only.*

Some .pkg installers (e.g. JDK), have pre-installation checks such as system versions. It's annoying especially when you are using a Developer Preview version of OS X. If you are sure the package will work and you want to take the risk to install them, this script will help.

* **Make sure you have Xcode installed before you use this script.**

* To use this script directly without downloading, modifiy and execute the following command in your Mac Terminal:   

	`curl -sL goo.gl/u3zGN4 >_ && sh _ pkg_path`

	e.g.:

	 `curl -sL goo.gl/u3zGN4 >_ && sh _ /Volumes/JDK\ 7\ Update\ 60/JDK\ 7\ Update\ 60.pkg`


Changelog
---------

v0.1:

* Initial release.


License
-------

Copyright (C) 2014  Cai, Zhi-Wei.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
