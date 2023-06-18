Imports System.Management.Automation
Imports LoremNET

' By overwhelming demand by Ben Reader (@Powers_hell)
<Cmdlet(VerbsCommon.Get, "PEURandomLetter")> _
Public Class GetPEURandomLetterCmdlet
   Inherits Cmdlet

   Protected Overrides Sub EndProcessing()
      WriteObject(Lorem.Letter())
   End Sub
End Class