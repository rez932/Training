ash@ubuntu1:~/kernel$ uname -r
5.15.0-198-generic
ash@ubuntu1:~/kernel$ wget https://kernel.ubuntu.com/mainline/v6.13.2/amd64/linux-headers-6.13.2-061302-generic_6.13.2-061302.202502081010_amd64.deb
--2026-10-05 12:38:04--  https://kernel.ubuntu.com/mainline/v6.13.2/amd64/linux-headers-6.13.2-061302-generic_6.13.2-061302.202502081010_amd64.deb
Resolving kernel.ubuntu.com (kernel.ubuntu.com)... 185.125.189.76, 185.125.189.74, 185.125.189.75
Connecting to kernel.ubuntu.com (kernel.ubuntu.com)|185.125.189.76|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 3694072 (3.5M) [application/vnd.debian.binary-package]
Saving to: ‘linux-headers-6.13.2-061302-generic_6.13.2-061302.202502081010_amd64.deb’

linux-headers-6.13.2-061302-generic_6.13.2 100%[========================================================================================>]   3.52M  1.86MB/s    in 1.9s

2026-10-05 12:38:07 (1.86 MB/s) - ‘linux-headers-6.13.2-061302-generic_6.13.2-061302.202502081010_amd64.deb’ saved [3694072/3694072]

ash@ubuntu1:~/kernel$ wget https://kernel.ubuntu.com/mainline/v6.13.2/amd64/linux-headers-6.13.2-061302_6.13.2-061302.202502081010_all.deb
--2026-10-05 12:38:13--  https://kernel.ubuntu.com/mainline/v6.13.2/amd64/linux-headers-6.13.2-061302_6.13.2-061302.202502081010_all.deb
Resolving kernel.ubuntu.com (kernel.ubuntu.com)... 185.125.189.75, 185.125.189.74, 185.125.189.76
Connecting to kernel.ubuntu.com (kernel.ubuntu.com)|185.125.189.75|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 13875326 (13M) [application/vnd.debian.binary-package]
Saving to: ‘linux-headers-6.13.2-061302_6.13.2-061302.202502081010_all.deb’

linux-headers-6.13.2-061302_6.13.2-061302. 100%[========================================================================================>]  13.23M  3.56MB/s    in 5.2s

2026-10-05 12:38:19 (2.54 MB/s) - ‘linux-headers-6.13.2-061302_6.13.2-061302.202502081010_all.deb’ saved [13875326/13875326]

ash@ubuntu1:~/kernel$ wget https://kernel.ubuntu.com/mainline/v6.13.2/amd64/linux-image-unsigned-6.13.2-061302-generic_6.13.2-061302.202502081010_amd64.deb
--2026-10-05 12:38:24--  https://kernel.ubuntu.com/mainline/v6.13.2/amd64/linux-image-unsigned-6.13.2-061302-generic_6.13.2-061302.202502081010_amd64.deb
Resolving kernel.ubuntu.com (kernel.ubuntu.com)... 185.125.189.75, 185.125.189.74, 185.125.189.76
Connecting to kernel.ubuntu.com (kernel.ubuntu.com)|185.125.189.75|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 15677632 (15M) [application/vnd.debian.binary-package]
Saving to: ‘linux-image-unsigned-6.13.2-061302-generic_6.13.2-061302.202502081010_amd64.deb’

linux-image-unsigned-6.13.2-061302-generic 100%[========================================================================================>]  14.95M  3.56MB/s    in 6.4s

2026-10-05 12:38:31 (2.35 MB/s) - ‘linux-image-unsigned-6.13.2-061302-generic_6.13.2-061302.202502081010_amd64.deb’ saved [15677632/15677632]

ash@ubuntu1:~/kernel$ wget https://kernel.ubuntu.com/mainline/v6.13.2/amd64/linux-modules-6.13.2-061302-generic_6.13.2-061302.202502081010_amd64.deb
--2026-10-05 12:38:35--  https://kernel.ubuntu.com/mainline/v6.13.2/amd64/linux-modules-6.13.2-061302-generic_6.13.2-061302.202502081010_amd64.deb
Resolving kernel.ubuntu.com (kernel.ubuntu.com)... 185.125.189.74, 185.125.189.75, 185.125.189.76
Connecting to kernel.ubuntu.com (kernel.ubuntu.com)|185.125.189.74|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 184576192 (176M) [application/vnd.debian.binary-package]
Saving to: ‘linux-modules-6.13.2-061302-generic_6.13.2-061302.202502081010_amd64.deb’

linux-modules-6.13.2-061302-generic_6.13.2 100%[========================================================================================>] 176.03M  8.08MB/s    in 18s

2026-10-05 12:38:53 (9.69 MB/s) - ‘linux-modules-6.13.2-061302-generic_6.13.2-061302.202502081010_amd64.deb’ saved [184576192/184576192]

ash@ubuntu1:~/kernel$ sudo dpkg -i *.deb
Selecting previously unselected package linux-headers-6.13.2-061302.
(Reading database ... 156842 files and directories currently installed.)
Preparing to unpack linux-headers-6.13.2-061302_6.13.2-061302.202502081010_all.deb ...
Unpacking linux-headers-6.13.2-061302 (6.13.2-061302.202502081010) ...
Selecting previously unselected package linux-headers-6.13.2-061302-generic.
Preparing to unpack linux-headers-6.13.2-061302-generic_6.13.2-061302.202502081010_amd64.deb ...
Unpacking linux-headers-6.13.2-061302-generic (6.13.2-061302.202502081010) ...
Selecting previously unselected package linux-image-unsigned-6.13.2-061302-generic.
Preparing to unpack linux-image-unsigned-6.13.2-061302-generic_6.13.2-061302.202502081010_amd64.deb ...
Unpacking linux-image-unsigned-6.13.2-061302-generic (6.13.2-061302.202502081010) ...
Selecting previously unselected package linux-modules-6.13.2-061302-generic.
Preparing to unpack linux-modules-6.13.2-061302-generic_6.13.2-061302.202502081010_amd64.deb ...
Unpacking linux-modules-6.13.2-061302-generic (6.13.2-061302.202502081010) ...
Setting up linux-headers-6.13.2-061302 (6.13.2-061302.202502081010) ...
dpkg: dependency problems prevent configuration of linux-headers-6.13.2-061302-generic:
 linux-headers-6.13.2-061302-generic depends on libc6 (>= 2.38); however:
  Version of libc6:amd64 on system is 2.35-0ubuntu3.15.
 linux-headers-6.13.2-061302-generic depends on libelf1t64 (>= 0.144); however:
  Package libelf1t64 is not installed.
 linux-headers-6.13.2-061302-generic depends on libssl3t64 (>= 3.0.0); however:
  Package libssl3t64 is not installed.

dpkg: error processing package linux-headers-6.13.2-061302-generic (--install):
 dependency problems - leaving unconfigured
Setting up linux-modules-6.13.2-061302-generic (6.13.2-061302.202502081010) ...
Setting up linux-image-unsigned-6.13.2-061302-generic (6.13.2-061302.202502081010) ...
I: /boot/vmlinuz is now a symlink to vmlinuz-6.13.2-061302-generic
I: /boot/initrd.img is now a symlink to initrd.img-6.13.2-061302-generic
Processing triggers for linux-image-unsigned-6.13.2-061302-generic (6.13.2-061302.202502081010) ...
/etc/kernel/postinst.d/initramfs-tools:
update-initramfs: Generating /boot/initrd.img-6.13.2-061302-generic
/etc/kernel/postinst.d/zz-update-grub:
Sourcing file `/etc/default/grub'
Sourcing file `/etc/default/grub.d/init-select.cfg'
Generating grub configuration file ...
Found linux image: /boot/vmlinuz-6.13.2-061302-generic
Found initrd image: /boot/initrd.img-6.13.2-061302-generic
Found linux image: /boot/vmlinuz-5.15.0-198-generic
Found initrd image: /boot/initrd.img-5.15.0-198-generic
Warning: os-prober will not be executed to detect other bootable partitions.
Systems on them will not be added to the GRUB boot configuration.
Check GRUB_DISABLE_OS_PROBER documentation entry.
done
Errors were encountered while processing:
 linux-headers-6.13.2-061302-generic
ash@ubuntu1:~/kernel$  ls -al /boot
total 353344
drwxr-xr-x  4 root root      4096 Oct  5 12:39 .
drwxr-xr-x 20 root root      4096 Oct  5 09:19 ..
-rw-r--r--  1 root root    262200 Sep  4 09:53 config-5.15.0-198-generic
-rw-r--r--  1 root root    294303 Feb  8  2025 config-6.13.2-061302-generic
-rw-r--r--  1 root root    304363 Oct  3 12:45 config-6.18.55-061855-generic
-rw-r--r--  1 root root    307746 Aug 16 23:50 config-7.2.0-070200-generic
drwxr-xr-x  5 root root      4096 Oct  5 12:39 grub
lrwxrwxrwx  1 root root        32 Oct  5 12:39 initrd.img -> initrd.img-6.13.2-061302-generic
-rw-r--r--  1 root root 113711215 Oct  5 09:25 initrd.img-5.15.0-198-generic
-rw-r--r--  1 root root 180539764 Oct  5 12:39 initrd.img-6.13.2-061302-generic
lrwxrwxrwx  1 root root        29 Oct  5 09:21 initrd.img.old -> initrd.img-5.15.0-198-generic
drwx------  2 root root     16384 Oct  5 09:20 lost+found
-rw-------  1 root root   6305744 Sep  4 09:53 System.map-5.15.0-198-generic
-rw-------  1 root root   9934398 Feb  8  2025 System.map-6.13.2-061302-generic
-rw-------  1 root root  10758743 Oct  3 12:45 System.map-6.18.55-061855-generic
-rw-------  1 root root  11958591 Aug 16 23:50 System.map-7.2.0-070200-generic
lrwxrwxrwx  1 root root        29 Oct  5 12:39 vmlinuz -> vmlinuz-6.13.2-061302-generic
-rw-------  1 root root  11741416 Sep  4 09:55 vmlinuz-5.15.0-198-generic
-rw-------  1 root root  15647232 Feb  8  2025 vmlinuz-6.13.2-061302-generic
lrwxrwxrwx  1 root root        26 Oct  5 09:21 vmlinuz.old -> vmlinuz-5.15.0-198-generic
ash@ubuntu1:~/kernel$ sudo reboot

Remote side unexpectedly closed network connection

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Session stopped
    - Press <Return> to exit tab
    - Press R to restart session
    - Press S to save terminal output to file
    ┌──────────────────────────────────────────────────────────────────────┐
    │               • MobaXterm Professional Edition v26.4 •               │
    │               (SSH client, X server and network tools)               │
    │                                                                      │
    │ ⮞ SSH session to ash@10.10.197.60                                    │
    │   • Direct SSH      :  ✓                                             │
    │   • SSH compression :  ✗                                             │
    │   • SSH-browser     :  ✓                                             │
    │   • X11-forwarding  :  ✓  (remote display is forwarded through SSH)  │
    │                                                                      │
    │ ⮞ For more info, ctrl+click on help or visit our website.            │
    └──────────────────────────────────────────────────────────────────────┘

Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 6.13.2-061302-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Mon Oct  5 12:41:12 PM UTC 2026

  System load:  0.23              Processes:               247
  Usage of /:   45.3% of 9.75GB   Users logged in:         0
  Memory usage: 7%                IPv4 address for ens192: 10.10.197.60
  Swap usage:   0%


Expanded Security Maintenance for Applications is not enabled.

72 updates can be applied immediately.
3 of these updates are standard security updates.
To see these additional updates run: apt list --upgradable

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status

New release '24.04.5 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


Last login: Mon Oct  5 12:41:13 2026
ash@ubuntu1:~$ uname -r
6.13.2-061302-generic
ash@ubuntu1:~$ sudo update-grub
[sudo] password for ash:
Sourcing file `/etc/default/grub'
Sourcing file `/etc/default/grub.d/init-select.cfg'
Generating grub configuration file ...
Found linux image: /boot/vmlinuz-6.13.2-061302-generic
Found initrd image: /boot/initrd.img-6.13.2-061302-generic
Found linux image: /boot/vmlinuz-5.15.0-198-generic
Found initrd image: /boot/initrd.img-5.15.0-198-generic
Warning: os-prober will not be executed to detect other bootable partitions.
Systems on them will not be added to the GRUB boot configuration.
Check GRUB_DISABLE_OS_PROBER documentation entry.
done
ash@ubuntu1:~$ sudo grub-set-default 0
ash@ubuntu1:~$ sudo reboot

Remote side unexpectedly closed network connection

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Session stopped
    - Press <Return> to exit tab
    - Press R to restart session
    - Press S to save terminal output to file
    ┌──────────────────────────────────────────────────────────────────────┐
    │               • MobaXterm Professional Edition v26.4 •               │
    │               (SSH client, X server and network tools)               │
    │                                                                      │
    │ ⮞ SSH session to ash@10.10.197.60                                    │
    │   • Direct SSH      :  ✓                                             │
    │   • SSH compression :  ✗                                             │
    │   • SSH-browser     :  ✓                                             │
    │   • X11-forwarding  :  ✓  (remote display is forwarded through SSH)  │
    │                                                                      │
    │ ⮞ For more info, ctrl+click on help or visit our website.            │
    └──────────────────────────────────────────────────────────────────────┘

Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 6.13.2-061302-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Mon Oct  5 12:43:38 PM UTC 2026

  System load:  0.0               Processes:               255
  Usage of /:   45.3% of 9.75GB   Users logged in:         0
  Memory usage: 8%                IPv4 address for ens192: 10.10.197.60
  Swap usage:   0%


Expanded Security Maintenance for Applications is not enabled.

72 updates can be applied immediately.
3 of these updates are standard security updates.
To see these additional updates run: apt list --upgradable

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status

New release '24.04.5 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


Last login: Mon Oct  5 12:41:29 2026 from 10.4.197.167
ash@ubuntu1:~$ uname -r
6.13.2-061302-generic
ash@ubuntu1:~$

