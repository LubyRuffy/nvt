# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2012-0748.nasl 6557 2017-07-06 11:55:33Z cfischer $
 
# Authors: 
# Eero Volotinen <eero.volotinen@solinor.com> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://solinor.com
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
#
if(description)
 {
script_oid("1.3.6.1.4.1.25623.1.0.123885");
script_version("$Revision: 6557 $");
script_tag(name:"creation_date", value:"2015-10-06 14:09:51 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:55:33 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2012-0748");
script_tag(name: "insight", value: "ELSA-2012-0748 -  libvirt security, bug fix, and enhancement update - [libvirt-0.9.10-21.0.1.el6]- Replace docs/et.png in tarball with blank image[libvirt-0.9.10-21.el6]- qemu: Rollback on used USB devices (rhbz#743671)- qemu: Dont delete USB device on failed qemuPrepareHostdevUSBDevices (rhbz#743671)- Revert 'rpc: Discard non-blocking calls only when necessary' (rhbz#821468)[libvirt-0.9.10-20.el6]- Fix virDomainDeviceInfoIsSet() to check all struct fields (rhbz#820869)- Fix logic for assigning PCI addresses to USB2 companion controllers (rhbz#820869)- Set a sensible default master start port for ehci companion controllers (rhbz#820869)[libvirt-0.9.10-19.el6]- build: Fix the typo in configure.ac (rhbz#820461)- qemu: Fix build when !HAVE_NUMACTL (rhbz#820461)- usb: Fix crash when failing to attach a second usb device (rhbz#815755)- qemu: Use the CPU index in capabilities to map NUMA node to cpu list. (rhbz#820461)- qemu: Set memory policy using cgroup if placement is auto (rhbz#820461)[libvirt-0.9.10-18.el6]- numad: Set memory policy from numad advisory nodeset (rhbz#810157)[by default (rhbz#810157)][(rhbz#810157)]- qemu: Avoid the memory allocation and freeing (rhbz#810157)- numad: Divide cur_balloon by 1024 before passing it to numad (rhbz#810157)- numad: Check numactl-devel if compiled with numad support (rhbz#810157)[libvirt-0.9.10-17.el6]- qemu: Dont modify domain on failed blockiotune (rhbz#819014)- qemu: Reject blockiotune if qemu too old (rhbz#819014)- qemu: Dont use virDomainDefFormat* directly (rhbz#815503)- qemu: Emit compatible XML when migrating a domain (rhbz#815503)- usb: Create functions to search usb device accurately (rhbz#815755)- qemu: Call usb search function for hostdev initialization and hotplug (rhbz#815755)- virsh: Avoid heap corruption leading to virsh abort (rhbz#819636)- util: Fix libvirtd startup failure due to netlink error (rhbz#816465)- util: Allow specifying both src and dst pid in virNetlinkCommand (rhbz#816465)- util: Function to get local nl_pid used by netlink event socket (rhbz#816465)- util: Set src_pid for virNetlinkCommand when appropriate (rhbz#816465)- domain_conf: Add 'usbredir' to list of valid spice channels (rhbz#819498)- domain_conf: Add 'default' to list of valid spice channels (rhbz#819499)- snapshot: Allow block devices past cgroup (rhbz#810200)- blockjob: Allow block devices past cgroup (rhbz#810200)- util: Avoid libvirtd crash in virNetDevTapCreate (rhbz#817234)- python: Fix the forward_null error in Python binding codes (rhbz#771021)- xen: Fix resource leak in xen driver (rhbz#771021)- test: Fix resource leak in test driver (rhbz#771021)- node: Fix resource leak in nodeinfo.c (rhbz#771021)- virnet: Fix resource leak in virnetlink.c (rhbz#771021)- vmx: Fix resource leak (rhbz#771021)- qemu: Fix resource leak (rhbz#771021)- uuid: Fix possible non-terminated string (rhbz#771021)- node_device: Fix possible non-terminated string (rhbz#771021)[libvirt-0.9.10-16.el6]- qemuOpenFile: Dont force chown on NFS (rhbz#810241)- util: Fix crash when starting macvtap interfaces (rhbz#815270)- qemu: Fix segfault when host CPU is empty (rhbz#817078)- blockjob: Allow speed setting in block copy (rhbz#815791)- blockjob: Fix block-stream bandwidth race (rhbz#815791)[libvirt-0.9.10-15.el6]- qemu: Improve errors related to offline domains (rhbz#816662)- blockjob: Check for active vm before checking blockcopy bits (rhbz#816662)- qemu: Preserve original error during migration (rhbz#807907)- rpc: Discard non-blocking calls only when necessary (rhbz#807907)- qemu: Fix detection of failed migration (rhbz#807907)- qemu: Avoid bogus error at the end of tunnelled migration (rhbz#807907)- qemu: Make sure qemu can access its directory in hugetlbfs (rhbz#815206)- virsh: Fix docs for list command (rhbz#814021)- virsh: Fix and clarify the --title flag for the list command in man page (rhbz#814021)[libvirt-0.9.10-14.el6]- blockjob: Add new API flags (rhbz#638506)- blockjob: Add 'blockcopy' to virsh (rhbz#638506)- blockjob: Enhance xml to track mirrors across libvirtd restart (rhbz#638506)- blockjob: React to active block copy (rhbz#638506)- blockjob: Add qemu capabilities related to block jobs (rhbz#638506)- blockjob: Return appropriate event and info (rhbz#638506)- blockjob: Support pivot operation on cancel (rhbz#638506)- blockjob: Make drive-reopen safer (rhbz#638506)- blockjob: Implement block copy for qemu (rhbz#638506)- blockjob: Allow for existing files (rhbz#638506)- blockjob: Allow mirroring under SELinux (rhbz#638506)- blockjob: Accommodate RHEL backport names (rhbz#638506)- virsh: Avoid strtol (rhbz#813972)- conf: Tighten up XML integer parsing (rhbz#813972)- snapshot: Fix memory leak on error (rhbz#782457)- virsh: Avoid uninitialized memory usage (rhbz#814080)[libvirt-0.9.10-13.el6]- Fix a problem in the patchset, rhbz#811497 one was applied twice in -12- qemu, util: On restart of libvirt restart vepa callbacks (rhbz#812430)- qemu, util: Fix netlink callback registration for migration (rhbz#812430)- util: Only register callbacks for CREATE operations in virnetdevmacvlan.c (rhbz#812430)[libvirt-0.9.10-12.el6]- blockjob: Add qemu capabilities related to block pull jobs (rhbz#811683)- blockjob: Add API for async virDomainBlockJobAbort (rhbz#811683)- blockjob: Optimize JSON event handler lookup (rhbz#811683)- blockjob: Wire up qemu async virDomainBlockJobAbort (rhbz#811683)- blockjob: Allow for fast-finishing job (rhbz#811683)- virsh: Minor syntactic cleanups (rhbz#811683)- qemu: Use consistent error when qemu binary is too old (rhbz#811683)- blockjob: Add virsh blockpull --wait (rhbz#811683)- qemu: Fix deadlock when qemuDomainOpenConsole cleans up a connection (rhbz#811497)- qemu: Fix deadlock when qemuDomainOpenConsole cleans up a connection (rhbz#811497)- qemu: Fix mem leak in qemuProcessInitCpuAffinity (rhbz#810157)- numad: Convert node list to cpumap before setting affinity (rhbz#810157)- numad: Ignore cpuset if placement is auto (rhbz#810157)- conf: Do not parse cpuset only if the placement is auto (rhbz#810157)[libvirt-0.9.10-11.el6]- test: Fix segfault in networkxml2argvtest (rhbz#810100)- conf: Plug memory leaks on virDomainDiskDefParseXML (rhbz#575160)- qemu_ga: Dont overwrite errors on FSThaw (rhbz#808527)- Fix parallel build in docs/ directory (rhbz#810559)- qemu: Make migration fail when port profile association fails on the dst host (rhbz#811026)[to set the QEMU BIOS path (rhbz#811227)][libvirt-0.9.10-10.el6]- python: Add new helper functions for python to C conversion (rhbz#807751)- python: Make python APIs use these helper functions (rhbz#807751)- python: Improve conversion validation (rhbz#807751)- qemu_agent: Issue guest-sync prior to every command (rhbz#808527)- qemu: Fix memory leak in virDomainGetVcpus (rhbz#808979)- qemu: Reflect any memory rounding back to xml (rhbz#808522)- conf: Allow fuzz in XML with cur balloon > max (rhbz#808522)- qemu: Start nested job in qemuDomainCheckEjectableMedia (rhbz#803186)- virsh: Clarify escape sequence (rhbz#808652)- virsh: Plug memory leaks on failure path (rhbz#807555)- conf: Prevent crash of libvirtd without channel target name (rhbz#808371)- qemu: Dont leak temporary list of USB devices (rhbz#808459)- qemu: Delete USB devices used by domain on stop (rhbz#808459)- qemu: Build activeUsbHostdevs list on process reconnect (rhbz#808459)- qemu: Fix virtio+macvtap migration from 6.3 to older hosts (rhbz#806633)[libvirt-0.9.10-9.el6]- qemu: Avoid entering monitor with locked driver (rhbz#803186)- snapshot: Dont pass NULL to QMP command creation (rhbz#807147)[libvirt-0.9.10-8.el6]- rebuild, forgot to apply part of the patch- spec: Add missed dependancy for numad (rhbz#769930)[libvirt-0.9.10-7.el6]- snapshot: Make quiesce a bit safer (rhbz#804210)- python: Avoid memory leaks on libvirt_virNodeGetMemoryStats (rhbz#770944)- qemu: Use unlimited speed when migrating to file (rhbz#740099)- qemu: Add support for domain cleanup callbacks (rhbz#795305)- qemu: Avoid dangling migration-in job on shutoff domains (rhbz#795305)- qemu: Add connection close callbacks (rhbz#795305)- qemu: Make autodestroy utilize connection close callbacks (rhbz#795305)- qemu: Avoid dangling migration-out job when client dies (rhbz#795305)- python: Avoid memory leaks on libvirt_virNodeGetCPUStats (rhbz#770943)- util: Consolidate duplicated error messages in virnetlink.c (rhbz#693842)- python: Add virDomainGetCPUStats python binding API (rhbz#800366)- snapshot: Add qemu capability for 'transaction' command (rhbz#782457)- snapshot: Add atomic create flag (rhbz#782457)- snapshot: Make offline qemu snapshots atomic (rhbz#782457)- snapshot: Rudimentary qemu support for atomic disk snapshot (rhbz#782457)- snapshot: Add support for qemu transaction command (rhbz#782457)- snapshot: Wire up qemu transaction command (rhbz#782457)- snapshot: Improve qemu handling of reused snapshot targets (rhbz#782457)- Clarify virsh freecell manpage entry (rhbz#698521)- Add support for event tray moved of removable disks (rhbz#575160)- docs: Add documentation for new attribute tray of disk target (rhbz#575160)- conf: Parse and for the tray attribute (rhbz#575160)- qemu: Do not start with source for removable disks if tray is open (rhbz#575160)- qemu: Prohibit setting tray status as open for block type disk (rhbz#575160)- qemu: Update tray status while tray moved event is emitted (rhbz#575160)- build: Fix incorrect enum declaration (rhbz#575160)- spec: Add missed dependancy for numad (rhbz#769930)[libvirt-0.9.10-6.el6]- cpu: Add new flag supported by qemu to the cpu definition (rhbz#767364)- Added support for AMD Bulldozer CPU (rhbz#767364)- graphics: Cleanup port policy (rhbz#801443)- qemu: Reverse condition in qemuDomainCheckDiskPresence (rhbz#798938)- cpu: Add cpu definition for Intel Sandy Bridge cpu type (rhbz#761005)- cpu: Disable tsc-deadline feature not supported in qemu on RHEL 6.3 (rhbz#761005)- qemu: Support numad (rhbz#769930)- numad: Fix typo and warning (rhbz#769930)- qemu: Use scsi-block for lun passthrough instead of scsi-disk (rhbz#782034)- util: Make virDomainLeaseDefFree global (rhbz#802851)- qemu: Dont 'remove' hostdev objects from domain if operation fails (rhbz#802851)- util: Eliminate device object leaks related to virDomain*Remove*() (rhbz#802851)- virsh: Fix invalid free (rhbz#803591)- qemu: Eliminate memory leak in qemuDomainUpdateDeviceConfig (rhbz#802854)[devices (rhbz#802856)]- qemu: Fix segfault when detaching non-existent network device (rhbz#802644)- remote: Fix migration leaks (rhbz#798497)- virsh: Trim aliases from -h output (rhbz#796526)- Fix handling of blkio deviceWeight empty string (rhbz#804028)[libvirt-0.9.10-5.el6]- Avoid global variable shadowed (rhbz#737726)- Add nodeGetCPUmap() for getting available CPU IDs in a cpumap. (rhbz#737726)- Qemu driver for virDomainGetCPUstats using cpuacct cgroup. (rhbz#737726)- Cpu-stats command shows cpu statistics information of a domain. (rhbz#737726)- Ensure max_id is initialized in linuxParseCPUmap() (rhbz#737726)- rpc: Allow truncated return for virDomainGetCPUStats (rhbz#737726)- qemu: Dont parse device twice in attach/detach (rhbz#770031)- sanlock: Fix condition left crippled while debugging (rhbz#785736)- sanlock: Use STREQ_NULLABLE instead of STREQ on strings that may be null (rhbz#785736)- qemu: Fix startupPolicy for snapshot-revert (rhbz#798938)- util: Dont overflow on errno in virFileAccessibleAs (rhbz#798938)- blockResize: Add flag for bytes (rhbz#796526)- docs: Use correct terminology for 1024 bytes (rhbz#796526)- api: Add overflow error (rhbz#796526)- util: New function for scaling numbers (rhbz#796526)- xml: Share 'unit' in RNG (rhbz#796526)- xml: Output memory unit for clarity (rhbz#796526)- storage: Support more scaling suffixes (rhbz#796526)- xml: Drop unenforced minimum memory limit from RNG (rhbz#796526)- xml: Use long long internally, to centralize overflow checks (rhbz#796526)- xml: Use better types for memory values (rhbz#796526)- xml: Allow scaled memory on input (rhbz#796526)- virsh: Add option aliases (rhbz#796526)- virsh: Use option aliases (rhbz#796526)- virsh: Add command aliases, and rename nodedev-detach (rhbz#796526)- virsh: Improve storage unit parsing (rhbz#796526)- virsh: Improve memory unit parsing (rhbz#796526)- qemuBuildCommandLine: Dont add tlsPort if none set (rhbz#801443)- Removed more AMD-specific features from cpu64-rhel* models (rhbz#768450)- qemu: Support disk filenames with comma (rhbz#801970)- cpustats: Collect VM user and sys times (miss python bindings) (rhbz#800366)- cpustats: Report user and sys times (rhbz#800366)- qemu: Fix (managed)save and snapshots with host mode CPU (rhbz#801160)- qemu: Make block io tuning smarter (rhbz#770683)[libvirt-0.9.10-4.el6]- Improve error reporting when virsh console is run without a TTY (rhbz#729940)- pidfile: Make checking binary path in virPidFileRead optional (rhbz#729940)- Add flags for virDomainOpenConsole (rhbz#729940)- virsh: Add support for VIR_DOMAIN_CONSOLE_* flags (rhbz#729940)- fdstream: Emit stream abort callback even if poll() doesnt. (rhbz#729940)- fdstream: Add internal callback on stream close (rhbz#729940)- util: Add helpers for safe domain console operations (rhbz#729940)- qemu: Add ability to abort existing console while creating new one (rhbz#729940)- Fixed service handling in specfile (rhbz#786770)- qemu: Dont emit tls-port spice option if port is -1 (rhbz#798220)- docs: Comments wiping supported algorithms (rhbz#725013)- libvirt-guests: Add documentation and clean up to use virshs improved list (rhbz#693758)- libvirt-guests: Dont try to do a managed-save of transient guests (rhbz#693758)- virsh: Enhance list command to ease creation of shell scripts (rhbz#693758)- libvirt-guests: Check if URI is reachable before launching commands (rhbz#720691)- hooks: Add support for capturing hook output (rhbz#795127)- qemu: Add pre-migration hook (rhbz#795127)- Support for cpu64-rhel* qemu cpu models (rhbz#768450)- util: Add netlink event handling to virnetlink.c (rhbz#693842)- Add de-association handling to macvlan code (rhbz#693842)- qemu: Add ibmvscsi controller model (rhbz#782034)- qemu: Add virtio-scsi controller model (rhbz#782034)- conf: Add helper function to look up disk controller model (rhbz#782034)- conf: Introduce new attribute for device address format (rhbz#782034)- qemu: New cap flag to indicate if channel is supported by scsi-disk (rhbz#782034)- qemu: Build command line for the new address format (rhbz#782034)- tests: Add tests for virtio-scsi and ibmvscsi controllers (rhbz#782034)- virsh: Two new helper functions for disk device changes (rhbz#713932)- virsh: Use vshFindDisk and vshPrepareDiskXML in cmdDetachDisk (rhbz#713932)- virsh: New command cmdChangeMedia (rhbz#713932)- qemu: Require json for block jobs (rhbz#799055)- qemu: Pass block pull backing file to monitor (rhbz#799055)- virsh: Expose partial pull (rhbz#799055)- libvirt-guests: Add parallel startup and shutdown of guests (rhbz#625362)- qemu: Shared or readonly disks are always safe wrt migration (rhbz#751631)- util: Eliminate crash in virNetDevMacVLanCreateWithVPortProfile (rhbz#693842)- rpc: Fix client crash on connection close (rhbz#800185)- conf: Add missing device types to virDomainDevice(Type or Def) (rhbz#691539)- conf: Relocate virDomainDeviceDef and virDomainHostdevDef (rhbz#691539)- conf: Reorder static functions in domain_conf.c (rhbz#691539)- qemu: Rename virDomainDeviceInfoPtr variables to avoid confusion (rhbz#691539)- conf: Add device pointer to args of virDomainDeviceInfoIterate callback (rhbz#691539)- conf: Make hostdev info a separate object (rhbz#691539)- conf: HostdevDef parse/format helper functions (rhbz#691539)- conf: Give each hostdevdef a parent pointer (rhbz#691539)- conf: Put subsys part of virDomainHostdevDef into its own struct (rhbz#691539)- conf: Hostdev utility functions (rhbz#691539)- qemu: Re-order functions in qemu_hotplug.c (rhbz#691539)- qemu: Refactor hotplug detach of hostdevs (rhbz#691539)- conf: Parse/format type='hostdev' network interfaces (rhbz#691539)- qemu: Support type='hostdev' network devices at domain start (rhbz#691539)- conf: Change virDomainNetRemove from static to global (rhbz#691539)- qemu: Use virDomainNetRemove instead of inline code (rhbz#691539)- qemu: Support type=hostdev network device live hotplug attach/detach (rhbz#691539)- util: Two new pci util functions (rhbz#691539)- util: Support functions for mac/portprofile associations on hostdev (rhbz#691539)- util: Changes to support portprofiles for hostdevs (rhbz#691539)- qemu: Install port profile and mac address on netdev hostdevs (rhbz#691539)- Fix build after commit e3ba4025 (rhbz#693842)[libvirt-0.9.10-3.el6]- storage: Allow runtime detection of scrub missing build dep (rhbz#725013)- daemon: Plug memory leak (rhbz#795978)- daemon: Fix logic bug with virAsprintf (rhbz#795978)- util: Fix virFileAccessibleAs return path from parent (rhbz#795093)- Add support for unsafe migration (rhbz#751631)- virsh: Add --unsafe option to migrate command (rhbz#751631)- Introduce virStorageFileIsClusterFS (rhbz#751631)- qemu: Forbid migration with cache != none (rhbz#751631)- qemu: Nicer error message on failed graceful destroy (rhbz#795656)- Error out when using SPICE TLS with spice_tls=0 (rhbz#790436)- Revert 'spec: Mark directories in /var/run as ghosts' (rhbz#788985)- Fixed URI parsing (rhbz#785164)- virsh: Fix informational message in iface-bridge command (rhbz#797066)[libvirt-0.9.10-2.el6]- qemu: Set capabilities based on supported monitor commands (rhbz#766958)- qemu: Implement DomainPMSuspendForDuration (rhbz#766958)- snapshot: Fix snapshot deletion use-after-free (rhbz#790744)- storage: Allow runtime detection of scrub (rhbz#725013)- qemu: Unlock monitor when connecting to dest qemu fails (rhbz#783968)- qemu: Prevent crash of libvirtd without guest agent (rhbz#790745)- python: Expose virDomain{G,S}etInterfaceParameters APIs in python binding (rhbz#770971)[libvirt-0.9.10-1.el6]- Rebase to upstream 0.9.10 (rhbz#752433)- Add support for sVirt in the LXC driver- block rebase: add new API virDomainBlockRebase- API: Add api to set and get domain metadata- virDomainGetDiskErrors public API- conf: add rawio attribute to disk element of domain XML- Add new public API virDomainGetCPUStats()- Introduce virDomainPMSuspendForDuration API- resize: add virStorageVolResize() API- Add a virt-host-validate command to sanity check HV config- Add new virDomainShutdownFlags API- QEMU guest agent support- many improvements and bug fixes[libvirt-0.9.10-0rc2.el6]- Rebase to upstream 0.9.10 release candidate 2 (rhbz#752433)[libvirt-0.9.10-0rc1.el6]- Rebase to upstream 0.9.10 release candidate 1 (rhbz#752433)[libvirt-0.9.9-2.el6]- Remove dependancy to dmidecode for non PC arches (rhbz#782444)[libvirt-0.9.9-1.el6]- Rebase to upstream 0.9.9 (rhbz#752433)[libvirt-0.9.9-0rc1.el6]- Rebase to upstream 0.9.9 release candidate 1 (rhbz#752433)[libvirt-0.9.8-1.el6]- Rebase to upstream 0.9.8 (rhbz#752433)- some cleanups on the few remaining RHEL-only patches[libvirt-0.9.8-0rc2.el6]- Rebase to upstream 0.9.8 release candidate 2 (rhbz#752433)"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2012-0748");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2012-0748.html");
script_cve_id("CVE-2012-2693");
script_tag(name:"cvss_base", value:"3.7");
script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:N/C:P/I:P/A:P");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/oracle_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_copyright("Eero Volotinen");
script_family("Oracle Linux Local Security Checks");
exit(0);
}
include("revisions-lib.inc");
include("pkg-lib-rpm.inc");
release = get_kb_item("ssh/login/release");
res = "";
if(release == NULL)
{
 exit(0);
}
if(release == "OracleLinux6")
{
  if ((res = isrpmvuln(pkg:"libvirt", rpm:"libvirt~0.9.10~21.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"libvirt-client", rpm:"libvirt-client~0.9.10~21.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"libvirt-devel", rpm:"libvirt-devel~0.9.10~21.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"libvirt-lock-sanlock", rpm:"libvirt-lock-sanlock~0.9.10~21.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"libvirt-python", rpm:"libvirt-python~0.9.10~21.0.1.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
