' ##################################################################################
' ##     			  Systemstats © 2016-2021 Göteborgs Stad  	 				  ##
' ##   	  	  		 Utvecklat av Eddy Hebib och Mattias From					  ##
' ##################################################################################


'Modul skapad: /MF170615
'Uppdaterad: /MF171205 Nu med förvaltningsvariabler från AD:t.
'Uppdaterad: /MF170704 Nu med UTF8 och fler funktioner.
On Error Resume Next

'En liten delay för att Intras skript skall exita före vårt så att vi får rätt data för inloggningshistorik...
WScript.Sleep 40000

Dim WshNetwork
Dim UserName
Set WshNetwork = CreateObject("WScript.Network")
UserName = WshNetwork.UserName

Set objADSysInfo = CreateObject("ADSystemInfo")
strUserName = objADSysInfo.UserName

Set objUser = GetObject("LDAP://" & strUserName)
strOUName = objUser.DistinguishedName
strOUs = Split(strOUName, ",")
strOU = Split(strOUs(1), "=")

Dim objStream
Set objStream = CreateObject("ADODB.Stream")
objStream.CharSet = "utf-8"
objStream.Open

Set objUser = GetObject("LDAP://" & strUserName)
objUser.GetInfo
displayName = objUser.Get("displayName")

Set objUser = GetObject("LDAP://" & strUserName)
objUser.GetInfo
cn = objUser.Get("cn")

Set objUser = GetObject("LDAP://" & strUserName)
objUser.GetInfo
telephoneNumber = objUser.Get("telephoneNumber")

Set objUser = GetObject("LDAP://" & strUserName)
objUser.GetInfo
mobile = objUser.Get("mobile")

Set objUser = GetObject("LDAP://" & strUserName)
objUser.GetInfo
physicalDeliveryOfficeName = objUser.Get("physicalDeliveryOfficeName")

Set objUser = GetObject("LDAP://" & strUserName)
objUser.GetInfo
whenCreated = objUser.Get("whenCreated")

Set objUser = GetObject("LDAP://" & strUserName)
objUser.GetInfo
streetAddress = objUser.Get("streetAddress")

Set objUser = GetObject("LDAP://" & strUserName)
objUser.GetInfo
logonCount = objUser.Get("logonCount")

Set objUser = GetObject("LDAP://" & strUserName)
objUser.GetInfo
department = objUser.Get("department")

Set objUser = GetObject("LDAP://" & strUserName)
objUser.GetInfo
extensionAttribute3 = objUser.Get("extensionAttribute3")

Set objUser = GetObject("LDAP://" & strUserName)
objUser.GetInfo
mail = objUser.Get("mail")

Set objUser = GetObject("LDAP://" & strUserName)
objUser.GetInfo
extensionAttribute10 = objUser.Get("extensionAttribute10")

Set objUser = GetObject("LDAP://" & strUserName)
objUser.GetInfo
extensionAttribute11 = objUser.Get("extensionAttribute11")

Set objUser = GetObject("LDAP://" & strUserName)
objUser.GetInfo
extensionAttribute12 = objUser.Get("extensionAttribute12")

Set objUser = GetObject("LDAP://" & strUserName)
objUser.GetInfo
homeDrive = objUser.Get("homeDrive")

Set objUser = GetObject("LDAP://" & strUserName)
objUser.GetInfo
homeDirectory = objUser.Get("homeDirectory")

Set objUser = GetObject("LDAP://" & strUserName)
objUser.GetInfo
info = objUser.Get("info")

Set objUser = GetObject("LDAP://" & strUserName)
objUser.GetInfo
manager = objUser.Get("manager")

strChef = manager
Set objUser = GetObject("LDAP://" & strChef)
objUser.GetInfo
ChefdisplayName = objUser.Get("displayName")

CurrentTimeStamp = FormatDateTime(now)

objStream.WriteText "" & displayName
objStream.WriteText "" & vbnewline
objStream.WriteText "" & cn
objStream.WriteText "" & vbnewline
objStream.WriteText "" & telephoneNumber & " | " & mobile & " | " & physicalDeliveryOfficeName
objStream.WriteText "" & vbnewline
objStream.WriteText "" & vbnewline
objStream.WriteText "" & "Kontot skapat: " & whenCreated
objStream.WriteText "" & vbnewline
objStream.WriteText "" & vbnewline
objStream.WriteText "" & "Inloggningshistorik: "
objStream.WriteText "" & vbnewline
objStream.WriteText "" & streetAddress
objStream.WriteText "" & vbnewline
objStream.WriteText "" & vbnewline
objStream.WriteText "" & "Antal inloggningar: " & logonCount
objStream.WriteText "" & vbnewline
objStream.WriteText "" & vbnewline
objStream.WriteText "" & "Chef: " & ChefdisplayName
objStream.WriteText "" & vbnewline
objStream.WriteText "" & vbnewline
objStream.WriteText "" & "Personal under " & ChefdisplayName&":"
objStream.WriteText "" & vbnewline

For Each strValue in objUser.directReports
Set objUser = GetObject("LDAP://" & strValue)
objUser.GetInfo
EmpdisplayName = objUser.Get("displayName")
objStream.WriteText EmpdisplayName
objStream.WriteText "" & vbnewline
'objStream.WriteText strValue
'WScript.Echo "Direct Reports: " & strValue
Next

objStream.WriteText "" & vbnewline
objStream.WriteText "" & "Verksamhet: " & extensionAttribute3 & " " & department
objStream.WriteText "" & vbnewline
objStream.WriteText "" & "E-post: " & mail
objStream.WriteText "" & vbnewline
objStream.WriteText "" & extensionAttribute10 & " | " & extensionAttribute11 & " | " & extensionAttribute12
objStream.WriteText "" & vbnewline
objStream.WriteText "" & "Hemkatalogens enhetsbeteckning: " & homeDrive & " | Path: "
objStream.WriteText "" & vbnewline
objStream.WriteText "" & homeDirectory
objStream.WriteText "" & vbnewline
objStream.WriteText "" & vbnewline
objStream.WriteText "" & "Datan genererad: " & CurrentTimeStamp
objStream.WriteText "" & vbnewline
objStream.WriteText "" & vbnewline
objStream.WriteText "" & "------------------------------------"
objStream.WriteText "" & vbnewline
objStream.WriteText "" & info

Set oShell = CreateObject( "WScript.Shell" )
stslog=oShell.ExpandEnvironmentStrings("%stslog%")
objStream.SaveToFile stslog & "\Details\" & UserName &".txt", 2