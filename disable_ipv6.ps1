Set-ExecutionPolicy -ExecutionPolicy Unrestricted -ErrorAction SilentlyContinue -FORCE

Disable-NetAdapterBinding -InterfaceAlias "Ethernet" -ComponentID ms_tcpip6
Disable-NetAdapterBinding -Name "Ethernet" -ComponentID ms_tcpip6

Disable-NetAdapterBinding -InterfaceAlias "Wi-Fi" -ComponentID ms_tcpip6
Disable-NetAdapterBinding -Name "Wi-Fi" -ComponentID ms_tcpip6