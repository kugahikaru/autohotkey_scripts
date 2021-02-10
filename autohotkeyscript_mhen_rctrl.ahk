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
global sendLAltUpOnRCtrlUp := 0
global sendRCtrlUpOnLAltUp := 0

*tab::
{
  if (GetKeyState("RCtrl", "P") AND GetKeyState("LShift", "P"))
  {
    sendLAltUpOnRCtrlUp := 1
    Send {RCtrl up}{LShift down}{LAlt down}{tab}
    KeyWait, tab
  }
  else if (GetKeyState("RCtrl", "P"))
  {
    sendLAltUpOnRCtrlUp := 1
    Send {RCtrl up}{LAlt down}{tab}
    KeyWait, tab
  }
  else if (GetKeyState("LAlt", "P") AND GetKeyState("LShift", "P"))
  {
    sendRCtrlUpOnLAltUp := 1
    Send {LAlt up}{LShift down}{RCtrl down}{tab}
    KeyWait, tab
  }
  else if (GetKeyState("LAlt", "P"))
  {
    sendRCtrlUpOnLAltUp := 1
    Send {LAlt up}{RCtrl down}{tab}
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

~RCtrl up::
{
  if(sendLAltUpOnRCtrlUp == 1)
  {
    sendLAltUpOnRCtrlUp := 0
    send {LAlt up}
  }
  else
  {
    send {RCtrl up}
  }
  return
}

~LAlt up::
{
  if(sendRCtrlUpOnLAltUp == 1)
  {
    sendRCtrlUpOnLAltUp := 0
    send {RCtrl up}
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