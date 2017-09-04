###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for cyrus-imapd CESA-2011:1508 centos5 x86_64
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
tag_insight = "The cyrus-imapd packages contain a high-performance mail server with IMAP,
  POP3, NNTP, and Sieve support.

  An authentication bypass flaw was found in the cyrus-imapd NNTP server,
  nntpd. A remote user able to use the nntpd service could use this flaw to
  read or post newsgroup messages on an NNTP server configured to require
  user authentication, without providing valid authentication credentials.
  (CVE-2011-3372)
  
  A NULL pointer dereference flaw was found in the cyrus-imapd IMAP server,
  imapd. A remote attacker could send a specially-crafted mail message to a
  victim that would possibly prevent them from accessing their mail normally,
  if they were using an IMAP client that relies on the server threading IMAP
  feature. (CVE-2011-3481)
  
  Red Hat would like to thank the Cyrus IMAP project for reporting the
  CVE-2011-3372 issue. Upstream acknowledges Stefan Cornelius of Secunia
  Research as the original reporter of CVE-2011-3372.
  
  Users of cyrus-imapd are advised to upgrade to these updated packages,
  which contain backported patches to correct these issues. After installing
  the update, cyrus-imapd will be restarted automatically.";

tag_affected = "cyrus-imapd on CentOS 5";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2011-December/018281.html");
  script_id(881425);
  script_version("$Revision: 6654 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:48:17 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-07-30 17:50:33 +0530 (Mon, 30 Jul 2012)");
  script_cve_id("CVE-2011-3372", "CVE-2011-3481");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name: "CESA", value: "2011:1508");
  script_name("CentOS Update for cyrus-imapd CESA-2011:1508 centos5 x86_64");

  script_summary("Check for the Version of cyrus-imapd");
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

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"cyrus-imapd", rpm:"cyrus-imapd~2.3.7~12.el5_7.2", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"cyrus-imapd-devel", rpm:"cyrus-imapd-devel~2.3.7~12.el5_7.2", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"cyrus-imapd-perl", rpm:"cyrus-imapd-perl~2.3.7~12.el5_7.2", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"cyrus-imapd-utils", rpm:"cyrus-imapd-utils~2.3.7~12.el5_7.2", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}