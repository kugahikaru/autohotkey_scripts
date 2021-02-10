;;無変換キー自体を有効化
sc07B::
Send, {sc07B}
return

;; 無変換+hjklでカーソル移動、Blindをつけると修飾キー組み合わせ（Shift、Ctrなど）も可能
sc07B & h::Send, {Blind}{left}
sc07B & j::Send, {Blind}{down}
sc07B & k::Send, {Blind}{up}
sc07B & l::Send, {Blind}{right}

;無変換＋tabをalt+tab
sc07B & Tab::
Send {Blind}{Ctrl down}{Tab}
Keywait Control
Send {Ctrl up}
return

;alt+tabとctrl+tabを入れ替え
global sendLAltUpOnLCtrlUp := 0
global sendLCtrlUpOnLAltUp := 0

*tab::
{
  if (GetKeyState("LCtrl", "P") AND GetKeyState("LShift", "P"))
  {
    sendLAltUpOnLCtrlUp := 1
    Send {LCtrl up}{LShift down}{LAlt down}{tab}
    KeyWait, tab
  }
  else if (GetKeyState("LCtrl", "P"))
  {
    sendLAltUpOnLCtrlUp := 1
    Send {LCtrl up}{LAlt down}{tab}
    KeyWait, tab
  }
  else if (GetKeyState("LAlt", "P") AND GetKeyState("LShift", "P"))
  {
    sendLCtrlUpOnLAltUp := 1
    Send {LAlt up}{LShift down}{LCtrl down}{tab}
    KeyWait, tab
  }
  else if (GetKeyState("LAlt", "P"))
  {
    sendLCtrlUpOnLAltUp := 1
    Send {LAlt up}{LCtrl down}{tab}
    KeyWait, tab
  }
  else if (GetKeyState("LShift", "P"))
  {
    Send {LShift down}{tab}
    KeyWait, tab
  }
  else
  {
    send {tab}
  }
  return
}

~LCtrl up::
{
  if(sendLAltUpOnLCtrlUp == 1)
  {
    sendLAltUpOnLCtrlUp := 0
    send {LAlt up}
  }
  else
  {
    send {LCtrl up}
  }
  return
}

~LAlt up::
{
  if(sendLCtrlUpOnLAltUp == 1)
  {
    sendLCtrlUpOnLAltUp := 0
    send {LCtrl up}
  }
  else
  {
    send {LAlt up}
  }
  return
}

sc07B & Space::Send, {vkF3}
return

;ウィンドウ移動
sc07B & '::Send, {LWin down}{right}{Lwin up}
sc07B & `;::Send, {LWin down}{left}{Lwin up}
sc07B & [::Send, {LWin down}{up}{Lwin up}
sc07B & /::Send, {LWin down}{down}{Lwin up}
sc07B & -::Send, {Shift down}{LWin down}{right}{Shift up}{Lwin up}
;ウィンドウ最大化
sc07B & m::Send, {LWin down}{up}{Lwin up}