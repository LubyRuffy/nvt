# OpenVAS Vulnerability Test
# $Id: RHSA_2009_1620.nasl 6683 2017-07-12 09:41:57Z cfischer $
# Description: Auto-generated from advisory RHSA-2009:1620 ()
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
tag_summary = "The remote host is missing updates announced in
advisory RHSA-2009:1620.

The Berkeley Internet Name Domain (BIND) is an implementation of the Domain
Name System (DNS) protocols. BIND includes a DNS server (named); a resolver
library (routines for applications to use when interfacing with DNS); and
tools for verifying that the DNS server is operating correctly.

Michael Sinatra discovered that BIND was incorrectly caching responses
without performing proper DNSSEC validation, when those responses were
received during the resolution of a recursive client query that requested
DNSSEC records but indicated that checking should be disabled. A remote
attacker could use this flaw to bypass the DNSSEC validation check and
perform a cache poisoning attack if the target BIND server was receiving
such client queries. (CVE-2009-4022)

All BIND users are advised to upgrade to these updated packages, which
contain a backported patch to resolve this issue. After installing the
update, the BIND daemon (named) will be restarted automatically.";

tag_solution = "Please note that this update is available via
Red Hat Network.  To use Red Hat Network, launch the Red
Hat Update Agent with the following command: up2date";



if(description)
{
 script_id(66319);
 script_version("$Revision: 6683 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-12 11:41:57 +0200 (Wed, 12 Jul 2017) $");
 script_tag(name:"creation_date", value:"2009-12-03 22:10:42 +0100 (Thu, 03 Dec 2009)");
 script_cve_id("CVE-2009-4022");
 script_tag(name:"cvss_base", value:"2.6");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:N/I:P/A:N");
 script_name("RedHat Security Advisory RHSA-2009:1620");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2009 E-Soft Inc. http://www.securityspace.com");
 script_family("Red Hat Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 script_xref(name : "URL" , value : "http://rhn.redhat.com/errata/RHSA-2009-1620.html");
 script_xref(name : "URL" , value : "http://www.redhat.com/security/updates/classification/#moderate");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-rpm.inc");

res = "";
report = "";
if ((res = isrpmvuln(pkg:"bind", rpm:"bind~9.3.6~4.P1.el5_4.1", rls:"RHENT_5")) != NULL) {
    report += res;
}
if ((res = isrpmvuln(pkg:"bind-debuginfo", rpm:"bind-debuginfo~9.3.6~4.P1.el5_4.1", rls:"RHENT_5")) != NULL) {
    report += res;
}
if ((res = isrpmvuln(pkg:"bind-libs", rpm:"bind-libs~9.3.6~4.P1.el5_4.1", rls:"RHENT_5")) != NULL) {
    report += res;
}
if ((res = isrpmvuln(pkg:"bind-sdb", rpm:"bind-sdb~9.3.6~4.P1.el5_4.1", rls:"RHENT_5")) != NULL) {
    report += res;
}
if ((res = isrpmvuln(pkg:"bind-utils", rpm:"bind-utils~9.3.6~4.P1.el5_4.1", rls:"RHENT_5")) != NULL) {
    report += res;
}
if ((res = isrpmvuln(pkg:"bind-chroot", rpm:"bind-chroot~9.3.6~4.P1.el5_4.1", rls:"RHENT_5")) != NULL) {
    report += res;
}
if ((res = isrpmvuln(pkg:"bind-devel", rpm:"bind-devel~9.3.6~4.P1.el5_4.1", rls:"RHENT_5")) != NULL) {
    report += res;
}
if ((res = isrpmvuln(pkg:"bind-libbind-devel", rpm:"bind-libbind-devel~9.3.6~4.P1.el5_4.1", rls:"RHENT_5")) != NULL) {
    report += res;
}
if ((res = isrpmvuln(pkg:"caching-nameserver", rpm:"caching-nameserver~9.3.6~4.P1.el5_4.1", rls:"RHENT_5")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}