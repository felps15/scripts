Add-VpnConnection -Name "L5 VPN-NEW" -ServerAddress "vpn.l5.com.br" -TunnelType Pptp -EncryptionLevel Required -AuthenticationMethod MSChapv2,Chap,Pap -UseWinlogonCredential -AllUserConnection -RememberCredential -PassThru 

rasdial "L5 VPN-NEW"

gpupdate /force

rasdial "L5 VPN-NEW" /d
