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


