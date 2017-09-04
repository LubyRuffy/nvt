# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2008-0890.nasl 6553 2017-07-06 11:52:12Z cfischer $
 
# Authors: 
# Eero Volotinen <eero.volotinen@solinor.com> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://solinor.com
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
if(description)
 {
script_oid("1.3.6.1.4.1.25623.1.0.122552");
script_version("$Revision: 6553 $");
script_tag(name:"creation_date", value:"2015-10-08 14:47:49 +0300 (Thu, 08 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:52:12 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2008-0890");
script_tag(name: "insight", value: "ELSA-2008-0890 -  wireshark security update - [1.0.3-4.0.1.el5_2]- Add oracle-ocfs2-network.patch[1.0.3-4]- fix pam session file, wireshark requires root pswd everytime its started[1.0.3-3]- fix pie flags[1.0.3-1]- upgrade to 1.0.3- fixes several security issues- Resolves: #461569"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2008-0890");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2008-0890.html");
script_cve_id("CVE-2008-1070","CVE-2008-1071","CVE-2008-1072","CVE-2008-1561","CVE-2008-1562","CVE-2008-1563","CVE-2008-3137","CVE-2008-3138","CVE-2008-3141","CVE-2008-3145","CVE-2008-3146","CVE-2008-3932","CVE-2008-3933","CVE-2008-3934");
script_tag(name:"cvss_base", value:"10.0");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/oracle_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_copyright("Eero Volotinen");
script_family("Oracle Linux Local Security Checks");
exit(0);
}
include("revisions-lib.inc");
include("pkg-lib-rpm.inc");
release = get_kb_item("ssh/login/release");
res = "";
if(release == NULL)
{
 exit(0);
}
if(release == "OracleLinux5")
{
  if ((res = isrpmvuln(pkg:"wireshark", rpm:"wireshark~1.0.3~4.0.1.el5_2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"wireshark-gnome", rpm:"wireshark-gnome~1.0.3~4.0.1.el5_2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
