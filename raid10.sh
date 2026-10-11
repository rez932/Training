#!/bin/bash
#
# Скрипт создания RAID 10 из 4 дисков /dev/sdb,/dev/sdc,/dev/sdd,/dev/sde
# Добавляем 4 диска по 1 Гб в виртуальную машину

# ==================== ШАГ 1: ОЧИСТКА SUPERBLOCK ====================
echo ">>> Шаг 1: Очистка superblock на дисках..."
mdadm --zero-superblock --force /dev/sd{b,c,d,e} || true

# ==================== ШАГ 2: СОЗДАНИЕ RAID 10 ====================
echo ">>> Шаг 2: Создание RAID 10..."
mdadm --create --verbose /dev/md10 -l 10 -n 4 /dev/sd{b,c,d,e}

# ==================== ШАГ 3: ПРОВЕРКА ====================
echo ">>> Шаг 3: Проверка статуса RAID..."
cat /proc/mdstat
mdadm -D /dev/md10
