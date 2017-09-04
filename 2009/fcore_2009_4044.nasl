# OpenVAS Vulnerability Test
# $Id: fcore_2009_4044.nasl 6624 2017-07-10 06:11:55Z cfischer $
# Description: Auto-generated from advisory FEDORA-2009-4044 (prelude-manager)
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2009 E-Soft Inc. http://www.securityspace.com
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
tag_insight = "Update Information:

The configuration file of prelude-manager contains a database password and is
world readable. This update restricts permissions to the root account.

ChangeLog:

* Wed Apr 22 2009 Steve Grubb  0.9.14.2-2
- Adjusted permissions on dirs and conf files";
tag_solution = "Apply the appropriate updates.

This update can be installed with the yum update program.  Use 
su -c 'yum update prelude-manager' at the command line.
For more information, refer to Managing Software with yum,
available at http://docs.fedoraproject.org/yum/.

https://secure1.securityspace.com/smysecure/catid.html?in=FEDORA-2009-4044";
tag_summary = "The remote host is missing an update to prelude-manager
announced via advisory FEDORA-2009-4044.";



if(description)
{
 script_id(63929);
 script_version("$Revision: 6624 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:11:55 +0200 (Mon, 10 Jul 2017) $");
 script_tag(name:"creation_date", value:"2009-05-05 16:00:35 +0200 (Tue, 05 May 2009)");
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_name("Fedora Core 9 FEDORA-2009-4044 (prelude-manager)");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2009 E-Soft Inc. http://www.securityspace.com");
 script_family("Fedora Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
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

include("pkg-lib-rpm.inc");

res = "";
report = "";
if ((res = isrpmvuln(pkg:"prelude-manager", rpm:"prelude-manager~0.9.14.2~2.fc9", rls:"FC9")) != NULL) {
    report += res;
}
if ((res = isrpmvuln(pkg:"prelude-manager-db", rpm:"prelude-manager-db~plugin~0.9.14.2", rls:"FC9")) != NULL) {
    report += res;
}
if ((res = isrpmvuln(pkg:"prelude-manager-devel", rpm:"prelude-manager-devel~0.9.14.2~2.fc9", rls:"FC9")) != NULL) {
    report += res;
}
if ((res = isrpmvuln(pkg:"prelude-manager-smtp", rpm:"prelude-manager-smtp~plugin~0.9.14.2", rls:"FC9")) != NULL) {
    report += res;
}
if ((res = isrpmvuln(pkg:"prelude-manager-xml", rpm:"prelude-manager-xml~plugin~0.9.14.2", rls:"FC9")) != NULL) {
    report += res;
}
if ((res = isrpmvuln(pkg:"prelude-manager-debuginfo", rpm:"prelude-manager-debuginfo~0.9.14.2~2.fc9", rls:"FC9")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}