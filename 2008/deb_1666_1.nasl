# OpenVAS Vulnerability Test
# $Id: deb_1666_1.nasl 6616 2017-07-07 12:10:49Z cfischer $
# Description: Auto-generated from advisory DSA 1666-1 (libxml2)
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2008 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
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
tag_insight = "Several vulnerabilities have been discovered in the GNOME XML library.
The Common Vulnerabilities and Exposures project identifies the
following problems:

CVE-2008-4225

Drew Yao discovered that missing input sanitising in the
xmlBufferResize() function may lead to an infinite loop,
resulting in denial of service.

CVE-2008-4226

Drew Yao discovered that an integer overflow in the
xmlSAX2Characters() function may lead to denial of service or
the execution of arbitrary code.

For the stable distribution (etch), these problems have been fixed in
version 2.6.27.dfsg-6.

For the upcoming stable distribution (lenny) and the unstable
distribution (sid), these problems will be fixed soon.

We recommend that you upgrade your libxml2 packages.";
tag_summary = "The remote host is missing an update to libxml2
announced via advisory DSA 1666-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%201666-1";


if(description)
{
 script_id(61904);
 script_version("$Revision: 6616 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-07 14:10:49 +0200 (Fri, 07 Jul 2017) $");
 script_tag(name:"creation_date", value:"2008-11-24 23:46:43 +0100 (Mon, 24 Nov 2008)");
 script_cve_id("CVE-2008-4225", "CVE-2008-4226");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_name("Debian Security Advisory DSA 1666-1 (libxml2)");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2008 E-Soft Inc. http://www.securityspace.com");
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
if ((res = isdpkgvuln(pkg:"libxml2-doc", ver:"2.6.27.dfsg-6", rls:"DEB4.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml2-dbg", ver:"2.6.27.dfsg-6", rls:"DEB4.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml2", ver:"2.6.27.dfsg-6", rls:"DEB4.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml2-utils", ver:"2.6.27.dfsg-6", rls:"DEB4.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-libxml2", ver:"2.6.27.dfsg-6", rls:"DEB4.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml2-dev", ver:"2.6.27.dfsg-6", rls:"DEB4.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}