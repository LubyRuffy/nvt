###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for glibc CESA-2012:0393 centos6 
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
tag_insight = "The glibc packages provide the standard C and standard math libraries used
  by multiple programs on the system. Without these libraries, the Linux
  system cannot function correctly.

  An integer overflow flaw was found in the implementation of the printf
  functions family. This could allow an attacker to bypass FORTIFY_SOURCE
  protections and execute arbitrary code using a format string flaw in
  an application, even though these protections are expected to limit the
  impact of such flaws to an application abort. (CVE-2012-0864)
  
  This update also fixes the following bugs:
  
  * Previously, the dynamic loader generated an incorrect ordering for
  initialization according to the ELF specification. This could result in
  incorrect ordering of DSO constructors and destructors. With this update,
  dependency resolution has been fixed. (BZ#783999)
  
  * Previously, locking of the main malloc arena was incorrect in the retry
  path. This could result in a deadlock if an sbrk request failed. With this
  update, locking of the main arena in the retry path has been fixed. This
  issue was exposed by a bug fix provided in the RHSA-2012:0058 update.
  (BZ#795328)
  
  * Calling memcpy with overlapping arguments on certain processors would
  generate unexpected results. While such code is a clear violation of
  ANSI/ISO standards, this update restores prior memcpy behavior. (BZ#799259)
  
  All users of glibc are advised to upgrade to these updated packages, which
  contain patches to resolve these issues.";

tag_affected = "glibc on CentOS 6";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2012-March/018503.html");
  script_id(881169);
  script_version("$Revision: 6654 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:48:17 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-07-30 16:32:18 +0530 (Mon, 30 Jul 2012)");
  script_cve_id("CVE-2012-0864");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_xref(name: "CESA", value: "2012:0393");
  script_name("CentOS Update for glibc CESA-2012:0393 centos6 ");

  script_summary("Check for the Version of glibc");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
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

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"glibc", rpm:"glibc~2.12~1.47.el6_2.9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-common", rpm:"glibc-common~2.12~1.47.el6_2.9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-devel", rpm:"glibc-devel~2.12~1.47.el6_2.9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-headers", rpm:"glibc-headers~2.12~1.47.el6_2.9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-static", rpm:"glibc-static~2.12~1.47.el6_2.9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-utils", rpm:"glibc-utils~2.12~1.47.el6_2.9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nscd", rpm:"nscd~2.12~1.47.el6_2.9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}