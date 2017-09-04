###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for java-1_7_0-openjdk SUSE-SU-2015:0336-1 (java-1_7_0-openjdk)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.850910");
  script_version("$Revision: 6675 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:54:28 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-10-16 14:05:27 +0200 (Fri, 16 Oct 2015)");
  script_cve_id("CVE-2014-3566", "CVE-2014-6549", "CVE-2014-6585", "CVE-2014-6587", "CVE-2014-6591", "CVE-2014-6593", "CVE-2014-6601", "CVE-2015-0383", "CVE-2015-0395", "CVE-2015-0400", "CVE-2015-0403", "CVE-2015-0406", "CVE-2015-0407", "CVE-2015-0408", "CVE-2015-0410", "CVE-2015-0412", "CVE-2015-0413", "CVE-2015-0421", "CVE-2015-0437");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for java-1_7_0-openjdk SUSE-SU-2015:0336-1 (java-1_7_0-openjdk)");
  script_tag(name: "summary", value: "Check the version of java-1_7_0-openjdk");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  java-1_7_0-openjdk was updated to fix 19 security issues.

  Details are available at
 http://www.oracle.com/technetwork/topics/security/cpujan2015-1972971.html#AppendixJAVA 

  Security Issues:

  * CVE-2014-6601
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-6601 
  * CVE-2015-0412
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0412 
  * CVE-2014-6549
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-6549 
  * CVE-2015-0408
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0408 
  * CVE-2015-0395
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0395 
  * CVE-2015-0437
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0437 
  * CVE-2015-0403
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0403 
  * CVE-2015-0421
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0421 
  * CVE-2015-0406
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0406 
  * CVE-2015-0383
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0383 
  * CVE-2015-0400
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0400 
  * CVE-2015-0407
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0407 
  * CVE-2015-0410
   
  Description truncated, for more information please check the Reference URL");
  script_tag(name: "affected", value: "java-1_7_0-openjdk on SUSE Linux Enterprise Desktop 11 SP3");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "SUSE-SU", value: "2015:0336_1");
  script_xref(name: "URL" , value: "http://lists.opensuse.org/opensuse-security-announce/2015-02/msg00024.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "SLED11.0SP3")
{

  if ((res = isrpmvuln(pkg:"java-1_7_0-openjdk", rpm:"java-1_7_0-openjdk~1.7.0.75~0.7.1", rls:"SLED11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_7_0-openjdk-demo", rpm:"java-1_7_0-openjdk-demo~1.7.0.75~0.7.1", rls:"SLED11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_7_0-openjdk-devel", rpm:"java-1_7_0-openjdk-devel~1.7.0.75~0.7.1", rls:"SLED11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}