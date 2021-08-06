#!/bin/bash
# author: Mauricio Beltrán <mgbeltranb@gmail.com>
# preface: Script para levantar un cluster de kubernetes con 2 maquinas virtuales
cat /proc/cpuinfo | awk '/^processor/{print $3}' | wc -l > cpu
grep MemTotal /proc/meminfo | awk '{print $2}' > mem