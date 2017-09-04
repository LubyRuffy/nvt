# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2010-0271.nasl 6555 2017-07-06 11:54:09Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.122371");
script_version("$Revision: 6555 $");
script_tag(name:"creation_date", value:"2015-10-06 14:17:42 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:54:09 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2010-0271");
script_tag(name: "insight", value: "ELSA-2010-0271 -  kvm security, bug fix and enhancement update - [kvm-83-164.0.1.el5]- Add kvm-Introduce-oel-machine-type.patch- Add kvm-add-oracle-workaround-for-libvirt-bug.patch[kvm-83-164.el5]- kvm-Fix-Windows-guests-SVVP-tests.patch [bz#495844]- Resolves: bz#495844 (KVM SVVP: 'Signed Driver check' failure - on the disabled vCPUs (that the VM's BIOS doesn't hide))[kvm-83-163.el5]- kvm-kernel-avoid-collision-between-out-of-sync-ksm-and-pci-pass.patch [bz#566385]- Resolves: bz#566385 (KVM host panic due to fault in paging64_sync_page() / panic occurs in connection with PCI passthru devices)[kvm-83-162.el5]- kvm-qemu-img-rebase-Add-f-option.patch [bz#569762]- kvm-mark-PCI-IRQs-as-edge-triggered-in-mptables.patch [bz#536749]- Resolves: bz#536749 (can not boot rhel3.9 with if=virtio)- Resolves: bz#569762 ('qemu-img re-base' broken on block devices)- Moved kver to 2.6.18-191.el5 to match build root[kvm-83-161.el5]- kvm-qemu-img-Fix-segfault-during-rebase.patch [bz#563141]- Resolves: bz#563141 (qemu-img re-base subcommand got Segmentation fault)- Moved kver to 2.6.18-190.el5 to match build root[kvm-83-160.el5]- kvm-qxl-defer-vga-updates-in-case-commands-ring-is-full-.patch [bz#544785]- Resolves: bz#544785 (QEMU process can become non-responsive in case command are not pull from qxl vga ring)[kvm-83-159.el5]- Applied patch to spec file [bz#533453]- Updated kversion to 2.6.18-189.el5 to match build root- Resolves: bz#533453 (kvm kmod package should require a compatible kernel version)[kvm-83-158.el5]- Updated kversion to 2.6.18-187.el5 to match build root- kvm-kernel-KVM-Don-t-check-access-permission-when-loading-segme.patch [bz#563465]- kvm-kernel-KVM-Disable-move-to-segment-registers-and-jump-far-i.patch [bz#563465]- kvm-kernel-KVM-VMX-Check-cpl-before-emulating-debug-register-ac.patch [bz#563517]- Resolves: bz#563465 (EMBARGOED CVE-2010-0419 kvm: emulator privilege escalation segment selector check [rhel-5.5])- Resolves: bz#563517 (KVM: Check cpl before emulating debug register access [rhel-5.5])[kvm-83-157.el5]- kvm-CVE-2010-0297-usb-linux.c-fix-buffer-overflow.patch [bz#560770]- Resolves: bz#560770 (CVE-2010-0297 kvm-userspace-rhel5: usb-linux.c: fix buffer overflow [rhel-5.5])[kvm-83-156.el5]- kvm-kernel-KVM-PIT-control-word-is-write-only.patch [bz#553126]- kvm-kernel-KVM-introduce-kvm_read_guest_virt-kvm_write_guest_vi.patch [bz#559095]- kvm-kernel-KVM-remove-the-vmap-usage.patch [bz#559095]- kvm-kernel-KVM-Use-kvm_-read-write-_guest_virt-to-read-and-writ.patch [bz#559095]- kvm-kernel-KVM-fix-memory-access-during-x86-emulation.patch [bz#559095]- kvm-kernel-Check-IOPL-level-during-io-instruction-emulation.patch [bz#560698]- kvm-kernel-Fix-popf-emulation.patch [bz#560698]- kvm-kernel-Check-CPL-level-during-privilege-instruction-emulati.patch [bz#560698]- Resolves: bz#553126 (CVE-2010-0309 kvm: cat /dev/port in guest cause the host hang [rhel-5.5])- Resolves: bz#559095 (EMBARGOED CVE-2010-0298 kvm: emulator privilege escalation [rhel-5.5])- Resolves: bz#560698 (EMBARGOED CVE-2010-0306 kvm: emulator privilege escalation IOPL/CPL level check [rhel-5.5])[kvm-83-155.el5]- kvm-virtio-blk-Fix-reads-turned-into-writes-after-read-e.patch [bz#552487]- kvm-virtio-blk-Handle-bdrv_aio_read-write-NULL-return.patch [bz#552487]- Resolves: bz#552487 (Guest image corruption after RHEV-H update to 5.4-2.1.3.el5_4rhev2_1)- Moved kver to 2.6.18-186.el5 to match build root[kvm-83-154.el5]- kvm-qemu-img-Fix-qemu-img-with-backing-file.patch [bz#558195]- kvm-qemu-add-routines-for-atomic-16-bit-accesses.patch [bz#525323]- kvm-qemu-virtio-atomic-access-for-index-values.patch [bz#525323]- kvm-fix-ide-versioning.patch [bz#559163]- kvm-cpu-CPU_SAVE_VERSION-is-9-know.patch [bz#559163]- Resolves: bz#525323 (QEMU terminates without warning with virtio-net and SMP enabled)- Resolves: bz#558195 (kvm: NFS : kvm-qemu-img convert failure on RAW/Sparse template with COW/Sparse snapshot)- Resolves: bz#559163 (migration failed host 5.5 with -M rhel5.5.0 to host 5.5 with -M rhel5.5.0.)[kvm-83-153.el5]- kvm-qcow2-Fix-error-handling-in-qcow2_grow_l1_table.patch [bz#537077]- kvm-qcow2-Fix-error-handling-in-qcow_save_vmstate.patch [bz#537077]- kvm-qcow2-Return-0-errno-in-get_cluster_table.patch [bz#537077]- kvm-qcow2-Return-0-errno-in-qcow2_alloc_cluster_offset.patch [bz#537077]- kvm-block-Return-original-error-codes-in-bdrv_pread-writ.patch [bz#537077]- kvm-qcow2-Fix-error-handling-in-grow_refcount_table.patch [bz#537077]- kvm-qcow2-Improve-error-handling-in-update_refcount.patch [bz#537077]- kvm-qcow2-Allow-updating-no-refcounts.patch [bz#537077]- kvm-qcow2-Don-t-ignore-update_refcount-return-value.patch [bz#537077]- kvm-qcow2-Don-t-ignore-qcow2_alloc_clusters-return-value.patch [bz#537077]- Resolves: bz#537077 (error codes aren't always propagated up through the block layer (e.g. -ENOSPC))[kvm-83-152.el5]- kvm-Revert-Queue-notify-support-for-virtio-block-device.patch [bz#552250] (Reverts kvm-Queue-notify-support-for-virtio-block-device.patch)- Related: bz#552250 (Windows virtio block driver performs poorly on small size requests)[kvm-83-151.el5]- kvm-Fix-cpu-versioning.patch [bz#557327]- kvm-reduce-number-of-reinjects-on-ACK.patch [bz#556455]- Resolves: bz#556455 (KVM: WIN7-32bit blue screen (IMAGE_NAME: ntkrnlmp.exe).)- Resolves: bz#557327 (migration failed with -M rhel5.4.4 between host 5.5 and host 5.4.4)[kvm-83-150.el5]- kvm-vnc-more-keypad-fixing.patch [bz#497507]- kvm-qxl-add-netbooks-common-resolutions.-Rhel-5.5-552240.patch [bz#552240]- kvm-block-raw-posix-Abort-on-pread-beyond-end-of-file.patch [bz#515655]- Resolves: bz#497507 (Numeric keypad cannot be used in qemu monitor when using vnc to connect guest.)- Resolves: bz#515655 (Add result test to prevent Infinite loop in raw_pread, reading too large offset)- Resolves: bz#552240 (Spice (QXL) - please add 1024x576 resolution to the driver (netbooks))[kvm-83-149.el5]- kvm-qemu-qxl-fix-unsafe-rom-data-handling-bug-537888.patch [bz#537888]- kvm-qxl-fix-qxl-backwards-migration-to-version-3.patch [bz#537888]- kvm-Allow-export-of-sse4.1-sse4.2-cpuid-flags-to-guest.-.patch [bz#518090]- Resolves: bz#518090 ([RFE] KVM should be able to export advanced cpu flags to the guest)- Resolves: bz#537888 (fix unsafe device data handling)[kvm-83-148.el5]- Updated kversion to 2.6.18-185.el5 to match build root- Require qspice-libs to make sure the right libspice.so.0 file is installed- Related: bz#555657[kvm-83-147.el5]- kvm-block-Introduce-BDRV_O_NO_BACKING.patch [bz#530134]- kvm-qemu-img-rebase.patch [bz#530134]- kvm-vnc-improve-capslock-handling.patch [bz#517814]- kvm-block-Add-bdrv_change_backing_file.patch [bz#530134]- kvm-qemu-img-Automatically-detect-block-devices.patch [bz#537655]- Resolves: bz#517814 (Caps Lock the key's appearance of guest is not synchronous as host's --view kvm with vnc)- Resolves: bz#530134 (RFE - In-place backing file format change)- Resolves: bz#537655 (qemu-img: error creating a new preallocated volume image on FCP storage)[kvm-83-146.el5]- Require compatible etherboot-zroms-kvm package- Resolves: bz#550053 (require newer etherboot package that is compatible with new pxe ROM paths)[kvm-83-145.el5]- kvm-fix-barriers-support-during-migration.patch [bz#549938]- kvm-Add-machine-name-alias-support.patch [bz#553187]- kvm-make-pc-an-alias-of-rhel5.4.0.patch [bz#553187]- kvm-Introduce-rhel5.4.4-machine-type.patch [bz#553187]- Resolves: bz#549938 (Maintain barrier state after migration)- Resolves: bz#553187 (Add rhel-5.4.4 support to rhel5.5.0)[kvm-83-144.el5]- kvm-kernel-KVM-x86-Add-KVM_GET-SET_VCPU_EVENTS.patch [bz#541084]- Resolves: bz#541084 (KVM: x86: Add KVM_GET/SET_VCPU_EVENTS)- kvm-x86-Add-support-for-VCPU-event-states.patch [bz#541084]- kvm-BZ550265-compute-checksum-for-roms-bigger-than-a-seg.patch [bz#550265]- kvm-Fix-a-race-in-the-device-that-cuased-guest-stack-on-.patch [bz#503759]- kvm-Queue-notify-support-for-virtio-block-device.patch [bz#552250]- kvm-The-driver-device-pair-does-not-have-a-reset-option-.patch [bz#550755]- kvm-The-driver-device-pair-does-not-have-a-reset-option-2.patch [bz#550755]- Resolves: bz#503759 (hypercall device - Vm becomes non responsive on Sysmark benchmark (when more than 7 vm's running simultaneously))- Resolves: bz#541084 (KVM: x86: Add KVM_GET/SET_VCPU_EVENTS)- Resolves: bz#550265 (gPXE fails to PXE boot on e1000 virtual NIC)- Resolves: bz#550755 (Hypercall driver doesn't reset device on power-down)- Resolves: bz#552250 (Windows virtio block driver performs poorly on small size requests. In addition, cpu usage on the quest side is very high while handling write requests.)[kvm-83-143.el5]- kvm-Documentation-Fix-description-of-cache-option-for-dr.patch [bz#545194]- kvm-monitor-allow-device-to-be-ejected-if-no-disk-is-ins.patch [bz#539250]- Resolves: bz#539250 (Cannot eject cd-rom when configured to host cd-rom)- Resolves: bz#545194 (Discrepancy between man page and source code for qcow2 with regards to default value used when no explicit caching is specified)[kvm-83-142.el5]- Updated kversion to 2.6.18-183.el5 to match build root- kvm-removing-debugging-printf-leftover.patch [bz#530533]- kvm-enable_write_cache-is-one-bool-no-need-for-32bits.patch [bz#549938]- kvm-virtio_blk-save-if-cache-was-enabled.patch [bz#549938]- kvm-ide-propagate-version_id-to-all-save-load-functions.patch [bz#549938]- kvm-ide-save-if-cache-was-enabled.patch [bz#549938]- kvm-savevm-add-version_id-to-all-savevm-functions.patch [bz#541731]- kvm-We-need-current-machine-defined-sooner.patch [bz#541731]- kvm-Add-support-for-DeviceVersion-to-machine-type.patch [bz#541731]- kvm-Introduce-rhel5.4.0-machine-type.patch [bz#541731]- kvm-Introduce-rhel-5.5.0-machine-type.patch [bz#541731]- kvm-cpu-for-x86-don-t-save-new-fields-if-version-8.patch [bz#541731]- kvm-RHEL5.4-needs-cpu-at-version-7.patch [bz#541731]- kvm-RHEL-5.4.0-don-t-have-kvmclock.patch [bz#541731]- kvm-RHEL5.4-needs-ide-at-device-version-3.patch [bz#541731]- kvm-RHEL5.4-needs-virtio-blk-at-device-version-2.patch [bz#541731]- kvm-make-5.4.0-machine-the-default.patch [bz#541731]- Resolves: bz#530533 (debug message is displayed when save VM state into a compressed file)- Resolves: bz#541731 (kvm: migration: mechanism to make older savevm versions to be emitted on some cases)- Resolves: bz#549938 (Maintain barrier state after migration)[kvm-83-140.el5]- kvm-kernel-KVM-MMU-remove-prefault-from-invlpg-handler.patch [bz#531887]- Resolves: bz#531887 (BSOD BAD_POOL_HEADER STOP 0x19 during boot of Windows Server 2008 R2 installer)- kvm-Make-SMBIOS-pass-MS-SVVP-test.patch [bz#537178]- kvm-bz-545136-whitelist-host-virtio-networking-features.patch [bz#545136]- kvm-fix-rtc-td-hack-on-host-without-high-res-timers.patch [bz#543137]- kvm-v2-RHEL5-BZ543979-get-roms-more-room.-Glauber-Costa.patch [bz#543979]- Resolves: bz#537178 (Need to generate SMBIOS table 4 data for windows guests)- Resolves: bz#543137 (time drift in win2k364 KVM guest)- Resolves: bz#543979 (gPXE fails to PXE boot on e1000 virtual NIC)- Resolves: bz#545136 (whitelist host virtio networking features)[kvm-83-139.el5]- Updated kversion to 2.6.18-182.el5 to match build root- Require etherboot directly, to make sure it is installed by default- Resolves: bz#546019[kvm-83-138.el5]- Updated kversion to 2.6.18-181.el5 to match build root- Use the new gpxe/etherboot configurable pxe-zroms-qemu system- Resolves: bz#546019[kvm-83-137.el5]- Updated kversion to 2.6.18-176.el5 to match build root- kvm-kernel-KVM-x86-make-double-triple-fault-promotion-generic-t.patch [bz#532086]- kvm-kernel-KVM-x86-raise-TSS-exception-for-NULL-CS-and-SS-segme.patch [bz#532086]- kvm-kernel-KVM-x86-emulator-limit-instructions-to-15-bytes.patch [bz#541165]- Resolves: bz#532086 (Rhev-Block driver causes 'unhandled vm exit' with 32bit win2k3r2sp2 Guest VM on restart)- Resolves: bz#541165 (CVE-2009-4031 kernel: KVM: x86 emulator: limit instructions to 15 bytes [rhel-5.5])- kvm-qcow2-Store-exact-backing-format-length.patch [bz#540893]- kvm-qcow-qcow2-Add-bdrv_aio_flush.patch [bz#542923]- Resolves: bz#540893 (qemu-img: snapshot info error)- Resolves: bz#542923 (Get segmentation fault when running with ide block on kvm-83-136.el5)[kvm-83-136.el5]- Update kversion to 2.6.18-175.el5 to match build root- kvm-block-use-fdatasync-instead-of-fsync-if-possible.patch [bz#537646]- kvm-block-add-aio_flush-operation.patch [bz#537646]- kvm-ide-use-bdrv_aio_flush.patch [bz#537646]- kvm-virtio-blk-add-volatile-writecache-feature.patch [bz#537646]- kvm-qcow2-Fix-grow_refcount_table-error-handling.patch [bz#537075]- kvm-virtio-blk-Stop-VM-on-read-errors.patch [bz#531827]- kvm-ide-Stop-VM-on-read-errors.patch [bz#531827 bz#531827 bz#533390]- kvm-slirp-Reassign-same-address-to-same-DHCP-client.patch [bz#531631]- kvm-block-add-enable_write_cache-flag.patch [bz#537646]- kvm-build-fix-add-pci_get_bus_and_slot-to-compat_apis.patch [bz#539589]- kvm-Fix-race-between-migration-and-cpu-main-loop.patch [bz#533090]- Resolves: bz#531631 (Windows XP unattended install doesn't get an IP address after rebooting, if using -net user)- Resolves: bz#531827 (O/S Filesystem Corruption with RHEL-5.4 on a RHEV Guest)- Resolves: bz#533090 (Windows Server 2008 R2 shutdown hangs after restore from migration)- Resolves: bz#533390 (RHEL5.4 VM image corruption with an IDE v-disk)- Resolves: bz#537075 (qcow2: infinite recursion on grow_refcount_table() error handling)- Resolves: bz#537646 (backports of qemu barrier support)- Resolves: bz#539589 (kvm can't build against kernel-2.6.18-174.el5)[kvm-83-135.el5]- kvm-kernel-531701-KERNEL-v2-allow-userspace-to-adjust-kvmclock-.patch [bz#531701]- kvm-531701-properly-save-kvm-system-time-msr-registers.patch [bz#531701]- kvm-BZ531701-get-and-set-clock-upon-migration.patch [bz#531701]- Resolves: bz#531701 (pvclock msr values are not preserved across remote migration)- Filter out ksym dependencies only known non-whitelisted symbols [bz#533197]- Resolves: bz#533197[kvm-83-134.el5]- kvm-kernel-allow-to-address-up-to-48-bits-of-physical-memory-in.patch [bz#516545 bz#517223]- Resolves: bz#516545 (qemu-kvm crashed when setting 32bitwin28k with 64G ram)- Related: bz#517223 (BUG: warning at /builddir/build/BUILD/kvm-83-maint-snapshot-20090205/kernel-/x86/x86.c:240/kvm_queue_exception_e() (Tainted: G ))- kvm-Add-smp_call_function_many-to-compat_apis.patch [bz#533059]- Resolves: bz#533059 (kvm modules can't be built against latest kernel-devel package)[kvm-83-133.el5]- Update kversion to 2.6.18-172.el5 to match build root- kvm-kernel-KVM-Timer-event-should-not-unconditionally-unhalt-vc.patch [bz#492663]- kvm-kernel-KVM-Fix-interrupt-unhalting-a-vcpu-when-it-shouldn-t.patch [bz#502086]- Resolves: bz#492663 (KVM: Timer event should not unconditionally unhalt vcpu)- Resolves: bz#502086 (KVM: Fix interrupt unhalting a vcpu when it shouldn't)[kvm-83-132.el5]- kvm-keep-initrd-in-below-4g-area.patch [bz#529694]- Resolves: bz#529694 (-initrd is broken with > 4GB guests)[kvm-83-131.el5]- kvm-kernel-KVM-SVM-Reset-cr0-properly-on-vcpu-reset.patch [bz#525699]- Resolves: bz#525699 (x86_64 guest hang when set guest's cpu1 online on AMD host)[kvm-83-130.el5]- Update kversion to 2.6.18-168.el5 to match kernel-devel on build root- kvm-kernel-get_tss_base_addr-should-return-gpa_t-type.patch [bz#516762]- Resolves: bz#516762 (qemu aborted when restart 32bitwin23k with more than 4G mem in intel host.)[kvm-83-129.el5]- kvm-Fix-VDI-audio-stop.patch [bz#520394]- Resolves: bz#520394 (KVM : QEMU-Audio attempting to stop unactivated audio device (snd_playback_stop: ASSERT playback_channel->base.active failed).)[kvm-83-128.el5]- kvm-fix-kvm_arch_save_regs-potential-stack-corruptio.patch [bz#528917]- Resolves: bz#528917 (qemu-kvm : msrs[] array in kvm_arch_save_regs() too small / may cause stack corruption)[kvm-83-127.el5]- kvm-RHEL-5.X-5.4.Z-Makefile-fix-ksm-dir-has-no-ARCH-pref.patch [bz#527722]- Resolves: bz#527722 (Build tree for RHEL 5.X and RHEL 5.4.z contains build bugs)[kvm-83-126.el5]- Add --disable-pcspk option to ./configure [bz#516672]- Resolves: bz#516672 (Disable unused/unsupported features on qemu-kvm)[kvm-83-125.el5]- kvm-kernel-KVM-VMX-Adjust-rflags-if-in-real-mode-emulation.patch [bz#517324]- kvm-kernel-KVM-When-switching-to-a-vm8086-task-load-segments-as.patch [bz#517324]- kvm-kernel-RHEL5.4-defined-this-constants-in-asm-msr.h.patch [bz#515749]- kvm-kernel-For-RHEl5.x-return-types-of-hrtimers-is-int.patch [bz#515749]- kvm-kernel-KVM-VMX-flush-TLB-with-INVEPT-on-cpu-migration.patch [bz#518081]- kvm-kernel-KVM-Fix-task-switch-back-link-handling-v2-including-.patch [bz#517324]- Resolves: bz#515749 (Remove warnings from kvm compilation)- Resolves: bz#517324 (KVM does not implement proper support for hardware task linking when using vm8086 mode)- Resolves: bz#518081 (vmentry fails with ept misconfig)- kvm-test-access-remove-warning.patch [bz#515749]- kvm-test-emulator-remove-unused-variable.patch [bz#515749]- kvm-test-vmexit-remove-warning-undefined-printf.patch [bz#515749]- kvm-external-module-compat-bring-c89-prototypes-to-intel.patch [bz#515749]- Resolves: bz#515749 (Remove warnings from kvm compilation)[kvm-83-124.el5]- kvm-kernel-KVM-x86-verify-MTRR-PAT-validity.patch [bz#526837]- Resolves: bz#526837 (KVM: x86: verify MTRR/PAT validity (upstream backport))[kvm-83-123.el5]- kvm-Disable-help-for-vmware-vga-and-enable-nesting.patch [bz#516672]- kvm-Now-that-we-have-disable-bluetooth-disable-also-bt-c.patch [bz#516672]- kvm-migration_notify_register-is-only-used-by-spice.patch [bz#516672]- kvm-Fix-typo-should-have-been-from-the-beggining.patch [bz#516672]- kvm-Don-t-compile-drivers-that-are-not-used-in-a-pc.patch [bz#516672]- kvm-Add-option-to-disable-pcspk.patch [bz#516672]- kvm-usb_bluez-depends-of-bluez.patch [bz#516672]- Resolves: bz#516672 (Disable unused/unsupported features on qemu-kvm)[kvm-83-122.el5]- Update kversion to 2.6.18-164.2.1.el5 to match kernel-devel on build root- kvm-libkvm-Add-a-wrapper-for-an-ioctl-for-the-KVM_SE.patch [bz#508040]- kvm-Fetch-sub-leaf-cpuid-values-for-functions-4-0xb-0xd.patch [bz#508040]- kvm-Initialize-entire-cpuid2-structure.patch [bz#508040]- kvm-extend-smp-parsing-to-include-cores-and-threads-opti.patch [bz#508040]- kvm-push-CPUID-level-to-4-to-allow-Intel-multicore-decod.patch [bz#508040]- kvm-set-CPUID-bits-to-present-cores-and-threads-topology.patch [bz#508040]- kvm-allow-overriding-of-CPUID-level-on-command-line.patch [bz#508040]- kvm-force-enable-options.patch [bz#489900]- kvm-move-kvm-extra-features-detection-after-kvm-detectio.patch [bz#489900]- kvm-add-options-to-request-kvm-pit-and-device-assignment.patch [bz#489900]- Added configure options to make build dependency checks more reliable: --enable-kvm --enable-qxl --enable-spice --enable-gcrypt --enable-vnc-tls [bz#489900]- Resolves: bz#489900 (kvm configure should abort if a required option failed)- Resolves: bz#508040 (Windows XP not using all CPUS)[kvm-83-121.el5]- Use rtl8029.zrom for ne2k_pci PXE booting (bz#526124)- Resolves: bz#526124 (ne model failed to get ip address)[kvm-83-120.el5]- kvm-Add-host_device-support-to-qemu-img.-Nolan-Leake.patch [bz#511072 bz#511072]- kvm-raw-posix-Handle-errors-in-raw_create.patch [bz#511072 bz#511072]- Resolves: bz#511072 (KVM - qemu-img fail to copy a RAW format image over FCP storage)[kvm-83-119.el5]- kvm-Use-kernel-s-smp_call_function_single-instead-of-emu.patch [bz#524970]- kvm-Properly-handle-pthread_cond_timedwait-timing-out.patch [bz#525114]- kvm-fix-segfault-in-setting-migration-speed.patch [bz#522887]- Resolves: bz#522887 (Call to migrate_set_speed after a migrate_cancel causes segmentation fault in kvm)- Resolves: bz#524970 (Guest single-cpu IPI leads to a global IPI on host)- Resolves: bz#525114 (KVM QEMU:RHEL OS VM's became not-responding and stopped answering monitor Commands.)[kvm-83-118.el5]- kvm-qemu-virtio-net-do-not-return-stack-pointer-from-fun.patch [bz#521829]- Resolves: bz#521829 (QEMU crash (during virtio-net WHQL tests for Win2008 R2))[kvm-83-117.el5]- kvm-kernel-KVM-VMX-Optimize-vmx_get_cpl.patch [bz#524126]- kvm-kernel-KVM-x86-Disallow-hypercalls-for-guest-callers-in-rin.patch [bz#524126]- kvm-kernel-KVM-VMX-Don-t-intercept-MSR_KERNEL_GS_BASE-v2.patch [bz#488130 bz#488130]- Resolves: bz#488130 (KVM: VMX: Don't intercept MSR_KERNEL_GS_BASE (upstream patch))- Resolves: bz#524126 (kernel: KVM: x86: Disallow hypercalls for guest callers in rings > 0 [rhel-5.5])- kvm-qcow2-Change-cluster-size-to-64k.patch [bz#502809]- kvm-Fix-for-Bug-510706-qemu-kvm-segfault-when-using-i825.patch [bz#510706]- Resolves: bz#502809 ([FEAT] Change qcow2 cluster size to 64k)- Resolves: bz#510706 (qemu-kvm segfault when using i82551 vnic)[kvm-83-116.el5]- kvm-kernel-Revert-KVM-VMX-Don-t-intercept-MSR_KERNEL_GS_BASE.patch [bz#488130] kvm-kernel-KVM-VMX-Don-t-intercept-MSR_KERNEL_GS_BASE.patch was broken- Related: bz#488130 (KVM: VMX: Don't intercept MSR_KERNEL_GS_BASE (upstream patch))[kvm-83-115.el5]- kvm-kernel-KVM-VMX-Don-t-intercept-MSR_KERNEL_GS_BASE.patch [bz#488130]- Resolves: bz#488130 (KVM: VMX: Don't intercept MSR_KERNEL_GS_BASE (upstream patch))- kvm-Use-quiet-command-to-get-a-cleaner-build-output.patch [bz#515749]- kvm-This-function-is-not-used-anymore.-It-is-opencoded-i.patch [bz#515749]- kvm-fds-variable-is-not-used.-Remaining-of-a-missmerge.patch [bz#515749]- kvm-use-proper-C89-declarations.patch [bz#515749]- kvm-pit-is-used-in-two-cases-not-easy-way-to-define-.patch [bz#515749]- kvm-In-qemu-all-buffers-are-uint8_t-not-char.patch [bz#515749]- kvm-kvm_allowed-is-exported-in-qemu-kvm.h-and-it-is-used.patch [bz#515749]- kvm-add-three-missing-static-modifiers-for-local-functio.patch [bz#515749]- kvm-put-declaration-of-enable_async_notification-in-a-pr.patch [bz#515749]- kvm-move-several-kvm-variables-after-qemu-kvm.h-include-.patch [bz#515749]- kvm-mark-static-do_block_set_watermark.patch [bz#515749]- kvm-txbufferaccu_offset-and-irq-fields-were-save-load-as.patch [bz#515749]- kvm-mp_state-is-treated-as-unsigned-int-uint32_t-for-sav.patch [bz#515749]- kvm-hp_reset-should-have-type-QEMUResetHandler.patch [bz#515749]- kvm-make-static-lsi_scsi_uninit.patch [bz#515749]- kvm-assigned_dev_data-was-not-used-anywhere.patch [bz#515749]- kvm-bios_enabled-is-load-saved-as-uint32_t-declare-it-as.patch [bz#515749]- kvm-remove-unused-variable.patch [bz#515749]- kvm-add-prototype-for-kvm_add_ioperm_data.patch [bz#515749]- kvm-removed-duplicated-re-declaration-of-kvm_context-2.patch [bz#515749]- kvm-make-static-update_vbios_real_tpr.patch [bz#515749]- kvm-fix-var-may-be-used-uninitialized.patch [bz#515749]- kvm-make-local-functions-static.patch [bz#515749]- kvm-remove-unused-variable-opt_rom_offset.patch [bz#515749]- kvm-removed-duplicated-re-declaration-of-kvm_context.patch [bz#515749]- kvm-perror-is-defined-in-stdio.h-that-got-included-indir.patch [bz#515749]- kvm-remove-unused-variable-cpu.patch [bz#515749]- kvm-nb_sectors-should-be-an-uint64_t.patch [bz#515749]- kvm-uhci_reset-should-have-QEMUResetHandler-type.patch [bz#515749]- kvm-initialize-blen-and-pa-variables-to-0.patch [bz#515749]- kvm-we-got-smp_cpus-declaration-through-sysemu.h.patch [bz#515749]- kvm-int-and-long-masked-as-pointers.-cast-to-avoid-warni.patch [bz#515749]- kvm-we-got-vm_running-declaration-through-sysemu.h.patch [bz#515749]- kvm-BZ503367-obey-S-on-migration.patch [bz#503367 bz#503367]- kvm-reason-paramenter-only-exist-in-newer-qemu-s-not-our.patch [bz#515749]- kvm-Fix-AltGr-and-dead-keys-with-VNC.patch [bz#521835]- kvm-time_t-is-a-long-in-x86_64.patch [bz#515749]- kvm-bugzilla-504237-changed-size-of-variables-to-uint64_.patch [bz#515749]- Resolves: bz#503367 (After migration, paused VM is running on destination)- Resolves: bz#515749 (Remove warnings from kvm compilation)- Resolves: bz#521835 (German keymap using KVM+VNC missing some keys)[83-114.el5]- kvm-kernel-reset-hflags-on-cpu-reset.patch [bz#502543 bz#521749]- Resolves: bz#502543 (Windows 2008 R2 KVM guest can not restart when set it as multiple cpus)- Related: bz#521749 (Guest Window2008-R2-datacenter installation is stopped at step 'Setup will continue after restarting your computer')[83-113.el5]- kvm-qcow2-Refactor-update_refcount.patch [bz#518169]- kvm-qcow2-Update-multiple-refcounts-at-once.patch [bz#518169]- kvm-Combined-patch-of-two-upstream-commits-the-second-fi.patch [bz#518169]- kvm-alloc_cluster_link_l2-Write-complete-sectors.patch [bz#518169]- kvm-update_refcount-Write-complete-sectors.patch [bz#518169]- Resolves: bz#518169 (Bad qcow2 performance with cache=off)[83-112.el5]- kvm-kernel-Fix-coalesced-interrupt-reporting-in-IOAPIC.patch [bz#521025]- Resolves: bz#521025 (rtc-td-hack stopped working. Time drifts in windows)[83-111.el5]- kvm-Fix-VM-state-change-handlers-running-out-of-order.patch [bz#514522]- kvm-Revert-Work-around-VM-state-change-handlers-running-.patch [bz#514522]- Resolves: bz#514522 (QEMU: Fix VM change state issue on IO errors)[83-110.el5]- Update kversion to 2.6.18-164.el5 to match kernel-devel on build root- kvm-kernel-Backport-44882eed2ebe7f75f8cdae5671ab1d6e0fa40dbc.patch [bz#515549]- kvm-kernel-kvm-fix-ack-not-being-delivered-when-msi-present.patch [bz#515549]- kvm-kernel-kvm-fix-build-with-defconfig.patch [bz#515549]- Resolves: bz#515549 (upstream qemu issues on rhel 5.4)- kvm-Remove-initrd-warning-message.patch [bz#512672]- Resolves: bz#512672 (Remove initrd warning message)[83-109.el5]- kvm-kernel-add-nmi-support-to-svm.patch [bz#502543 bz#503322 bz#492290]- kvm-kernel-VMX-Fix-cr8-exiting-control-clobbering-by-EPT.patch [bz#520285]- Resolves: bz#492290 (KVM: XP virtio-net tests fail with BSOD on AMD host (due to lack of NMI injection masking ability))- Resolves: bz#502543 (Windows 2008 R2 KVM guest can not restart when set it as multiple cpus)- Resolves: bz#503322 (NMI filtering for AMD (Windows 2008 R2 KVM guest can not restart when set it as multiple cpus))- Resolves: bz#520285 (windows 64 bit does vmexit on each cr8 access.)[83-108.el5]- kvm-kernel-KVM-MMU-make-__kvm_mmu_free_some_pages-handle-empty-.patch [bz#519397]- Resolves: bz#519397 (KVM: MMU: make __kvm_mmu_free_some_pages handle empty list (upstream backport))[83-107.el5]- kvm-kernel-KVM-MMU-fix-bogus-alloc_mmu_pages-assignment.patch [bz#487857]- Resolves: bz#487857 (The emulator hung after input 'cpu_set 1 online' on qemuMonitor and select 'System->Shutdown')[83-106.el5]- Update kversion to 2.6.18-162.el5- kvm-Initialize-PS2-keyboard-mouse-state-on-reset.patch [bz#515275]- Resolves: bz#515275 (guest not accepting keystrokes or mouse clicks after reboot)"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2010-0271");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2010-0271.html");
script_cve_id("CVE-2010-0430","CVE-2010-0741");
script_tag(name:"cvss_base", value:"7.8");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
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
if(release == "OracleLinux5")
{
  if ((res = isrpmvuln(pkg:"kmod-kvm", rpm:"kmod-kvm~83~164.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kvm", rpm:"kvm~83~164.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kvm-qemu-img", rpm:"kvm-qemu-img~83~164.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kvm-tools", rpm:"kvm-tools~83~164.0.1.el5", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
