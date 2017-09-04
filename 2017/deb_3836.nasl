# OpenVAS Vulnerability Test
# $Id: deb_3836.nasl 6607 2017-07-07 12:04:25Z cfischer $
# Auto-generated from advisory DSA 3836-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net
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
    script_id(703836);
    script_version("$Revision: 6607 $");
    script_cve_id("CVE-2017-8073");
    script_name("Debian Security Advisory DSA 3836-1 (weechat - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-07-07 14:04:25 +0200 (Fri, 07 Jul 2017) $");
    script_tag(name: "creation_date", value: "2017-04-27 00:00:00 +0200 (Thu, 27 Apr 2017)");
    script_tag(name:"cvss_base", value:"5.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2017/dsa-3836.html");

    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "weechat on Debian Linux");
        script_tag(name: "insight",   value: "WeeChat (Wee Enhanced Environment for Chat) is a fast and light chat client
for many operating systems. Everything can be done with a keyboard.
It is customizable and extensible with plugins/scripts, and includes:

- support of IRC protocol (native)
- support of XMPP/Jabber protocol (with additional script)
- nicklist
- smart hotlist
- horizontal and vertical split
- double charset support (decode/encode)
- FIFO pipe for remote control
- 256 colors support
- incremental text search
- dynamic filtering of buffer content
- Perl, Python, Ruby, Lua, Tcl and Scheme scripting
- scripts manager
- spell checking
- highly customizable and extensible
- and much more!");
    script_tag(name: "solution",  value: "For the stable distribution (jessie), this problem has been fixed in
version 1.0.1-1+deb8u1.

For the unstable distribution (sid), this problem has been fixed in
version 1.7-3.

We recommend that you upgrade your weechat packages.");
    script_tag(name: "summary",   value: "It was discovered that weechat, a fast and light chat client, is prone
to a buffer overflow vulnerability in the IRC plugin, allowing a remote
attacker to cause a denial-of-service by sending a specially crafted
filename via DCC.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"weechat", ver:"1.0.1-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"weechat-core", ver:"1.0.1-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"weechat-curses", ver:"1.0.1-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"weechat-dbg", ver:"1.0.1-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"weechat-dev", ver:"1.0.1-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"weechat-doc", ver:"1.0.1-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"weechat-plugins", ver:"1.0.1-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}