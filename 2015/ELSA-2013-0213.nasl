# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2013-0213.nasl 6558 2017-07-06 11:56:55Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.123738");
script_version("$Revision: 6558 $");
script_tag(name:"creation_date", value:"2015-10-06 14:07:54 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:56:55 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2013-0213");
script_tag(name: "insight", value: "ELSA-2013-0213 -  nss, nss-util, and nspr security, bug fix, and enhancement update - nspr[4.9.2-0.1]- Retagging to ensure n-v-r is lower than the one for rhel-6.4- Resolves: rhbz#891661 - [RFE] Rebase nspr to 4.9.2 due to Firefox 17 ESR[4.9.2-1]- Resolves: rhbz#891661 - [RFE] Rebase nspr to 4.9.2 due to Firefox 17 ESRnss[3.13.6-2.0.1.el6_3]- Added nss-vendor.patch to change vendor[3.13.6-2]- Retagging for rhel-6.3 z-stream- Update to NSS_3_13_6_RTM- Resolves: rhbz#891663 - Update to 3.13.5 for mozilla 10.0.6- Resolves: rhbz#891151 [CVE-2013-0743][3.13.6-1]- Update to NSS_3_13_6_RTM- Resolves: rhbz#891663 - Update to 3.13.5 for mozilla 10.0.6- Resolves: rhbz#891151 [CVE-2013-0743]nss-util[3.13.6-1]- Update to NSS_3_13_6_RTM- Resolves: rhbz#891670 - [RFE] Rebase to NSS-UTIL >= 3.13.6[3.13.5-1]- Resolves: rhbz#833763 - Update to 3.13.5 for Mozilla 10.0.6"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2013-0213");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2013-0213.html");
script_cve_id();
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
if(release == "OracleLinux6")
{
  if ((res = isrpmvuln(pkg:"nspr", rpm:"nspr~4.9.2~0.el6_3.1", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nspr-devel", rpm:"nspr-devel~4.9.2~0.el6_3.1", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss", rpm:"nss~3.13.6~2.0.1.el6_3", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-devel", rpm:"nss-devel~3.13.6~2.0.1.el6_3", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-pkcs11-devel", rpm:"nss-pkcs11-devel~3.13.6~2.0.1.el6_3", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-sysinit", rpm:"nss-sysinit~3.13.6~2.0.1.el6_3", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-tools", rpm:"nss-tools~3.13.6~2.0.1.el6_3", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-util", rpm:"nss-util~3.13.6~1.el6_3", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-util-devel", rpm:"nss-util-devel~3.13.6~1.el6_3", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
