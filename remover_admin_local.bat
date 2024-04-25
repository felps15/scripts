@echo off 

net localgroup administradores > c:\rmm\user-admin.txt


 for /F "tokens=*" %%A in (c:\rmm\user-admin.txt) do (

    if %%A == admin_l5 (
        ping localhost
        )
	else (
	
		net localgroup administradores %%A /delete
    )
		net localgroup administradores admin_l5 /add
		net localgroup administradores L5\l5_azuread /add
		