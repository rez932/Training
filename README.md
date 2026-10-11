# Домашнее задание. Занятие 1. Обновление ядра системы

## Название задания
Обновление ядра Linux в Ubuntu вручную из mainline-репозитория.

## Текст задания
1. Запустить ВМ с Ubuntu.
2. Обновить ядро ОС на болееновую версию из mainline-репозитория.
3. Оформить отчет в README-файле в GitHub-репозитории.

**Дополнительное задание:** собрать ядро самостоятельно из исходных кодов.

 Выполнение

Установлена Ubuntu 22.04.5 LTS. Проверена текущая версия ядра:
ash@ubuntu1:~$ uname -r
5.15.0-198-generic

 Выбор версии ядра
На странице https://kernel.ubuntu.com/mainline/ была выбрана версия — v6.13.2 (сборка 6.13.2-061302.202502081010)

Создана рабочая директория и скачаны четыре .deb-пакета для архитектуры amd64:

```bash
$ mkdir kernel && cd kernel

$ wget https://kernel.ubuntu.com/mainline/v6.13.2/amd64/linux-headers-6.13.2-061302-generic_6.13.2-061302.202502081010_amd64.deb
$ wget https://kernel.ubuntu.com/mainline/v6.13.2/amd64/linux-headers-6.13.2-061302_6.13.2-061302.202502081010_all.deb
$ wget https://kernel.ubuntu.com/mainline/v6.13.2/amd64/linux-image-unsigned-6.13.2-061302-generic_6.13.2-061302.202502081010_amd64.deb
$ wget https://kernel.ubuntu.com/mainline/v6.13.2/amd64/linux-modules-6.13.2-061302-generic_6.13.2-061302.202502081010_amd64.deb

Установка пакетов

$ sudo dpkg -i *.deb
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

Проверка наличия нового ядра
$ ash@ubuntu1:~/kernel$  ls -al /boot
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


Перезагрузка
$ ash@ubuntu1:~/kernel$ sudo reboot

Проверка версии ядра после перезагрузки
$ ash@ubuntu1:~$ uname -r
6.13.2-061302-generic

Далее обновление конфигурации загрузчика и установка загрузки нового ядра по умолчанию и дальнейшая перезагрузка: 
$ ash@ubuntu1:~$ sudo update-grub
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
$ ash@ubuntu1:~$ sudo grub-set-default 0
$ ash@ubuntu1:~$ sudo reboot

Проверка версии загрузчика после перезагрузки:
$ ash@ubuntu1:~$ uname -r
6.13.2-061302-generic

## Задание выполнено



# Домашнее задание. Занятие 2. Дисковая подсистема


## Текст задания
1. скрипт для создания рейда
2. Отчет по командам для починки RAID и созданию разделов

Скрипт по созданию рейда прикрепил.

# Отчет по командам для починки рейда и созданию разделов

$ root@ubuntu1:~# mdadm /dev/md10 --remove /dev/sdc
mdadm: hot removed /dev/sdc from /dev/md10
$ root@ubuntu1:~# mdadm -D /dev/md10
/dev/md10:
           Version : 1.2
     Creation Time : Thu Oct  8 07:35:01 2026
        Raid Level : raid10
        Array Size : 2093056 (2044.00 MiB 2143.29 MB)
     Used Dev Size : 1046528 (1022.00 MiB 1071.64 MB)
      Raid Devices : 4
     Total Devices : 3
       Persistence : Superblock is persistent

       Update Time : Thu Oct  8 07:37:32 2026
             State : clean, degraded
    Active Devices : 3
   Working Devices : 3
    Failed Devices : 0
     Spare Devices : 0

            Layout : near=2
        Chunk Size : 512K

Consistency Policy : resync

              Name : ubuntu1:10  (local to host ubuntu1)
              UUID : 465b52ab:31e937fd:361053ac:bf0a0dc9
            Events : 20

    Number   Major   Minor   RaidDevice State
       0       8       16        0      active sync set-A   /dev/sdb
       -       0        0        1      removed
       2       8       48        2      active sync set-A   /dev/sdd
       3       8       64        3      active sync set-B   /dev/sde
$ root@ubuntu1:~# mdadm /dev/md10 --add /dev/sdc
mdadm: added /dev/sdc
root@ubuntu1:~# mdadm -D /dev/md10
/dev/md10:
           Version : 1.2
     Creation Time : Thu Oct  8 07:35:01 2026
        Raid Level : raid10
        Array Size : 2093056 (2044.00 MiB 2143.29 MB)
     Used Dev Size : 1046528 (1022.00 MiB 1071.64 MB)
      Raid Devices : 4
     Total Devices : 4
       Persistence : Superblock is persistent

       Update Time : Thu Oct  8 07:37:53 2026
             State : clean
    Active Devices : 4
   Working Devices : 4
    Failed Devices : 0
     Spare Devices : 0

            Layout : near=2
        Chunk Size : 512K

Consistency Policy : resync

              Name : ubuntu1:10  (local to host ubuntu1)
              UUID : 465b52ab:31e937fd:361053ac:bf0a0dc9
            Events : 39

    Number   Major   Minor   RaidDevice State
       0       8       16        0      active sync set-A   /dev/sdb
       4       8       32        1      active sync set-B   /dev/sdc
       2       8       48        2      active sync set-A   /dev/sdd
       3       8       64        3      active sync set-B   /dev/sde
$ root@ubuntu1:~# cat /proc/mdstat
Personalities : [raid0] [raid1] [raid6] [raid5] [raid4] [raid10]
md10 : active raid10 sdc[4] sde[3] sdd[2] sdb[0]
      2093056 blocks super 1.2 512K chunks 2 near-copies [4/4] [UUUU]





$ root@ubuntu1:~# df -h
Filesystem                         Size  Used Avail Use% Mounted on
tmpfs                              392M  1.2M  391M   1% /run
/dev/mapper/ubuntu--vg-ubuntu--lv  9.8G  4.8G  4.6G  52% /
tmpfs                              2.0G     0  2.0G   0% /dev/shm
tmpfs                              5.0M     0  5.0M   0% /run/lock
/dev/sda2                          1.8G  353M  1.3G  22% /boot
tmpfs                              392M  4.0K  392M   1% /run/user/1000
root@ubuntu1:~# parted /dev/md10 mkpart primary ext4 0% 25%
Information: You may need to update /etc/fstab.

$ root@ubuntu1:~# parted /dev/md10 mkpart primary ext4 25% 50%
Information: You may need to update /etc/fstab.

$ root@ubuntu1:~# parted /dev/md10 mkpart primary ext4 50% 75%
Information: You may need to update /etc/fstab.

$ root@ubuntu1:~# parted /dev/md10 mkpart primary ext4 75% 100%
Information: You may need to update /etc/fstab.

$ root@ubuntu1:~# for i in $(seq 1 4); do sudo mkfs.ext4 /dev/md0p$i; done
mke2fs 1.46.5 (30-Dec-2021)
The file /dev/md0p1 does not exist and no size was specified.
mke2fs 1.46.5 (30-Dec-2021)
The file /dev/md0p2 does not exist and no size was specified.
mke2fs 1.46.5 (30-Dec-2021)
The file /dev/md0p3 does not exist and no size was specified.
mke2fs 1.46.5 (30-Dec-2021)
The file /dev/md0p4 does not exist and no size was specified.
root@ubuntu1:~# for i in $(seq 1 4); do sudo mkfs.ext4 /dev/md10p$i; done
mke2fs 1.46.5 (30-Dec-2021)
Creating filesystem with 130560 4k blocks and 130560 inodes
Filesystem UUID: 83085334-4a47-430b-902c-8dcafe957346
Superblock backups stored on blocks:
        32768, 98304

Allocating group tables: done
Writing inode tables: done
Creating journal (4096 blocks): done
Writing superblocks and filesystem accounting information: done

mke2fs 1.46.5 (30-Dec-2021)
Creating filesystem with 130816 4k blocks and 130816 inodes
Filesystem UUID: 48f711af-66d0-41c7-a9a1-8cb161812d02
Superblock backups stored on blocks:
        32768, 98304

Allocating group tables: done
Writing inode tables: done
Creating journal (4096 blocks): done
Writing superblocks and filesystem accounting information: done

mke2fs 1.46.5 (30-Dec-2021)
Creating filesystem with 130816 4k blocks and 130816 inodes
Filesystem UUID: 407f3099-5ab3-4fed-aa65-3cbc60d4e1a4
Superblock backups stored on blocks:
        32768, 98304

Allocating group tables: done
Writing inode tables: done
Creating journal (4096 blocks): done
Writing superblocks and filesystem accounting information: done

mke2fs 1.46.5 (30-Dec-2021)
Creating filesystem with 130560 4k blocks and 130560 inodes
Filesystem UUID: 3472801c-a48a-449e-8ea5-223f429043fe
Superblock backups stored on blocks:
        32768, 98304

Allocating group tables: done
Writing inode tables: done
Creating journal (4096 blocks): done
Writing superblocks and filesystem accounting information: done


$ root@ubuntu1:~# lsblk
NAME                      MAJ:MIN RM   SIZE RO TYPE   MOUNTPOINTS
loop0                       7:0    0  63.9M  1 loop   /snap/core20/2318
loop1                       7:1    0  63.8M  1 loop   /snap/core20/2922
loop2                       7:2    0    87M  1 loop   /snap/lxd/29351
loop3                       7:3    0  38.8M  1 loop   /snap/snapd/21759
loop4                       7:4    0  44.7M  1 loop   /snap/snapd/28254
loop5                       7:5    0    74M  1 loop   /snap/core22/2955
loop6                       7:6    0 115.2M  1 loop   /snap/lxd/40911
sda                         8:0    0    20G  0 disk
├─sda1                      8:1    0     1M  0 part
├─sda2                      8:2    0   1.8G  0 part   /boot
└─sda3                      8:3    0  18.2G  0 part
  └─ubuntu--vg-ubuntu--lv 252:0    0    10G  0 lvm    /
sdb                         8:16   0     1G  0 disk
└─md10                      9:10   0     2G  0 raid10
  ├─md10p1                259:2    0   510M  0 part
  ├─md10p2                259:3    0   511M  0 part
  ├─md10p3                259:6    0   511M  0 part
  └─md10p4                259:7    0   510M  0 part
sdc                         8:32   0     1G  0 disk
└─md10                      9:10   0     2G  0 raid10
  ├─md10p1                259:2    0   510M  0 part
  ├─md10p2                259:3    0   511M  0 part
  ├─md10p3                259:6    0   511M  0 part
  └─md10p4                259:7    0   510M  0 part
sdd                         8:48   0     1G  0 disk
└─md10                      9:10   0     2G  0 raid10
  ├─md10p1                259:2    0   510M  0 part
  ├─md10p2                259:3    0   511M  0 part
  ├─md10p3                259:6    0   511M  0 part
  └─md10p4                259:7    0   510M  0 part
sde                         8:64   0     1G  0 disk
└─md10                      9:10   0     2G  0 raid10
  ├─md10p1                259:2    0   510M  0 part
  ├─md10p2                259:3    0   511M  0 part
  ├─md10p3                259:6    0   511M  0 part
  └─md10p4                259:7    0   510M  0 part

