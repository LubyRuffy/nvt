# OpenVAS Vulnerability Test
# $Id: deb_3212.nasl 6609 2017-07-07 12:05:59Z cfischer $
# Auto-generated from advisory DSA 3212-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net
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
    script_id(703212);
    script_version("$Revision: 6609 $");
    script_cve_id("CVE-2015-0801", "CVE-2015-0807", "CVE-2015-0813", "CVE-2015-0815",
                  "CVE-2015-0816");
    script_name("Debian Security Advisory DSA 3212-1 (icedove - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-07-07 14:05:59 +0200 (Fri, 07 Jul 2017) $");
    script_tag(name: "creation_date", value: "2015-04-02 00:00:00 +0200 (Thu, 02 Apr 2015)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3212.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "icedove on Debian Linux");
    script_tag(name: "insight",   value: "Icedove is an unbranded Thunderbird mail
client suitable for free distribution. It supports different mail accounts (POP,
IMAP, Gmail), has an integrated learning Spam filter, and offers easy organization
of mails with tagging and virtual folders. Also, more features can be added by
installing extensions.");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy),
these problems have been fixed in version 31.6.0-1~deb7u1.

For the upcoming stable distribution (jessie), these problems have been
fixed in version 31.6.0-1.

For the unstable distribution (sid), these problems have been fixed in
version 31.6.0-1.

We recommend that you upgrade your icedove packages.");
    script_tag(name: "summary",   value: "Multiple security issues have
been found in Icedove, Debian's version of the Mozilla Thunderbird mail
client: Multiple memory safety errors, use-after-frees and other implementation
errors may lead to the execution of arbitrary code, the bypass of security
restrictions or denial of service.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"calendar-google-provider", ver:"31.6.0-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icedove", ver:"31.6.0-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icedove-dbg", ver:"31.6.0-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icedove-dev", ver:"31.6.0-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceowl-extension", ver:"31.6.0-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}