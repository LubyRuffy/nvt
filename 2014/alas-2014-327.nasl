# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2014-327.nasl 6735 2017-07-17 09:56:49Z teissa $
 
# Authors: 
# Eero Volotinen <eero.volotinen@iki.fi> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://ping-viini.org 
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
script_oid("1.3.6.1.4.1.25623.1.0.120212");
script_version("$Revision: 6735 $");
script_tag(name:"creation_date", value:"2015-09-08 13:20:23 +0200 (Tue, 08 Sep 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-17 11:56:49 +0200 (Mon, 17 Jul 2017) $");
script_name("Amazon Linux Local Check: alas-2014-327");
script_tag(name: "insight", value: "An input validation flaw was discovered in the medialib library in the 2D component. A specially crafted image could trigger Java Virtual Machine memory corruption when processed. A remote attacker, or an untrusted Java application or applet, could possibly use this flaw to execute arbitrary code with the privileges of the user running the Java Virtual Machine. (CVE-2014-0429 )Multiple flaws were discovered in the Hotspot and 2D components in OpenJDK. An untrusted Java application or applet could use these flaws to trigger Java Virtual Machine memory corruption and possibly bypass Java sandbox restrictions. (CVE-2014-0456 , CVE-2014-2397 , CVE-2014-2421 )Multiple improper permission check issues were discovered in the Libraries component in OpenJDK. An untrusted Java application or applet could use these flaws to bypass Java sandbox restrictions. (CVE-2014-0457 , CVE-2014-0455 , CVE-2014-0461 )Multiple improper permission check issues were discovered in the AWT, JAX-WS, JAXB, Libraries, Security, Sound, and 2D components in OpenJDK. An untrusted Java application or applet could use these flaws to bypass certain Java sandbox restrictions. (CVE-2014-2412 , CVE-2014-0451 , CVE-2014-0458 , CVE-2014-2423 , CVE-2014-0452 , CVE-2014-2414 , CVE-2014-2402 , CVE-2014-0446 , CVE-2014-2413 , CVE-2014-0454 , CVE-2014-2427 , CVE-2014-0459 )Multiple flaws were identified in the Java Naming and Directory Interface (JNDI) DNS client. These flaws could make it easier for a remote attacker to perform DNS spoofing attacks. (CVE-2014-0460 )It was discovered that the JAXP component did not properly prevent access to arbitrary files when a SecurityManager was present. This flaw could cause a Java application using JAXP to leak sensitive information, or affect application availability. (CVE-2014-2403 )It was discovered that the Security component in OpenJDK could leak some timing information when performing PKCS#1 unpadding. This could possibly lead to the disclosure of some information that was meant to be protected by encryption. (CVE-2014-0453 )It was discovered that the fix for CVE-2013-5797  did not properly resolve input sanitization flaws in javadoc. When javadoc documentation was generated from an untrusted Java source code and hosted on a domain not controlled by the code author, these issues could make it easier to perform cross-site scripting (XSS) attacks. (CVE-2014-2398 )An insecure temporary file use flaw was found in the way the unpack200 utility created log files. A local attacker could possibly use this flaw to perform a symbolic link attack and overwrite arbitrary files with the privileges of the user running unpack200. (CVE-2014-1876 )"); 
script_tag(name : "solution", value : "Run yum update java-1.7.0-openjdk to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2014-327.html");
script_cve_id("CVE-2014-0446","CVE-2013-5797","CVE-2014-2427","CVE-2014-2421","CVE-2014-0429","CVE-2014-2414","CVE-2014-2402","CVE-2014-2403","CVE-2014-2413","CVE-2014-2412","CVE-2014-2423","CVE-2014-2397","CVE-2014-1876","CVE-2014-2398","CVE-2014-0457","CVE-2014-0456","CVE-2014-0455","CVE-2014-0454","CVE-2014-0453","CVE-2014-0452","CVE-2014-0451","CVE-2014-0460","CVE-2014-0461","CVE-2014-0459","CVE-2014-0458");
script_tag(name:"cvss_base", value:"10.0");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/amazon_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_tag(name:"summary", value:"Amazon Linux Local Security Checks");
script_copyright("Eero Volotinen");
script_family("Amazon Linux Local Security Checks");
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
if(release == "AMAZON")
{
if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-demo", rpm:"java-1.7.0-openjdk-demo~1.7.0.55~2.4.7.1.40.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-src", rpm:"java-1.7.0-openjdk-src~1.7.0.55~2.4.7.1.40.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk", rpm:"java-1.7.0-openjdk~1.7.0.55~2.4.7.1.40.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-debuginfo", rpm:"java-1.7.0-openjdk-debuginfo~1.7.0.55~2.4.7.1.40.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-devel", rpm:"java-1.7.0-openjdk-devel~1.7.0.55~2.4.7.1.40.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-javadoc", rpm:"java-1.7.0-openjdk-javadoc~1.7.0.55~2.4.7.1.40.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}