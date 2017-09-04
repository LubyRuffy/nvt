###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for tomcat5 RHSA-2013:0640-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "Apache Tomcat is a servlet container.

  It was found that when an application used FORM authentication, along with
  another component that calls request.setUserPrincipal() before the call to
  FormAuthenticator#authenticate() (such as the Single-Sign-On valve), it was
  possible to bypass the security constraint checks in the FORM authenticator
  by appending /j_security_check to the end of a URL. A remote attacker
  with an authenticated session on an affected application could use this
  flaw to circumvent authorization controls, and thereby access resources not
  permitted by the roles associated with their authenticated session.
  (CVE-2012-3546)

  Multiple weaknesses were found in the Tomcat DIGEST authentication
  implementation, effectively reducing the security normally provided by
  DIGEST authentication. A remote attacker could use these flaws to perform
  replay attacks in some circumstances. (CVE-2012-5885, CVE-2012-5886,
  CVE-2012-5887)

  Users of Tomcat should upgrade to these updated packages, which correct
  these issues. Tomcat must be restarted for this update to take effect.";


tag_affected = "tomcat5 on Red Hat Enterprise Linux (v. 5 server)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2013-March/msg00042.html");
  script_id(870965);
  script_version("$Revision: 6687 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-12 11:46:43 +0200 (Wed, 12 Jul 2017) $");
  script_tag(name:"creation_date", value:"2013-03-15 09:50:44 +0530 (Fri, 15 Mar 2013)");
  script_cve_id("CVE-2012-3546", "CVE-2012-5885", "CVE-2012-5886", "CVE-2012-5887");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_xref(name: "RHSA", value: "2013:0640-01");
  script_name("RedHat Update for tomcat5 RHSA-2013:0640-01");

  script_summary("Check for the Version of tomcat5");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
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

if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"tomcat5", rpm:"tomcat5~5.5.23~0jpp.38.el5_9", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tomcat5-admin-webapps", rpm:"tomcat5-admin-webapps~5.5.23~0jpp.38.el5_9", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tomcat5-common-lib", rpm:"tomcat5-common-lib~5.5.23~0jpp.38.el5_9", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tomcat5-debuginfo", rpm:"tomcat5-debuginfo~5.5.23~0jpp.38.el5_9", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tomcat5-jasper", rpm:"tomcat5-jasper~5.5.23~0jpp.38.el5_9", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tomcat5-jasper-javadoc", rpm:"tomcat5-jasper-javadoc~5.5.23~0jpp.38.el5_9", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tomcat5-jsp", rpm:"tomcat5-jsp~2.0~api~5.5.23~0jpp.38.el5_9", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tomcat5-jsp", rpm:"tomcat5-jsp~2.0~api~javadoc~5.5.23~0jpp.38.el5_9", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tomcat5-server-lib", rpm:"tomcat5-server-lib~5.5.23~0jpp.38.el5_9", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tomcat5-servlet", rpm:"tomcat5-servlet~2.4~api~5.5.23~0jpp.38.el5_9", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tomcat5-servlet", rpm:"tomcat5-servlet~2.4~api~javadoc~5.5.23~0jpp.38.el5_9", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tomcat5-webapps", rpm:"tomcat5-webapps~5.5.23~0jpp.38.el5_9", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}