#SingleInstance, Force
#Requires Autohotkey v1.1.33+
;--
;@Ahk2Exe-SetVersion     0.1.0
;@Ahk2Exe-SetMainIcon    res\main.ico
;@Ahk2Exe-SetProductName ColorUnderMouse
;@Ahk2Exe-SetDescription Gets the current hex value of the pixel under the mouse
;*******************************************************
; Want a clear path for learning AutoHotkey; Take a look at our AutoHotkey Udemy courses. 
; They're structured in a way to make learning AHK EASY.
; Right now you can  get a coupon code here: https://the-Automator.com/Learn
;*******************************************************
;{#Includes
 #Include <ScriptObject\ScriptObject>
 
 global script := {base         : script
                  ,name          : regexreplace(A_ScriptName, "\.\w+")
                  ,version      : "0.1.0"
                  ,author       : "Joe Glines"
                  ,email        : "joe.glines@the-automator.com"
                  ,crtdate      : "July 28, 2022"
                  ,moddate      : "July 28, 2022"
                  ,homepagetext : ""
                  ,homepagelink : ""
                  ,donateLink   : "https://www.paypal.com/donate?hosted_button_id=MBT5HSD9G94N6"
                  ,resfolder    : A_ScriptDir "\res"
                  ,iconfile     : A_ScriptDir "\res\main.ico"
                  ,configfile   : A_ScriptDir "\settings.ini"
                  ,configfolder : A_ScriptDir ""}
;}
;{#Directives
;}--
;{#Settings
 Menu, Tray, Icon, C:\WINDOWS\system32\shell32.dll,131 ;Set icon to colored butterfly
;}

script.GetLicense()

;**************************************
#c::  ;Windows+C hotkey will get color at current position of mouse.  Change the hotkey to your preference
MouseGetPos,x,y
PixelGetColor,Color,%x%,%y%
Clipboard:=Format("#{:06X}",(color&255)<<16|color&65280|color>>16)

Gui, main:new, +ToolWindow
Gui, Font, s25, Segoe UI
Gui, add, text, center, % "Copied: " Clipboard "`nx" x ", y" y 
Gui, show
return
