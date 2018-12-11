###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2018_4034_1.nasl 12755 2018-12-11 10:50:43Z santu $
#
# SuSE Update for ncurses openSUSE-SU-2018:4034-1 (ncurses)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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
  script_oid("1.3.6.1.4.1.25623.1.0.852171");
  script_version("$Revision: 12755 $");
  script_cve_id("CVE-2018-19211");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-12-11 11:50:43 +0100 (Tue, 11 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-12-10 07:38:51 +0100 (Mon, 10 Dec 2018)");
  script_name("SuSE Update for ncurses openSUSE-SU-2018:4034-1 (ncurses)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap42\.3");

  script_xref(name:"openSUSE-SU", value:"2018:4034_1");
  script_xref(name:"URL", value:"http://lists.opensuse.org/opensuse-security-announce/2018-12/msg00011.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'ncurses'
  package(s) announced via the openSUSE-SU-2018:4034_1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for ncurses fixes the following issue:

  Security issue fixed:

  - CVE-2018-19211: Fixed denial of service issue that was triggered by a
  NULL pointer dereference at function _nc_parse_entry (bsc#1115929).

  This update was imported from the SUSE:SLE-12:Update update project.


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 42.3:

  zypper in -t patch openSUSE-2018-1509=1");

  script_tag(name:"affected", value:"ncurses on openSUSE Leap 42.3.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "openSUSELeap42.3")
{

  if ((res = isrpmvuln(pkg:"libncurses5", rpm:"libncurses5~5.9~66.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libncurses5-debuginfo", rpm:"libncurses5-debuginfo~5.9~66.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libncurses6", rpm:"libncurses6~5.9~66.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libncurses6-debuginfo", rpm:"libncurses6-debuginfo~5.9~66.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ncurses-debugsource", rpm:"ncurses-debugsource~5.9~66.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ncurses-devel", rpm:"ncurses-devel~5.9~66.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ncurses-devel-debuginfo", rpm:"ncurses-devel-debuginfo~5.9~66.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ncurses-utils", rpm:"ncurses-utils~5.9~66.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ncurses-utils-debuginfo", rpm:"ncurses-utils-debuginfo~5.9~66.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tack", rpm:"tack~5.9~66.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tack-debuginfo", rpm:"tack-debuginfo~5.9~66.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"terminfo", rpm:"terminfo~5.9~66.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"terminfo-base", rpm:"terminfo-base~5.9~66.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libncurses5-32bit", rpm:"libncurses5-32bit~5.9~66.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libncurses5-debuginfo-32bit", rpm:"libncurses5-debuginfo-32bit~5.9~66.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libncurses6-32bit", rpm:"libncurses6-32bit~5.9~66.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libncurses6-debuginfo-32bit", rpm:"libncurses6-debuginfo-32bit~5.9~66.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ncurses-devel-32bit", rpm:"ncurses-devel-32bit~5.9~66.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ncurses-devel-debuginfo-32bit", rpm:"ncurses-devel-debuginfo-32bit~5.9~66.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
