###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for linux USN-1380-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "The linux kernel did not properly account for PTE pages when deciding which
  task to kill in out of memory conditions. A local, unprivileged could
  exploit this flaw to cause a denial of service. (CVE-2011-2498)

  A flaw was discovered in the TOMOYO LSM's handling of mount system calls.
  An unprivileged user could oops the system causing a denial of service.
  (CVE-2011-2518)

  A bug was discovered in the Linux kernel's calculation of OOM (Out of
  memory) scores, that would result in the wrong process being killed. A user
  could use this to kill the process with the highest OOM score, even if that
  process belongs to another user or the system. (CVE-2011-4097)

  A flaw was found in the linux kernels IPv4 IGMP query processing. A remote
  attacker could exploit this to cause a denial of service. (CVE-2012-0207)";

tag_summary = "Ubuntu Update for Linux kernel vulnerabilities USN-1380-1";
tag_affected = "linux on Ubuntu 11.04";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://lists.ubuntu.com/archives/ubuntu-security-announce/2012-February/001609.html");
  script_id(840913);
  script_tag(name:"cvss_base", value:"7.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
 script_version("$Revision: 6643 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:00:30 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-03-07 11:19:20 +0530 (Wed, 07 Mar 2012)");
  script_cve_id("CVE-2011-2498", "CVE-2011-2518", "CVE-2011-4097", "CVE-2012-0207");
  script_xref(name: "USN", value: "1380-1");
  script_name("Ubuntu Update for linux USN-1380-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages");
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU11.04")
{

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.38-13-generic", ver:"2.6.38-13.56", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.38-13-generic-pae", ver:"2.6.38-13.56", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.38-13-omap", ver:"2.6.38-13.56", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.38-13-powerpc", ver:"2.6.38-13.56", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.38-13-powerpc-smp", ver:"2.6.38-13.56", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.38-13-powerpc64-smp", ver:"2.6.38-13.56", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.38-13-server", ver:"2.6.38-13.56", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.38-13-versatile", ver:"2.6.38-13.56", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.38-13-virtual", ver:"2.6.38-13.56", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}