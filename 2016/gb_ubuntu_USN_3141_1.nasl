###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for thunderbird USN-3141-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.842967");
  script_version("$Revision: 6647 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:04:05 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-12-01 05:39:07 +0100 (Thu, 01 Dec 2016)");
  script_cve_id("CVE-2016-5290", "CVE-2016-5291", "CVE-2016-5296", "CVE-2016-5297", "CVE-2016-9066", "CVE-2016-9079");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for thunderbird USN-3141-1");
  script_tag(name: "summary", value: "Check the version of thunderbird");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Christian Holler, Jon Coppeard, Olli Pettay,
  Ehsan Akhgari, Gary Kwong, Tooru Fujisawa, and Randell Jesup discovered multiple
  memory safety issues in Thunderbird. If a user were tricked in to opening a
  specially crafted message, an attacker could potentially exploit these to cause a
  denial of service via application crash, or execute arbitrary code. (CVE-2016-5290)

A same-origin policy bypass was discovered with local HTML files in some
circumstances. An attacker could potentially exploit this to obtain
sensitive information. (CVE-2016-5291)

A heap buffer-overflow was discovered in Cairo when processing SVG
content. If a user were tricked in to opening a specially crafted message,
an attacker could potentially exploit this to cause a denial of service
via application crash, or execute arbitrary code. (CVE-2016-5296)

An error was discovered in argument length checking in Javascript. If a
user were tricked in to opening a specially crafted website in a browsing
context, an attacker could potentially exploit this to cause a denial of
service via application crash, or execute arbitrary code. (CVE-2016-5297)

A buffer overflow was discovered in nsScriptLoadHandler. If a user were
tricked in to opening a specially crafted website in a browsing context,
an attacker could potentially exploit this to cause a denial of service
via application crash, or execute arbitrary code. (CVE-2016-9066)

A use-after-free was discovered in SVG animations. If a user were tricked
in to opening a specially crafted website in a browsing context, an
attacker could exploit this to cause a denial of service via application
crash, or execute arbitrary code. (CVE-2016-9079)");
  script_tag(name: "affected", value: "thunderbird on Ubuntu 16.04 LTS ,
  Ubuntu 14.04 LTS ,
  Ubuntu 12.04 LTS,
  Ubuntu 16.10");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "USN", value: "3141-1");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-3141-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"thunderbird", ver:"1:45.5.1+build1-0ubuntu0.14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"thunderbird", ver:"1:45.5.1+build1-0ubuntu0.12.04.1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"thunderbird", ver:"1:45.5.1+build1-0ubuntu0.16.04.1", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU16.10")
{

  if ((res = isdpkgvuln(pkg:"thunderbird", ver:"1:45.5.1+build1-0ubuntu0.16.10.1", rls:"UBUNTU16.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}