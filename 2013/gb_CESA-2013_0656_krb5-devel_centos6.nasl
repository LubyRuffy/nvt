###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for krb5-devel CESA-2013:0656 centos6 
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
tag_insight = "Kerberos is a network authentication system which allows clients and
  servers to authenticate to each other using symmetric encryption and a
  trusted third-party, the Key Distribution Center (KDC).

  When a client attempts to use PKINIT to obtain credentials from the KDC,
  the client can specify, using an issuer and serial number, which of the
  KDC's possibly-many certificates the client has in its possession, as a
  hint to the KDC that it should use the corresponding key to sign its
  response. If that specification was malformed, the KDC could attempt to
  dereference a NULL pointer and crash. (CVE-2013-1415)

  When a client attempts to use PKINIT to obtain credentials from the KDC,
  the client will typically format its request to conform to the
  specification published in RFC 4556. For interoperability reasons, clients
  and servers also provide support for an older, draft version of that
  specification. If a client formatted its request to conform to this older
  version of the specification, with a non-default key agreement option, it
  could cause the KDC to attempt to dereference a NULL pointer and crash.
  (CVE-2012-1016)

  All krb5 users should upgrade to these updated packages, which contain
  backported patches to correct these issues. After installing the updated
  packages, the krb5kdc daemon will be restarted automatically.";


tag_affected = "krb5-devel on CentOS 6";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2013-March/019654.html");
  script_id(881692);
  script_version("$Revision: 6655 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:48:58 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2013-03-19 09:38:25 +0530 (Tue, 19 Mar 2013)");
  script_cve_id("CVE-2012-1016", "CVE-2013-1415");
  script_tag(name:"cvss_base", value:"7.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:C");
  script_xref(name: "CESA", value: "2013:0656");
  script_name("CentOS Update for krb5-devel CESA-2013:0656 centos6 ");

  script_summary("Check for the Version of krb5-devel");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"krb5-devel", rpm:"krb5-devel~1.10.3~10.el6_4.1", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-libs", rpm:"krb5-libs~1.10.3~10.el6_4.1", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-pkinit-openssl", rpm:"krb5-pkinit-openssl~1.10.3~10.el6_4.1", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-server", rpm:"krb5-server~1.10.3~10.el6_4.1", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-server-ldap", rpm:"krb5-server-ldap~1.10.3~10.el6_4.1", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5-workstation", rpm:"krb5-workstation~1.10.3~10.el6_4.1", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"krb5", rpm:"krb5~1.10.3~10.el6_4.1", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}