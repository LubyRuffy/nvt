###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for acroread SUSE-SA:2010:022
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_impact = "remote code execution";
tag_affected = "acroread on openSUSE 11.0, openSUSE 11.1, openSUSE 11.2";
tag_insight = "Specially crafted PDF documents could crash acroread or even lead to
  execution of arbitrary code.";
tag_solution = "Please Install the Updated Packages.";


if(description)
{
  script_xref(name : "URL" , value : "http://www.novell.com/linux/security/advisories/2010_22_acroread.html");
  script_id(850132);
  script_version("$Revision: 6670 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:40:38 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2010-04-29 13:13:58 +0200 (Thu, 29 Apr 2010)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "SUSE-SA", value: "2010-022");
  script_cve_id("CVE-2010-0190", "CVE-2010-0191", "CVE-2010-0192", "CVE-2010-0193", "CVE-2010-0194", "CVE-2010-0195", "CVE-2010-0196", "CVE-2010-0197", "CVE-2010-0198", "CVE-2010-0199", "CVE-2010-0201", "CVE-2010-0202", "CVE-2010-0203", "CVE-2010-0204", "CVE-2010-1241");
  script_name("SuSE Update for acroread SUSE-SA:2010:022");

  script_summary("Check for the Version of acroread");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  script_tag(name : "impact" , value : tag_impact);
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

if(release == "openSUSE11.0")
{

  if ((res = isrpmvuln(pkg:"acroread", rpm:"acroread~9.3.2~0.1", rls:"openSUSE11.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "openSUSE11.1")
{

  if ((res = isrpmvuln(pkg:"acroread", rpm:"acroread~9.3.2~0.1.1", rls:"openSUSE11.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "openSUSE11.2")
{

  if ((res = isrpmvuln(pkg:"acroread", rpm:"acroread~9.3.2~0.2.1", rls:"openSUSE11.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}