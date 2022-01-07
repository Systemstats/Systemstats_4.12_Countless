'This script will list all disable accounts in the domain
'Cheyenne Harden 9.28.06
'Modified by Mattias From 7.18.17

On Error Resume Next
'Filen får felmeddelande om inte On Error Resume Next är på. Har att göra med ChefdisplayName/Manager. Dock
'genereras filen korrekt. /MF180614

Const ADS_UF_ACCOUNTDISABLE = 2
Const OPEN_FILE_FOR_WRITING = 2
strFile = "Accounts-Full.csv"
strWritePath = "C:\Systemstats\Export\Accounts\" & strFile
strDirectory = "C:\Systemstats\Export\Accounts\"

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

Set objOU = GetObject("LDAP://OU=XXX,OU=XXX,OU=XXX,DC=YOURDOMAIN,DC=LOCAL")
objOU.Filter = Array("User")

For Each objUser in objOU
sAMAccountName = objUser.sAMAccountName
displayName = objUser.displayName
physicalDeliveryOfficeName = objUser.physicalDeliveryOfficeName
telephoneNumber = objUser.telephoneNumber
mobile = objUser.mobile
mail = objUser.mail
manager = objUser.manager
userAccountControl = objUser.userAccountControl
info = objUser.info


Skapat = objUser.whenCreated

If Not objDictionary.Exists(strUser) Then


Set objUser = GetObject("LDAP://" & manager)
objUser.GetInfo
ChefdisplayName = objUser.Get("displayName")
textFile.WriteLine userAccountControl & ";" & sAMAccountName & ";" & displayName & ";" & info & ";" & physicalDeliveryOfficeName & ";" & telephoneNumber & ";" & mobile & ";" & mail & ";" & ChefdisplayName
End If
Next

'textFile.WriteLine ""
CurrentTimeStamp = FormatDateTime(now)
'textFile.WriteLine "Rapporten genererad: " & CurrentTimeStamp

WScript.Quit