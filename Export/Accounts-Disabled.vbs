'This script will list all disable accounts in the domain
'Cheyenne Harden 9.28.06
'Modified by Mattias From 7.18.17

Const ADS_UF_ACCOUNTDISABLE = 2
Const OPEN_FILE_FOR_WRITING = 2
strFile = "Accounts-Disabled.txt"
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

Set objConnection = CreateObject("ADODB.Connection")
objConnection.Open "Provider=ADsDSOObject;"
Set objCommand = CreateObject("ADODB.Command")
objCommand.ActiveConnection = objConnection
' Below put in your domain name like this (e.g., dc=CONTOSO,dc=com)
' The 2nd dc= could be "com, net, org, local" or what ever you use.
objCommand.CommandText = _
"<GC://ou=XXX,ou=XXX,ou=XXX,dc=YOURDOMAIN,dc=LOCAL>;(objectCategory=User)" & _
";userAccountControl,name,whenCreated,displayName;subtree" 
Set objRecordSet = objCommand.Execute

textFile.WriteLine "Följande användarkonton är inaktiverade:"
textFile.WriteLine ""

intCounter = 0
While Not objRecordset.EOF
intUAC=objRecordset.Fields("userAccountControl")
If intUAC AND ADS_UF_ACCOUNTDISABLE Then
'WScript.echo objRecordset.Fields("displayName") & " is disabled"

Name = objRecordset.Fields("name")
Fullname = objRecordset.Fields("displayName")
Skapat = objRecordset.Fields("whenCreated")

textFile.WriteLine "Skapat: " & Skapat & " | AD-konto: " & Name & " | Namn: " & Fullname


'textFile.WriteLine(objRecordset.Fields("displayName"))
intCounter = intCounter + 1
End If
objRecordset.MoveNext
Wend

'WScript.Echo VbCrLf & "A total of " & intCounter & " accounts are disabled."

textFile.WriteLine ""
textFile.WriteLine "Totalt antal inaktiverade konton: " & intCounter
textFile.WriteLine ""
CurrentTimeStamp = FormatDateTime(now)
textFile.WriteLine "Rapporten genererad: " & CurrentTimeStamp

objConnection.Close

WScript.Quit