###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_nfs_ls_net.nasl 5499 2017-03-06 13:06:09Z teissa $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Patrik Karlsson, Djalal Harouni
# NASL-Wrapper: autogenerated
#
# Copyright:
# NSE-Script: The Nmap Security Scanner (http://nmap.org)
# Copyright (C) 2011 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

tag_summary = "Attempts to get useful information about files from NFS exports. The output is intended to resemble
the output of 'ls'.

The script starts by enumerating and mounting the remote NFS exports. After  that it performs an NFS
GETATTR procedure call for each mounted point in order to get its ACLs. For each mounted directory
the script will try to list its file entries with their attributes.

Since the file attributes shown in the results are the result of GETATTR, READDIRPLUS, and similar
procedures, the attributes are the attributes of the local filesystem.

These access permissions are shown only with NFSv3: * Read:     Read data from file or read a
directory. * Lookup:   Look up a name in a directory             (no meaning for non-directory
objects). * Modify:   Rewrite existing file data or modify existing             directory entries. *
Extend:   Write new data or add directory entries. * Delete:   Delete an existing directory entry. *
Execute:  Execute file (no meaning for a directory).


SYNTAX:

nfs.version:  number If set overrides the detected version of nfs


nfs-ls.human:  If set to '1' or 'true',
shows file sizes in a human readable format with suffixes like
'KB' and 'MB'.


nfs-ls.maxfiles:  If set, limits the amount of files returned by
the script when using the 'nfs-ls.dirlist' argument.
If set to 0
or less, all files are shown. The default value is 10.


nfs-ls.time:  Specifies which one of the last mac times to use in
the files attributes output. Possible values are:

- 'm': last modification time (mtime)

- 'a': last access time (atime)

- 'c': last change time (ctime)
The default value is 'm' (mtime).


mount.version:  number If set overrides the detected version of mountd


rpc.protocol:  table If set overrides the preferred order in which
protocols are tested. (ie. 'tcp', 'udp')";

if(description)
{
    script_id(104076);
    script_version("$Revision: 5499 $");
    script_tag(name:"last_modification", value:"$Date: 2017-03-06 14:06:09 +0100 (Mon, 06 Mar 2017) $");
    script_tag(name:"creation_date", value:"2011-06-01 16:32:46 +0200 (Wed, 01 Jun 2011)");
    script_tag(name:"cvss_base", value:"0.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
    script_name("Nmap NSE net: nfs-ls");


    script_category(ACT_INIT);
    script_tag(name:"qod_type", value:"remote_analysis");
    script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
    script_family("Nmap NSE net");
    script_dependencies("nmap_nse_net.nasl");
    script_mandatory_keys("Tools/Launch/nmap_nse_net");

    script_add_preference(name:"nfs.version", value:"", type:"entry");
    script_add_preference(name:"nfs-ls.human", value:"", type:"entry");
    script_add_preference(name:"nfs-ls.maxfiles", value:"", type:"entry");
    script_add_preference(name:"nfs-ls.time", value:"", type:"entry");
    script_add_preference(name:"mount.version", value:"", type:"entry");
    script_add_preference(name:"rpc.protocol", value:"", type:"entry");

    script_tag(name : "summary" , value : tag_summary);
    exit(0);
}


include("nmap.inc");


phase = 0;
if (defined_func("scan_phase")) {
    phase = scan_phase();
}

if (phase == 1) {
    # Get the preferences
    argv = make_array();

    pref = script_get_preference("nfs.version");
    if (!isnull(pref) && pref != "") {
        argv["nfs.version"] = string('"', pref, '"');
    }
    pref = script_get_preference("nfs-ls.human");
    if (!isnull(pref) && pref != "") {
        argv["nfs-ls.human"] = string('"', pref, '"');
    }
    pref = script_get_preference("nfs-ls.maxfiles");
    if (!isnull(pref) && pref != "") {
        argv["nfs-ls.maxfiles"] = string('"', pref, '"');
    }
    pref = script_get_preference("nfs-ls.time");
    if (!isnull(pref) && pref != "") {
        argv["nfs-ls.time"] = string('"', pref, '"');
    }
    pref = script_get_preference("mount.version");
    if (!isnull(pref) && pref != "") {
        argv["mount.version"] = string('"', pref, '"');
    }
    pref = script_get_preference("rpc.protocol");
    if (!isnull(pref) && pref != "") {
        argv["rpc.protocol"] = string('"', pref, '"');
    }
    nmap_nse_register(script:"nfs-ls", args:argv);
} else if (phase == 2) {
    res = nmap_nse_get_results(script:"nfs-ls");
    foreach portspec (keys(res)) {
        output_banner = 'Result found by Nmap Security Scanner (nfs-ls.nse) http://nmap.org:\n\n';
        if (portspec == "0") {
            log_message(data:output_banner + res[portspec], port:0);
        } else {
            v = split(portspec, sep:"/", keep:0);
            proto = v[0];
            port = v[1];
            log_message(data:output_banner + res[portspec], port:port, protocol:proto);
        }
    }
}