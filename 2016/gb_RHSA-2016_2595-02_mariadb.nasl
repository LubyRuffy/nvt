###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for mariadb RHSA-2016:2595-02
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.871698");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-11-04 05:42:09 +0100 (Fri, 04 Nov 2016)");
  script_cve_id("CVE-2016-3492", "CVE-2016-5612", "CVE-2016-5616", "CVE-2016-5624",
                "CVE-2016-5626", "CVE-2016-5629", "CVE-2016-6662", "CVE-2016-6663",
                "CVE-2016-8283");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for mariadb RHSA-2016:2595-02");
  script_tag(name: "summary", value: "Check the version of mariadb");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "MariaDB is a multi-user, multi-threaded
SQL database server that is binary compatible with MySQL.

The following packages have been upgraded to a newer upstream version:
mariadb (5.5.52). (BZ#1304516, BZ#1377974)

Security Fix(es):

* It was discovered that the MariaDB logging functionality allowed writing
to MariaDB configuration files. An administrative database user, or a
database user with FILE privileges, could possibly use this flaw to run
arbitrary commands with root privileges on the system running the database
server. (CVE-2016-6662)

* A race condition was found in the way MariaDB performed MyISAM engine
table repair. A database user with shell access to the server running
mysqld could use this flaw to change permissions of arbitrary files
writable by the mysql system user. (CVE-2016-6663)

* This update fixes several vulnerabilities in the MariaDB database server.
Information about these flaws can be found on the Oracle Critical Patch
Update Advisory page, listed in the References section. (CVE-2016-3492,
CVE-2016-5612, CVE-2016-5616, CVE-2016-5624, CVE-2016-5626, CVE-2016-5629,
CVE-2016-8283)

Additional Changes:

For detailed information on changes in this release, see the Red Hat
Enterprise Linux 7.3 Release Notes linked from the References section.
");
  script_tag(name: "affected", value: "mariadb on Red Hat Enterprise Linux Server (v. 7)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "RHSA", value: "2016:2595-02");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2016-November/msg00031.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_7");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_7")
{

  if ((res = isrpmvuln(pkg:"mariadb", rpm:"mariadb~5.5.52~1.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mariadb-bench", rpm:"mariadb-bench~5.5.52~1.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mariadb-debuginfo", rpm:"mariadb-debuginfo~5.5.52~1.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mariadb-devel", rpm:"mariadb-devel~5.5.52~1.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mariadb-libs", rpm:"mariadb-libs~5.5.52~1.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mariadb-server", rpm:"mariadb-server~5.5.52~1.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mariadb-test", rpm:"mariadb-test~5.5.52~1.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
