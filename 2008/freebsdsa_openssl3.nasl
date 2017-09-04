#
#ADV FreeBSD-SA-06:19.openssl.asc
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from vuxml or freebsd advisories
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2008 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisories, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
#

tag_insight = "FreeBSD includes software from the OpenSSL Project.  The OpenSSL Project is
a collaborative effort to develop a robust, commercial-grade, full-featured,
and Open Source toolkit implementing the Secure Sockets Layer (SSL v2/v3)
and Transport Layer Security (TLS v1) protocols as well as a full-strength
general purpose cryptography library.

PKCS#1 v1.5 is a standard for padding data before performing a
cryptographic operation using the RSA algorithm.  PKCS#1 v1.5 signatures
are for example used in X.509 certificates.

RSA public keys may use a variety of public exponents, of which 3, 17, and
65537 are most common.  As a result of a number of known attacks, most keys
generated recently use a public exponent of at least 65537.

When verifying a PKCS#1 v1.5 signature, OpenSSL ignores any bytes which
follow the cryptographic hash being signed.  In a valid signature there
will be no such bytes.";
tag_solution = "Upgrade your system to the appropriate stable release
or security branch dated after the correction date

https://secure1.securityspace.com/smysecure/catid.html?in=FreeBSD-SA-06:19.openssl.asc";
tag_summary = "The remote host is missing an update to the system
as announced in the referenced advisory FreeBSD-SA-06:19.openssl.asc";

                                                                                
if(description)
{
 script_id(57326);
 script_version("$Revision: 4175 $");
 script_tag(name:"last_modification", value:"$Date: 2016-09-29 07:45:50 +0200 (Thu, 29 Sep 2016) $");
 script_tag(name:"creation_date", value:"2008-09-04 20:41:11 +0200 (Thu, 04 Sep 2008)");
 script_cve_id("CVE-2006-4339");
 script_tag(name:"cvss_base", value:"4.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
 name = "FreeBSD Security Advisory (FreeBSD-SA-06:19.openssl.asc)";
 script_name(name);


 summary = "FreeBSD Security Advisory (FreeBSD-SA-06:19.openssl.asc)";

 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2006 E-Soft Inc. http://www.securityspace.com");
 family = "FreeBSD Local Security Checks";
 script_family(family);
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/freebsdpatchlevel", "login/SSH/success");
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-bsd.inc");
vuln = 0;
if(patchlevelcmp(rel:"6.1", patchlevel:"6")<0) {
    vuln = 1;
}
if(patchlevelcmp(rel:"6.0", patchlevel:"11")<0) {
    vuln = 1;
}
if(patchlevelcmp(rel:"5.5", patchlevel:"4")<0) {
    vuln = 1;
}
if(patchlevelcmp(rel:"5.4", patchlevel:"18")<0) {
    vuln = 1;
}
if(patchlevelcmp(rel:"5.3", patchlevel:"33")<0) {
    vuln = 1;
}
if(patchlevelcmp(rel:"4.11", patchlevel:"21")<0) {
    vuln = 1;
}

if(vuln) {
    security_message(0);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}