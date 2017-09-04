#
#VID e4dac715-c818-11df-a92c-0015587e2cc1
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from VID e4dac715-c818-11df-a92c-0015587e2cc1
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2010 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisories, and are Copyright (c) the respective author(s)
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
tag_insight = "The following package is affected: squid

CVE-2010-3072
The string-comparison functions in String.cci in Squid 3.x before
3.1.8 and 3.2.x before 3.2.0.2 allow remote attackers to cause a
denial of service (NULL pointer dereference and daemon crash) via a
crafted request.";
tag_solution = "Update your system with the appropriate patches or
software upgrades.

http://www.squid-cache.org/Advisories/SQUID-2010_3.txt
http://www.vuxml.org/freebsd/e4dac715-c818-11df-a92c-0015587e2cc1.html";
tag_summary = "The remote host is missing an update to the system
as announced in the referenced advisory.";



if(description)
{
 script_id(68101);
 script_version("$Revision: 5263 $");
 script_tag(name:"last_modification", value:"$Date: 2017-02-10 14:45:51 +0100 (Fri, 10 Feb 2017) $");
 script_tag(name:"creation_date", value:"2010-10-10 19:35:00 +0200 (Sun, 10 Oct 2010)");
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
 script_cve_id("CVE-2010-3072");
 script_name("FreeBSD Ports: squid");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2010 E-Soft Inc. http://www.securityspace.com");
 script_family("FreeBSD Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/freebsdrel", "login/SSH/success");
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-bsd.inc");

txt = "";
vuln = 0;
bver = portver(pkg:"squid");
if(!isnull(bver) && revcomp(a:bver, b:"3.0.1")>=0 && revcomp(a:bver, b:"3.0.25_3")<0) {
    txt += 'Package squid version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
if(!isnull(bver) && revcomp(a:bver, b:"3.1.0.1")>=0 && revcomp(a:bver, b:"3.1.8")<0) {
    txt += 'Package squid version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}

if(vuln) {
    security_message(data:string(txt));
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}