###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for librsvg2 RHSA-2011:1289-01
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
tag_insight = "The librsvg2 packages provide an SVG (Scalable Vector Graphics) library
  based on libart.

  A flaw was found in the way librsvg2 parsed certain SVG files. An attacker
  could create a specially-crafted SVG file that, when opened, would cause
  applications that use librsvg2 (such as Eye of GNOME) to crash or,
  potentially, execute arbitrary code. (CVE-2011-3146)

  Red Hat would like to thank the Ubuntu Security Team for reporting this
  issue. The Ubuntu Security Team acknowledges Sauli Pahlman as the original
  reporter.

  All librsvg2 users should upgrade to these updated packages, which contain
  a backported patch to correct this issue. All running applications that use
  librsvg2 must be restarted for this update to take effect.";

tag_affected = "librsvg2 on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2011-September/msg00013.html");
  script_id(870619);
  script_tag(name:"cvss_base", value:"6.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
 script_version("$Revision: 6686 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-12 11:46:01 +0200 (Wed, 12 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-07-09 10:34:44 +0530 (Mon, 09 Jul 2012)");
  script_cve_id("CVE-2011-3146");
  script_xref(name: "RHSA", value: "2011:1289-01");
  script_name("RedHat Update for librsvg2 RHSA-2011:1289-01");

  script_summary("Check for the Version of librsvg2");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
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

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"librsvg2", rpm:"librsvg2~2.26.0~5.el6_1.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"librsvg2-debuginfo", rpm:"librsvg2-debuginfo~2.26.0~5.el6_1.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"librsvg2-devel", rpm:"librsvg2-devel~2.26.0~5.el6_1.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}