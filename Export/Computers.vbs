'This script will list all disable accounts in the domain
'Cheyenne Harden 9.28.06
'Modified by Mattias From 7.18.17

Const ADS_UF_ACCOUNTDISABLE = 2
Const OPEN_FILE_FOR_WRITING = 2
strFile = "Computers.txt"
strWritePath = "C:\Systemstats\Export\Computers\" & strFile
strDirectory = "C:\Systemstats\Export\Computers\"

'#########
Set objFSO1 = CreateObject("Scripting.FileSystemObject")

If objFSO1.FileExists("c:\" & strFile) Then
	Set objFolder = objFSO1.GetFile("c:\" & strFile)

Else
	Set objFile = objFSO1.CreateTextFile(strDirectory & strFile)
	'Wscript.Echo "Just created " & objFolder & "\" & strFile
	objFile = ""

End If
'#########
Set fso = CreateObject("Scripting.FileSystemObject")
Set textFile = fso.OpenTextFile(strWritePath, OPEN_FILE_FOR_WRITING)

Set objDictionary = CreateObject("Scripting.Dictionary")

'textFile.WriteLine "AD-konton:"
'textFile.WriteLine ""

Set objOU = GetObject("LDAP://OU=Bärbara Datorer,OU=XXX,OU=XXX,DC=YOURDOMAIN,DC=LOCAL")
objOU.Filter = Array("Computer")

For Each objComputer in objOU
BN = objComputer.cn

If Not objDictionary.Exists(BN) Then
textFile.WriteLine BN
'Wscript.Echo strUser
End If
Next


Set objOU = GetObject("LDAP://OU=Stationära Datorer,OU=XXX,OU=XXX,DC=YOURDOMAIN,DC=LOCAL")
objOU.Filter = Array("Computer")

For Each objComputer in objOU
WN = objComputer.cn

If Not objDictionary.Exists(WN) Then
textFile.WriteLine WN
'Wscript.Echo strUser
End If
Next


textFile.WriteLine ""
CurrentTimeStamp = FormatDateTime(now)
textFile.WriteLine "Rapporten genererad: " & CurrentTimeStamp

WScript.Quit