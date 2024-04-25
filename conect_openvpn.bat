@echo off

cd C:\Users

dir /b > C:\RMM\OpenVpn\Users.txt

for /F "tokens=*" %%A in (C:\RMM\OpenVpn\Users.txt) do (

"C:\Program Files\OpenVPN\bin\openvpn-gui.exe" --silent_connection [1] --connect %%A.ovpn

)
