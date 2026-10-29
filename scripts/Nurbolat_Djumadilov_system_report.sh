#!/bin/bash
# System report script - Nurbolat Djumadilov, IT2-2313
# Works on macOS and Linux

STUDENT="Nurbolat Djumadilov"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LOG_FILE="$SCRIPT_DIR/../logs/Nurbolat_Djumadilov_system_report.log"

{
echo "=========================================="
echo " SYSTEM REPORT"
echo "=========================================="
echo "Student name : $STUDENT"
echo "Date & time  : $(date '+%Y-%m-%d %H:%M:%S')"
echo "Username     : $(whoami)"

if [ "$(uname)" = "Darwin" ]; then
    echo "OS           : $(sw_vers -productName) $(sw_vers -productVersion)"
    echo "Kernel       : $(uname -sr)"
    echo "CPU          : $(sysctl -n machdep.cpu.brand_string), $(sysctl -n hw.ncpu) cores"
    echo "Memory total : $(( $(sysctl -n hw.memsize) / 1024 / 1024 / 1024 )) GB"
else
    echo "OS           : $(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '\"')"
    echo "Kernel       : $(uname -sr)"
    echo "CPU          : $(grep -m1 'model name' /proc/cpuinfo | cut -d: -f2 | xargs), $(nproc) cores"
    echo "Memory       :"
    free -h
fi

echo "------------------------------------------"
echo "Disk usage:"
df -h /
echo "------------------------------------------"
echo "Available disk space on / : $(df -h / | awk 'NR==2 {print $4}')"
echo "=========================================="
echo
} | tee -a "$LOG_FILE"
