Imports System.Management.Automation
Imports LoremNET

<Cmdlet(VerbsCommon.Get, "PEURandomLetter")> _
Public Class GetPEURandomLetterCmdlet
   Inherits Cmdlet

   Protected Overrides Sub EndProcessing()
      WriteObject(Lorem.Letter())
   End Sub
End Class