###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for digikam FEDORA-2014-11448
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.868318");
  script_version("$Revision: 6629 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:33:41 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-10-01 16:59:45 +0530 (Wed, 01 Oct 2014)");
  script_cve_id("CVE-2014-5033");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Fedora Update for digikam FEDORA-2014-11448");
  script_tag(name: "insight", value: "digiKam is an easy to use and powerful digital photo management application,
which makes importing, organizing and manipulating digital photos a 'snap'.
An easy to use interface is provided to connect to your digital camera,
preview the images and download and/or delete them.

digiKam built-in image editor makes the common photo correction a simple task.
The image editor is extensible via plugins, can also make use of the KIPI image
handling plugins to extend its capabilities even further for photo
manipulations, import and export, etc. Install the kipi-plugins packages
to use them.
");
  script_tag(name: "affected", value: "digikam on Fedora 20");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name: "FEDORA", value: "2014-11448");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2014-September/138838.html");
  script_summary("Check for the Version of digikam");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC20")
{

  if ((res = isrpmvuln(pkg:"digikam", rpm:"digikam~4.3.0~2.fc20", rls:"FC20")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}