###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for gdk-pixbuf2 RHSA-2015:1694-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.871441");
  script_version("$Revision: 12370 $");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2015-09-01 06:48:34 +0200 (Tue, 01 Sep 2015)");
  script_cve_id("CVE-2015-4491");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for gdk-pixbuf2 RHSA-2015:1694-01");
  script_tag(name: "summary", value: "Check the version of gdk-pixbuf2");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "gdk-pixbuf is an image loading library that can be extended by loadable
modules for new image formats. It is used by toolkits such as GTK+ or
clutter.

An integer overflow, leading to a heap-based buffer overflow, was found in
the way gdk-pixbuf, an image loading library for GNOME, scaled certain
bitmap format images. An attacker could use a specially crafted BMP image
file that, when processed by an application compiled against the gdk-pixbuf
library, would cause that application to crash or execute arbitrary code
with the permissions of the user running the application. (CVE-2015-4491)

Red Hat would like to thank the Mozilla project for reporting this issue.
Upstream acknowledges Gustavo Grieco as the original reporter.

All gdk-pixbuf2 users are advised to upgrade to these updated packages,
which contain a backported patch to correct this issue.
");
  script_tag(name: "affected", value: "gdk-pixbuf2 on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Server (v. 7),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "RHSA", value: "2015:1694-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2015-August/msg00064.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_(7|6)");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_7")
{

  if ((res = isrpmvuln(pkg:"gdk-pixbuf2", rpm:"gdk-pixbuf2~2.28.2~5.el7_1", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gdk-pixbuf2-debuginfo", rpm:"gdk-pixbuf2-debuginfo~2.28.2~5.el7_1", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gdk-pixbuf2-devel", rpm:"gdk-pixbuf2-devel~2.28.2~5.el7_1", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"gdk-pixbuf2", rpm:"gdk-pixbuf2~2.24.1~6.el6_7", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gdk-pixbuf2-debuginfo", rpm:"gdk-pixbuf2-debuginfo~2.24.1~6.el6_7", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gdk-pixbuf2-devel", rpm:"gdk-pixbuf2-devel~2.24.1~6.el6_7", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
