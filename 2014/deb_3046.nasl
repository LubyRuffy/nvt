# OpenVAS Vulnerability Test
# $Id: deb_3046.nasl 6769 2017-07-20 09:56:33Z teissa $
# Auto-generated from advisory DSA 3046-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#


if(description)
{
    script_id(703046);
    script_version("$Revision: 6769 $");
    script_cve_id("CVE-2014-7295");
    script_name("Debian Security Advisory DSA 3046-1 (mediawiki - security update)");
    script_tag(name: "last_modification", value:"$Date: 2017-07-20 11:56:33 +0200 (Thu, 20 Jul 2017) $");
    script_tag(name: "creation_date", value:"2014-10-05 00:00:00 +0200 (Sun, 05 Oct 2014)");
    script_tag(name:"cvss_base", value:"3.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:P/A:N");

    script_xref(name: "URL", value: "http://www.debian.org/security/2014/dsa-3046.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "mediawiki on Debian Linux");
        script_tag(name: "insight",   value: "MediaWiki is a wiki engine (a program for creating a collaboratively
edited website). It is designed to handle heavy websites containing
library-like document collections, and supports user uploads of
images/sounds, multilingual content, TOC autogeneration, ISBN links,
etc.");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy), this problem has been fixed in
version 1:1.19.20+dfsg-0+deb7u1.

For the unstable distribution (sid), this problem has been fixed in
version 1:1.19.20+dfsg-1.

We recommend that you upgrade your mediawiki packages.");
    script_tag(name: "summary",   value: "It was reported that MediaWiki, a website engine for collaborative work,
allowed to load user-created CSS on pages where user-created JavaScript
is not allowed. A wiki user could be tricked into performing actions by
manipulating the interface from CSS, or JavaScript code being executed
from CSS, on security-wise sensitive pages like Special:Preferences and
Special:UserLogin. This update removes the separation of CSS and
JavaScript module allowance.");
    script_tag(name: "vuldetect", value:  "This check tests the installed software version using the apt package manager.");
    script_tag(name:"qod_type", value:"package");
    script_tag(name:"solution_type", value:"VendorFix");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"mediawiki", ver:"1:1.19.20+dfsg-0+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"mediawiki", ver:"1:1.19.20+dfsg-0+deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"mediawiki", ver:"1:1.19.20+dfsg-0+deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"mediawiki", ver:"1:1.19.20+dfsg-0+deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}