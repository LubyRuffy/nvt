# OpenVAS Vulnerability Test
# $Id: esoft_slk_ssa_2008_191_03.nasl 6598 2017-07-07 09:36:44Z cfischer $
# Description: Auto-generated from the corresponding slackware advisory
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
tag_insight = "New seamonkey packages are available for Slackware 11.0, 12.0, 12.1,
and -current to fix security issues.

More details about the issues may be found here:

http://www.mozilla.org/projects/security/known-vulnerabilities.html#seamonkey";
tag_summary = "The remote host is missing an update as announced
via advisory SSA:2008-191-03.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=SSA:2008-191-03";
                                                                                
if(description)
{
 script_id(61463);
 script_tag(name:"creation_date", value:"2012-09-11 01:34:21 +0200 (Tue, 11 Sep 2012)");
 script_tag(name:"last_modification", value:"$Date: 2017-07-07 11:36:44 +0200 (Fri, 07 Jul 2017) $");
 script_version("$Revision: 6598 $");
 script_cve_id("CVE-2008-1380", "CVE-2008-2798", "CVE-2008-2799", "CVE-2008-2800",
               "CVE-2008-2801", "CVE-2008-2802", "CVE-2008-2803", "CVE-2008-2805",
               "CVE-2008-2806", "CVE-2008-2807", "CVE-2008-2808", "CVE-2008-2809",
               "CVE-2008-2810", "CVE-2008-2811");
 script_bugtraq_id(28818, 30038);
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 name = "Slackware Advisory SSA:2008-191-03 seamonkey ";
 script_name(name);



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
 script_family("Slackware Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/slackware_linux", "ssh/login/slackpack");
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

include("pkg-lib-slack.inc");
vuln = 0;
if(isslkpkgvuln(pkg:"seamonkey", ver:"1.1.10-i486-1_slack11.0", rls:"SLK11.0")) {
    vuln = 1;
}
if(isslkpkgvuln(pkg:"seamonkey", ver:"1.1.10-i486-1_slack12.0", rls:"SLK12.0")) {
    vuln = 1;
}
if(isslkpkgvuln(pkg:"seamonkey", ver:"1.1.10-i486-1_slack12.1", rls:"SLK12.1")) {
    vuln = 1;
}

if(vuln) {
    security_message(0);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}