###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for samba USN-2257-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.841871");
  script_version("$Revision: 6645 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:02:37 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-07-01 22:00:30 +0530 (Tue, 01 Jul 2014)");
  script_cve_id("CVE-2014-0178", "CVE-2014-0239", "CVE-2014-0244", "CVE-2014-3493");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_name("Ubuntu Update for samba USN-2257-1");

  tag_insight = "Christof Schmitt discovered that Samba incorrectly initialized
a certain response field when vfs shadow copy was enabled. A remote
authenticated attacker could use this issue to possibly obtain sensitive
information. This issue only affected Ubuntu 13.10 and Ubuntu 14.04 LTS.
(CVE-2014-0178)

It was discovered that the Samba internal DNS server incorrectly handled QR
fields when processing incoming DNS messages. A remote attacker could use
this issue to cause Samba to consume resources, resulting in a denial of
service. This issue only affected Ubuntu 14.04 LTS. (CVE-2014-0239)

Daniel Berteaud discovered that the Samba NetBIOS name service daemon
incorrectly handled certain malformed packets. A remote attacker could use
this issue to cause Samba to consume resources, resulting in a denial of
service. This issue only affected Ubuntu 12.04 LTS, Ubuntu 13.10, and
Ubuntu 14.04 LTS. (CVE-2014-0244)

Simon Arlott discovered that Samba incorrectly handled certain unicode path
names. A remote authenticated attacker could use this issue to cause Samba
to stop responding, resulting in a denial of service. (CVE-2014-3493)";

  tag_affected = "samba on Ubuntu 14.04 LTS ,
  Ubuntu 13.10 ,
  Ubuntu 12.04 LTS ,
  Ubuntu 10.04 LTS";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "USN", value: "2257-1");
  script_xref(name: "URL" , value: "https://lists.ubuntu.com/archives/ubuntu-security-announce/2014-June/002563.html");
  script_summary("Check for the Version of samba");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
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

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"samba", ver:"2:4.1.6+dfsg-1ubuntu2.14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"samba", ver:"2:3.6.3-2ubuntu2.11", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"samba", ver:"2:3.4.7~dfsg-1ubuntu3.15", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU13.10")
{

  if ((res = isdpkgvuln(pkg:"samba", ver:"2:3.6.18-1ubuntu3.3", rls:"UBUNTU13.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}