###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for thunderbird USN-2053-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");

if(description)
{
  script_id(841653);
  script_version("$Revision: 6644 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:01:20 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2013-12-17 12:07:42 +0530 (Tue, 17 Dec 2013)");
  script_cve_id("CVE-2013-5609", "CVE-2013-5616", "CVE-2013-5618", "CVE-2013-6671",
                "CVE-2013-6673", "CVE-2013-5613", "CVE-2013-5615", "CVE-2013-6629",
                "CVE-2013-6630");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Ubuntu Update for thunderbird USN-2053-1");

  tag_insight = "Ben Turner, Bobby Holley, Jesse Ruderman and Christian Holler
discovered multiple memory safety issues in Thunderbird. If a user were
tricked in to opening a specially crafted message with scripting enabled, an
attacker could potentially exploit these to cause a denial of service via
application crash, or execute arbitrary code with the privileges of the
user invoking Thunderbird. (CVE-2013-5609)

Tyson Smith and Jesse Schwartzentruber discovered a use-after-free in
event listeners. If a user had enabled scripting, an attacker could
potentially exploit this to cause a denial of service via application
crash, or execute arbitrary code with the privileges of the user invoking
Thunderbird. (CVE-2013-5616)

A use-after-free was discovered in the table editing interface. An
attacker could potentially exploit this to cause a denial of service via
application crash, or execute arbitrary code with the privileges of the
user invoking Thunderbird. (CVE-2013-5618)

Tyson Smith and Jesse Schwartzentruber discovered a crash when inserting
an ordered list in to a document using script. If a user had enabled
scripting, an attacker could potentially exploit this to execute
arbitrary code with the privileges of the user invoking Thunderbird.
(CVE-2013-6671)

Sijie Xia discovered that trust settings for built-in EV root certificates
were ignored under certain circumstances, removing the ability for a user
to manually untrust certificates from specific authorities.
(CVE-2013-6673)

Tyson Smith, Jesse Schwartzentruber and Atte Kettunen discovered a
use-after-free in functions for synthetic mouse movement handling. If a
user had enabled scripting, an attacker could potentially exploit this
to cause a denial of service via application crash, or execute arbitrary
code with the privileges of the user invoking Thunderbird. (CVE-2013-5613)

Eric Faust discovered that GetElementIC typed array stubs can be generated
outside observed typesets. If a user had enabled scripting, an attacker
could possibly exploit this to cause undefined behaviour with a potential
security impact. (CVE-2013-5615)

Michal Zalewski discovered several issues with JPEG image handling. An
attacker could potentially exploit these to obtain sensitive information.
(CVE-2013-6629, CVE-2013-6630)";

  tag_affected = "thunderbird on Ubuntu 13.10 ,
  Ubuntu 13.04 ,
  Ubuntu 12.10 ,
  Ubuntu 12.04 LTS";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "USN", value: "2053-1");
  script_xref(name: "URL" , value: "https://lists.ubuntu.com/archives/ubuntu-security-announce/2013-December/002343.html");
  script_summary("Check for the Version of thunderbird");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages");
  exit(0);
}


include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU12.10")
{

  if ((res = isdpkgvuln(pkg:"thunderbird", ver:"1:24.2.0+build1-0ubuntu0.12.10.1", rls:"UBUNTU12.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"thunderbird", ver:"1:24.2.0+build1-0ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU13.10")
{

  if ((res = isdpkgvuln(pkg:"thunderbird", ver:"1:24.2.0+build1-0ubuntu0.13.10.1", rls:"UBUNTU13.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU13.04")
{

  if ((res = isdpkgvuln(pkg:"thunderbird", ver:"1:24.2.0+build1-0ubuntu0.13.04.1", rls:"UBUNTU13.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}