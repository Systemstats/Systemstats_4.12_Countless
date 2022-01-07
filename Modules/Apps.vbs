' ##################################################################################
' ##     			  Systemstats © 2016-2021 Göteborgs Stad  	 				  ##
' ##   	  	  		 Utvecklat av Eddy Hebib och Mattias From					  ##
' ##################################################################################

On Error Resume Next

Const HKLM = &H80000002 'HKEY_LOCAL_MACHINE 
strComputer = "." 
strKey = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\" 
strEntry1a = "DisplayName" 
strEntry1b = "QuietDisplayName" 
strEntry2 = "InstallDate" 
strEntry3 = "VersionMajor" 
strEntry4 = "VersionMinor" 
strEntry5 = "EstimatedSize" 

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

Set objReg = GetObject("winmgmts://" & strComputer & _ 
 "/root/default:StdRegProv") 
objReg.EnumKey HKLM, strKey, arrSubkeys 
'objStream.WriteText "Installed Applications" & VbCrLf 
For Each strSubkey In arrSubkeys 
  intRet1 = objReg.GetStringValue(HKLM, strKey & strSubkey, _ 
   strEntry1a, strValue1) 
  If intRet1 <> 0 Then 
    objReg.GetStringValue HKLM, strKey & strSubkey, _ 
     strEntry1b, strValue1 
  End If 
  If strValue1 <> "" Then 
    objStream.WriteText VbCrLf & strValue1 & ";"
  End If 
  objReg.GetStringValue HKLM, strKey & strSubkey, _ 
   strEntry2, strValue2 
  If strValue2 <> "" Then 
    objStream.WriteText strValue2 & ";"
  End If 
  objReg.GetDWORDValue HKLM, strKey & strSubkey, _ 
   strEntry3, intValue3 
  objReg.GetDWORDValue HKLM, strKey & strSubkey, _ 
   strEntry4, intValue4 
  If intValue3 <> "" Then 
    objStream.WriteText intValue3 & "." & intValue4 & ";"
  End If 
  objReg.GetDWORDValue HKLM, strKey & strSubkey, _ 
   strEntry5, intValue5 
  If intValue5 <> "" Then 
    'objStream.WriteText "Estimated Size: " & Round(intValue5/1024, 3) & " megabytes" 
  End If 
Next 

Set oShell = CreateObject( "WScript.Shell" )
stslog=oShell.ExpandEnvironmentStrings("%stslog%")
objStream.SaveToFile stslog & "\Apps\" & ComputerName &".csv", 2