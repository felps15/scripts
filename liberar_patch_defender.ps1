Set-ExecutionPolicy -ExecutionPolicy Unrestricted -force

Add-MpPreference -ExclusionPath "C:\Program Files (x86)\Advanced Monitoring Agent\scripts" -Force
Add-MpPreference -ExclusionPath "C:\Program Files (x86)\Advanced Monitoring Agent" -Force
Add-MpPreference -ExclusionPath "C:\rmm\scripts\programas\" -Force
Add-MpPreference -ExclusionPath "C:\rmm\scripts" -Force
Add-MpPreference -ExclusionPath "C:\rmm\" -Force
Add-MpPreference -ExclusionExtension vbs
Add-MpPreference -ExclusionExtension bat
Add-MpPreference -ExclusionExtension ps1
Add-MpPreference -ExclusionExtension .bat
Add-MpPreference -ExclusionExtension .vbs
Add-MpPreference -ExclusionExtension .ps1