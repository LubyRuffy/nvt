###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for linux-ti-omap4 USN-1930-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_id(841538);
  script_version("$Revision: 6644 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:01:20 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2013-08-27 10:02:18 +0530 (Tue, 27 Aug 2013)");
  script_cve_id("CVE-2013-2148", "CVE-2013-2852");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Ubuntu Update for linux-ti-omap4 USN-1930-1");

  tag_insight = "An information leak was discovered in the Linux kernel's fanotify
interface. A local user could exploit this flaw to obtain sensitive
information from kernel memory. (CVE-2013-2148)

Kees Cook discovered a format string vulnerability in the Broadcom B43
wireless driver for the Linux kernel. A local user could exploit this flaw
to gain administrative privileges. (CVE-2013-2852)";

  tag_affected = "linux-ti-omap4 on Ubuntu 12.04 LTS";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "USN", value: "1930-1");
  script_xref(name: "URL" , value: "https://lists.ubuntu.com/archives/ubuntu-security-announce/2013-August/002218.html");
  script_summary("Check for the Version of linux-ti-omap4");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
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

if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"linux-image-3.2.0-1436-omap4", ver:"3.2.0-1436.55", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}