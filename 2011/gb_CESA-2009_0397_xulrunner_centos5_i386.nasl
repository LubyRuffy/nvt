###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for xulrunner CESA-2009:0397 centos5 i386
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
tag_insight = "Mozilla Firefox is an open source Web browser. XULRunner provides the XUL
  Runtime environment for Mozilla Firefox.

  A memory corruption flaw was discovered in the way Firefox handles XML
  files containing an XSLT transform. A remote attacker could use this flaw
  to crash Firefox or, potentially, execute arbitrary code as the user
  running Firefox. (CVE-2009-1169)
  
  A flaw was discovered in the way Firefox handles certain XUL garbage
  collection events. A remote attacker could use this flaw to crash Firefox
  or, potentially, execute arbitrary code as the user running Firefox.
  (CVE-2009-1044)
  
  For technical details regarding these flaws, refer to the Mozilla security
  advisories. You can find a link to the Mozilla advisories in the References
  section of this errata.
  
  Firefox users should upgrade to these updated packages, which resolve these
  issues. For Red Hat Enterprise Linux 4, they contain backported patches to
  the firefox package. For Red Hat Enterprise Linux 5, they contain
  backported patches to the xulrunner packages. After installing the update,
  Firefox must be restarted for the changes to take effect.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "xulrunner on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2009-April/015756.html");
  script_id(880733);
  script_version("$Revision: 6653 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:46:53 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2009:0397");
  script_cve_id("CVE-2009-1044", "CVE-2009-1169");
  script_name("CentOS Update for xulrunner CESA-2009:0397 centos5 i386");

  script_summary("Check for the Version of xulrunner");
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

  if ((res = isrpmvuln(pkg:"xulrunner", rpm:"xulrunner~1.9.0.7~3.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xulrunner-devel", rpm:"xulrunner-devel~1.9.0.7~3.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xulrunner-devel-unstable", rpm:"xulrunner-devel-unstable~1.9.0.7~3.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}