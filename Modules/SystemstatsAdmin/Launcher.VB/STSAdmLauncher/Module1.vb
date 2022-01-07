Module Module1
    Public Sub GetEnvironmentVariable()
        Dim strComputerName As String
        strComputerName = Environment.GetEnvironmentVariable("COMPUTERNAME")
        ' MessageBox.Show(strComputerName)
    End Sub

    Sub Main()
        ' Systemstats Client version 1.0
        ' (C) 2017 eddy@systemstats.se

        Console.WriteLine("Startar SystemStatsAdmin")
        Console.WriteLine("strComputerName")

        If My.Computer.Network.IsAvailable Then
        '   Paketera med sökväg till aktuell Systemstats server. 
        '   Process.Start("\\systemstats.lab3.home\MODULES$\SystemstatsAdmin\SystemstatsAdmin.hta")
            Process.Start("C:\SystemstatsAdmin\SystemstatsAdmin.hta")
        Else
            Exit Sub
        End If


    End Sub

End Module
