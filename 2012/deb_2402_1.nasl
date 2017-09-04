# OpenVAS Vulnerability Test
# $Id: deb_2402_1.nasl 6612 2017-07-07 12:08:03Z cfischer $
# Description: Auto-generated from advisory DSA 2402-1 (iceape)
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# or at your option, GNU General Public License version 3,
# as published by the Free Software Foundation
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

include("revisions-lib.inc");
tag_insight = "Several vulnerabilities have been found in the Iceape internet suite, an
unbranded version of Seamonkey:

CVE-2011-3670

Gregory Fleischer discovered that IPv6 URLs were incorrectly parsed,
resulting in potential information disclosure.

CVE-2012-0442

Jesse Ruderman and Bob Clary discovered memory corruption bugs, which
may lead to the execution of arbitrary code.

CVE-2012-0444

regenrecht discovered that missing input sanisiting in the Ogg Vorbis
parser may lead to the execution of arbitrary code.

CVE-2012-0449

Nicolas Gregoire and Aki Helin discovered that missing input
sanisiting in XSLT processing may lead to the execution of arbitrary
code.

For the stable distribution (squeeze), this problem has been fixed in
version 2.0.11-10.

For the unstable distribution (sid), this problem has been fixed in
version 2.0.14-10.

We recommend that you upgrade your iceape packages.";
tag_summary = "The remote host is missing an update to iceape
announced via advisory DSA 2402-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202402-1";

if(description)
{
 script_id(70720);
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_cve_id("CVE-2011-3670", "CVE-2012-0442", "CVE-2012-0444", "CVE-2012-0449");
 script_version("$Revision: 6612 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-07 14:08:03 +0200 (Fri, 07 Jul 2017) $");
 script_tag(name:"creation_date", value:"2012-02-12 06:39:15 -0500 (Sun, 12 Feb 2012)");
 script_name("Debian Security Advisory DSA 2402-1 (iceape)");


 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
 script_family("Debian Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-deb.inc");
res = "";
report = "";
if((res = isdpkgvuln(pkg:"iceape", ver:"2.0.11-10", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-browser", ver:"2.0.11-10", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-chatzilla", ver:"2.0.11-10", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-dbg", ver:"2.0.11-10", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-dev", ver:"2.0.11-10", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-mailnews", ver:"2.0.11-10", rls:"DEB6.0")) != NULL) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}