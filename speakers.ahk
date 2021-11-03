#NoTrayIcon

#include VA.ahk

deviceName := "BGM"
device := VA_GetDevice(deviceName)
if !device {
  MsgBox Could not find device: %deviceName%
  exit
}

^Volume_Down::
volume := VA_GetMasterVolume("", device)
VA_SetMasterVolume(volume - 5, "", device)
VA_SetMasterMute(volume - 5 <= 0, device)
return

^Volume_Up::
volume := VA_GetMasterVolume("", device)
VA_SetMasterVolume(volume + 5, "", device)
VA_SetMasterMute(0, device)
return

^Volume_Mute::
VA_SetMasterMute(!VA_GetMasterMute(device), device)
