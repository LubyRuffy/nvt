#
#VID 5e7f58c3-b3f8-4258-aeb8-795e5e940ff8
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from vuxml or freebsd advisories
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2008 E-Soft Inc. http://www.securityspace.com
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
tag_insight = "The following packages are affected:
   mplayer
   mplayer-gtk
   mplayer-esound
   mplayer-gtk-esound

The installed version of MPlayer suffers from a buffer overflow
in the HTTP handler that allows an attacker to execute
arbitrary code if the attacker can arrange for you to visit
a specially crafted URL.";
tag_solution = "Update your system with the appropriate patches or
software upgrades.

http://www.mplayerhq.hu/homepage/design6/news.html
http://marc.theaimsgroup.com/?l=bugtraq&m=108066964709058
http://www.vuxml.org/freebsd/5e7f58c3-b3f8-4258-aeb8-795e5e940ff8.html";
tag_summary = "The remote host is missing an update to the system
as announced in the referenced advisory.";


if(description)
{
 script_id(52446);
 script_version("$Revision: 4144 $");
 script_tag(name:"last_modification", value:"$Date: 2016-09-26 07:28:56 +0200 (Mon, 26 Sep 2016) $");
 script_tag(name:"creation_date", value:"2008-09-04 20:41:11 +0200 (Thu, 04 Sep 2008)");
 script_bugtraq_id(10008);
 script_cve_id("CVE-2004-0386");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_name("FreeBSD Ports: mplayer, mplayer-gtk, mplayer-esound, mplayer-gtk-esound");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2005 E-Soft Inc. http://www.securityspace.com");
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
bver = portver(pkg:"mplayer");
if(!isnull(bver) && revcomp(a:bver, b:"0.92.1")<0) {
    txt += 'Package mplayer version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"mplayer-gtk");
if(!isnull(bver) && revcomp(a:bver, b:"0.92.1")<0) {
    txt += 'Package mplayer-gtk version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"mplayer-esound");
if(!isnull(bver) && revcomp(a:bver, b:"0.92.1")<0) {
    txt += 'Package mplayer-esound version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"mplayer-gtk-esound");
if(!isnull(bver) && revcomp(a:bver, b:"0.92.1")<0) {
    txt += 'Package mplayer-gtk-esound version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}

if(vuln) {
    security_message(data:string(txt));
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}