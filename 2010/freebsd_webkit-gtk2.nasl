#
#VID 19419b3b-92bd-11df-b140-0015f2db7bde
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from VID 19419b3b-92bd-11df-b140-0015f2db7bde
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
tag_insight = "The following package is affected: webkit-gtk2";
tag_solution = "Update your system with the appropriate patches or
software upgrades.

http://blog.kov.eti.br/?p=116
http://www.vuxml.org/freebsd/19419b3b-92bd-11df-b140-0015f2db7bde.html";
tag_summary = "The remote host is missing an update to the system
as announced in the referenced advisory.";



if(description)
{
 script_id(67711);
 script_version("$Revision: 5263 $");
 script_tag(name:"last_modification", value:"$Date: 2017-02-10 14:45:51 +0100 (Fri, 10 Feb 2017) $");
 script_tag(name:"creation_date", value:"2010-07-22 17:43:43 +0200 (Thu, 22 Jul 2010)");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_cve_id("CVE-2010-1386", "CVE-2010-1392", "CVE-2010-1405", "CVE-2010-1407", "CVE-2010-1416", "CVE-2010-1417", "CVE-2010-1418", "CVE-2010-1421", "CVE-2010-1422", "CVE-2010-1501", "CVE-2010-1664", "CVE-2010-1665", "CVE-2010-1758", "CVE-2010-1759", "CVE-2010-1760", "CVE-2010-1761", "CVE-2010-1762", "CVE-2010-1767", "CVE-2010-1770", "CVE-2010-1771", "CVE-2010-1772", "CVE-2010-1773", "CVE-2010-1774", "CVE-2010-2264");
 script_name("FreeBSD Ports: webkit-gtk2");



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
bver = portver(pkg:"webkit-gtk2");
if(!isnull(bver) && revcomp(a:bver, b:"1.2.3")<0) {
    txt += 'Package webkit-gtk2 version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}

if(vuln) {
    security_message(data:string(txt));
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}