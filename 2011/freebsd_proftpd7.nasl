#
#VID 533d20e7-f71f-11df-9ae1-000bcdf0a03b
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from VID 533d20e7-f71f-11df-9ae1-000bcdf0a03b
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
tag_insight = "The following package is affected: proftpd

CVE-2010-4221
Multiple stack-based buffer overflows in the pr_netio_telnet_gets
function in netio.c in ProFTPD before 1.3.3c allow remote attackers to
execute arbitrary code via vectors involving a TELNET IAC escape
character to a (1) FTP or (2) FTPS server.";
tag_solution = "Update your system with the appropriate patches or
software upgrades.

http://www.zerodayinitiative.com/advisories/ZDI-10-229/
http://www.vuxml.org/freebsd/533d20e7-f71f-11df-9ae1-000bcdf0a03b.html";
tag_summary = "The remote host is missing an update to the system
as announced in the referenced advisory.";



if(description)
{
 script_id(68702);
 script_version("$Revision: 5424 $");
 script_tag(name:"last_modification", value:"$Date: 2017-02-25 17:52:36 +0100 (Sat, 25 Feb 2017) $");
 script_tag(name:"creation_date", value:"2011-01-24 17:55:59 +0100 (Mon, 24 Jan 2011)");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_cve_id("CVE-2010-4221");
 script_bugtraq_id(44562);
 script_name("FreeBSD Ports: proftpd");



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
bver = portver(pkg:"proftpd");
if(!isnull(bver) && revcomp(a:bver, b:"1.3.3c")<0) {
    txt += 'Package proftpd version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}

if(vuln) {
    security_message(data:string(txt));
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}