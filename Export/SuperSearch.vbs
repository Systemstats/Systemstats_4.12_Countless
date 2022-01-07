'This script will list all disable accounts in the domain
'Cheyenne Harden 9.28.06
'Modified by Mattias F & Gustav A 8.16.19

Const ADS_UF_ACCOUNTDISABLE = 2
Const OPEN_FILE_FOR_WRITING = 2
strFile = "SuperSearch.xml"
strWritePath = "C:\Systemstats\Export\" & strFile
strDirectory = "C:\Systemstats\Export\"

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

textFile.WriteLine "<pages>"


Set objOU = GetObject("LDAP://OU=Standard,OU=Konton,OU=Skantefjall,DC=skantefjall,DC=local")
objOU.Filter = Array("User")

For Each objUser in objOU
Fullname = objUser.displayName
Name = objUser.sAMAccountName
Skapat = objUser.whenCreated
Ank = objUser.telephoneNumber
Rum = objUser.physicalDeliveryOfficeName
If Not objDictionary.Exists(strUser) Then

textFile.WriteLine "<link><title>" & Fullname & " | " & Name & " | " & Ank & " | " & Rum & "</title><url>/data/details/" & Name & ".txt</url></link>"

End If
Next


Set objOU = GetObject("LDAP://OU=Laptops,OU=Datorer,OU=Skantefjall,DC=skantefjall,DC=local")
objOU.Filter = Array("Computer")

For Each objComputer in objOU
BN = objComputer.cn

If Not objDictionary.Exists(BN) Then

textFile.WriteLine "<link><title>" & BN & "</title><url>/data/details/" & BN & ".txt</url></link>"

End If
Next


Set objOU = GetObject("LDAP://OU=Desktops,OU=Datorer,OU=Skantefjall,DC=skantefjall,DC=local")
objOU.Filter = Array("Computer")

For Each objComputer in objOU
WN = objComputer.cn

If Not objDictionary.Exists(WN) Then

textFile.WriteLine "<link><title>" & WN & "</title><url>/data/details/" & WN & ".txt</url></link>"

End If
Next


textFile.WriteLine "</pages>"


WScript.Quit