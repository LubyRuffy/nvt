# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2013-0511.nasl 6558 2017-07-06 11:56:55Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.123706");
script_version("$Revision: 6558 $");
script_tag(name:"creation_date", value:"2015-10-06 14:07:29 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:56:55 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2013-0511");
script_tag(name: "insight", value: "ELSA-2013-0511 -  pki-core security, bug fix and enhancement update - [9.0.3-30]- Resolves #902474 - upgrading IPA from 2.2 to 3.0 sees certmonger errors[9.0.3-29]- Resolves #891985 - Increase FreeIPA root CA validity[9.0.3-28]- Resolves #885790 - Multiple cross-site scripting flaws by displaying CRL or processing profile[9.0.3-27]- Resolves #867640 - ipa-replica-install Configuration of CA failed by REVERTING #819111 - Non-existent container breaks replication[9.0.3-26]- Resolves #844459 - Increase audit cert renewal range to 2 years (mharmsen)- Resolves #841663 - serial number incorrectly cast from BigInt to integer in installation wizard (mharmsen)- Resolves #858864 - create/ identify a mechanism for clients to determine that the pki subsystem is up (alee)[9.0.3-25]- Resolves #819111 - Non-existent container breaks replication"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2013-0511");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2013-0511.html");
script_cve_id("CVE-2012-4543");
script_tag(name:"cvss_base", value:"4.3");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
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
  if ((res = isrpmvuln(pkg:"pki-ca", rpm:"pki-ca~9.0.3~30.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"pki-common", rpm:"pki-common~9.0.3~30.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"pki-common-javadoc", rpm:"pki-common-javadoc~9.0.3~30.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"pki-java-tools", rpm:"pki-java-tools~9.0.3~30.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"pki-java-tools-javadoc", rpm:"pki-java-tools-javadoc~9.0.3~30.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"pki-native-tools", rpm:"pki-native-tools~9.0.3~30.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"pki-selinux", rpm:"pki-selinux~9.0.3~30.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"pki-setup", rpm:"pki-setup~9.0.3~30.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"pki-silent", rpm:"pki-silent~9.0.3~30.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"pki-symkey", rpm:"pki-symkey~9.0.3~30.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"pki-util", rpm:"pki-util~9.0.3~30.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"pki-util-javadoc", rpm:"pki-util-javadoc~9.0.3~30.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
