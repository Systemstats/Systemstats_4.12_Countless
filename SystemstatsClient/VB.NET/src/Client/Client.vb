Module Client
    ' Systemstats Client version 1.0
    ' (C) 2017 Eddy Hebib
    Sub Main()

        If My.Computer.Network.IsAvailable Then
            Process.Start("\\SERVER\Systemstats$\Systemstats.cmd")
        Else
            Exit Sub
        End If
    End Sub

End Module
