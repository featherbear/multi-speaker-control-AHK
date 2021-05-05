#NoTrayIcon
AUDIO_DEVICE=4

UnmuteIfNonZero()
{
  global AUDIO_DEVICE
  SoundGet,isMute,,MUTE,%AUDIO_DEVICE%
  if isMute=On
  {
    SoundSet,0,,MUTE,%AUDIO_DEVICE%
  }
}

^Volume_Down::
SoundSet,-5,,,%AUDIO_DEVICE%
SoundGet,vol,,VOLUME,%AUDIO_DEVICE%
if vol=0
{
  SoundSet,1,,MUTE,%AUDIO_DEVICE%
} else {
  UnmuteIfNonZero()
}

return

^Volume_Up::
SoundSet,+5,,,%AUDIO_DEVICE%
UnmuteIfNonZero()
return

^Volume_Mute::SoundSet,+0,,MUTE,%AUDIO_DEVICE%
