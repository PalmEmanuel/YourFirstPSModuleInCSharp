namespace Lorem // use your module name for the namespace

open System.Management.Automation // PowerShell attributes come from this namespace
open LoremNET

/// Describe cmdlet in /// comments
/// Cmdlet attribute takes verb names as strings or verb enums
/// Output type works the same as for PowerShell cmdlets
[<Cmdlet("Get", "RandomColor")>]
[<OutputType(typeof<string>)>]
type GetRandomColorCommand () =
    inherit PSCmdlet ()

    override this.EndProcessing () =
        let randomColorString = "#" + Lorem.HexNumber(6)
        this.WriteObject randomColorString
        base.EndProcessing ()