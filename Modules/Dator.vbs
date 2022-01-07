' ##################################################################################
' ##     			  Systemstats © 2016-2021 Göteborgs Stad  	 				  ##
' ##   	  	  		 Utvecklat av Eddy Hebib och Mattias From					  ##
' ##################################################################################


'Modul skapad: /MF170615
'Senast uppdaterad: /MF170704 Nu med UTF8 och fler funktioner.
On Error Resume Next

'En liten delay för att Intras skript skall exita före vårt så att vi får rätt data för inloggningshistorik...
WScript.Sleep 40000

Dim WshNetwork
Dim ComputerName
Set WshNetwork = CreateObject("WScript.Network")
ComputerName = WshNetwork.ComputerName

Set objADSysInfo = CreateObject("ADSystemInfo")
strComputerName = objADSysInfo.ComputerName

Set objComputer = GetObject("LDAP://" & strComputerName)
strOUName = objComputer.DistinguishedName
strOUs = Split(strOUName, ",")
strOU = Split(strOUs(1), "=")

Dim objStream
Set objStream = CreateObject("ADODB.Stream")
objStream.CharSet = "utf-8"
objStream.Open

Set objUser = GetObject("LDAP://" & strComputerName)
objComputer.GetInfo
cn = objComputer.Get("cn")

Set objUser = GetObject("LDAP://" & strComputerName)
objComputer.GetInfo
homePhone = objComputer.Get("homePhone")

Set objUser = GetObject("LDAP://" & strComputerName)
objComputer.GetInfo
operatingSystem = objComputer.Get("operatingSystem")

Set objUser = GetObject("LDAP://" & strComputerName)
objComputer.GetInfo
operatingSystemVersion = objComputer.Get("operatingSystemVersion")

Set objUser = GetObject("LDAP://" & strComputerName)
objComputer.GetInfo
whenCreated = objComputer.Get("whenCreated")

Set objComputer = GetObject("LDAP://" & strComputerName)
objComputer.GetInfo
streetAddress = objComputer.Get("streetAddress")

Set objComputer = GetObject("LDAP://" & strComputerName)
objComputer.GetInfo
homePostalAddress = objComputer.Get("homePostalAddress")

dim NIC1, Nic, StrIP, CompName
Set NIC1 =     GetObject("winmgmts:").InstancesOf("Win32_NetworkAdapterConfiguration")
For Each Nic in NIC1

    if Nic.IPEnabled then
        StrIP = Nic.IPAddress(i)
    End if
Next

Set objComputer = GetObject("LDAP://" & strComputerName)
objComputer.GetInfo
primaryTelexNumber = objComputer.Get("primaryTelexNumber")

CurrentTimeStamp = FormatDateTime(now)

' Retrieving BIOS Information
Dim strComputer, colBIOS, objBIOS, i
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
 
Set colBIOS = objWMIService.ExecQuery _
    ("Select * from Win32_BIOS")
 
For each objBIOS in colBIOS
    biosver = objBIOS.Name
	biosdate = objBIOS.ReleaseDate
	biosdate = Left(biosdate, 8)
    For i = 0 to Ubound(objBIOS.BiosCharacteristics)
    Next
Next

objStream.WriteText "" & cn
objStream.WriteText "" & vbnewline
objStream.WriteText "" & homePhone
objStream.WriteText "" & vbnewline
objStream.WriteText "" & operatingSystem & " " & operatingSystemVersion
objStream.WriteText "" & vbnewline
objStream.WriteText "" & vbnewline
objStream.WriteText "" & "Datorkontot skapat: " & whenCreated
objStream.WriteText "" & vbnewline
objStream.WriteText "" & vbnewline
objStream.WriteText "" & "Inloggningshistorik: "
objStream.WriteText "" & vbnewline
objStream.WriteText "" & streetAddress
objStream.WriteText "" & vbnewline
objStream.WriteText "" & vbnewline
objStream.WriteText "" & "Serienummer: " & homePostalAddress
objStream.WriteText "" & vbnewline
objStream.WriteText "" & "IP-adress: " & StrIP
objStream.WriteText "" & vbnewline
objStream.WriteText "" & "MAC-adress: " & primaryTelexNumber
objStream.WriteText "" & vbnewline
objStream.WriteText "" & "BIOS-version: " & biosver
objStream.WriteText "" & vbnewline
objStream.WriteText "" & "BIOS-datum: " & biosdate
objStream.WriteText "" & vbnewline
objStream.WriteText "" & vbnewline
objStream.WriteText "" & "Datan genererad: " & CurrentTimeStamp

Set oShell = CreateObject( "WScript.Shell" )
stslog=oShell.ExpandEnvironmentStrings("%stslog%")
objStream.SaveToFile stslog & "\Details\" & ComputerName &".txt", 2