namespace PEURandom // use your module name for the namespace

open System.Management.Automation // PowerShell attributes come from this namespace
open LoremNET
open System

/// Describe cmdlet in /// comments
/// Cmdlet attribute takes verb names as strings or verb enums
/// Output type works the same as for PowerShell cmdlets
[<Cmdlet("Get", "PEURandomColor")>]
[<OutputType(typeof<string>)>]
type GetRandomColorCommand() =
    inherit PSCmdlet()

    override this.EndProcessing() =
        let randomColorString = "#" + Lorem.HexNumber(6)
        this.WriteObject randomColorString
        base.EndProcessing()

[<Cmdlet("Get", "PEURandomSentence")>]
[<OutputType(typeof<string>)>]
type GetRandomSentenceCommand() =
    inherit PSCmdlet()

    [<Parameter>]
    member val Min : int = 5 with get, set

    [<Parameter>]
    member val Max : int = 10 with get, set

    override this.EndProcessing() =
        let sentence = Lorem.Sentence(this.Min, this.Max)
        this.WriteObject sentence
        base.EndProcessing()

[<Cmdlet("Get", "PEURandomDate")>]
[<OutputType(typeof<string>)>]
type GetRandomDateCommand() =
    inherit PSCmdlet()

    [<Parameter>]
    member val NotBefore : DateTime = DateTime.Parse("1950-01-01") with get, set

    [<Parameter>]
    member val NotAfter : DateTime = DateTime.Parse("2150-12-31") with get, set
    override this.EndProcessing() =
        let date = Lorem.DateTime(this.NotBefore, this.NotAfter)
        this.WriteObject date
        base.EndProcessing()

[<Cmdlet("Get", "PEURandomEmail")>]
[<OutputType(typeof<string>)>]
type GetRandomEmailCommand() =
    inherit PSCmdlet()
    override this.EndProcessing() =
        let email = Lorem.Email()
        this.WriteObject email
        base.EndProcessing()
