###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for cpio CESA-2010:0144 centos5 i386
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "GNU cpio copies files into or out of a cpio or tar archive.

  A heap-based buffer overflow flaw was found in the way cpio expanded
  archive files. If a user were tricked into expanding a specially-crafted
  archive, it could cause the cpio executable to crash or execute arbitrary
  code with the privileges of the user running cpio. (CVE-2010-0624)
  
  Red Hat would like to thank Jakob Lell for responsibly reporting the
  CVE-2010-0624 issue.
  
  A denial of service flaw was found in the way cpio expanded archive files.
  If a user expanded a specially-crafted archive, it could cause the cpio
  executable to crash. (CVE-2007-4476)
  
  Users of cpio are advised to upgrade to this updated package, which
  contains backported patches to correct these issues.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "cpio on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2010-March/016557.html");
  script_id(880653);
  script_version("$Revision: 6653 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:46:53 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name: "CESA", value: "2010:0144");
  script_cve_id("CVE-2007-4476", "CVE-2010-0624");
  script_name("CentOS Update for cpio CESA-2010:0144 centos5 i386");

  script_summary("Check for the Version of cpio");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");


res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"cpio", rpm:"cpio~2.6~23.el5_4.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}