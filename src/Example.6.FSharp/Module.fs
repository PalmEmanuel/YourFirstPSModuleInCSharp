// use your module name for the namespace
namespace PEURandom

// PowerShell attributes come from this namespace
open System.Management.Automation
open LoremNET
open System

/// Describe cmdlet in /// comments
/// Cmdlet attribute takes verb names as strings or verb enums
/// Output type works the same as for PowerShell cmdlets
[<Cmdlet(VerbsCommon.Get, "PEURandomSentence")>]
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

[<Cmdlet(VerbsCommon.Get, "PEURandomDate")>]
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

[<Cmdlet(VerbsCommon.Get, "PEURandomEmail")>]
[<OutputType(typeof<string>)>]
type GetRandomEmailCommand() =
    inherit PSCmdlet()
    override this.EndProcessing() =
        let email = Lorem.Email()
        this.WriteObject email

[<Cmdlet(VerbsCommunications.Write, "PEURandomColorMessage")>]
[<OutputType(typeof<string>)>]
type GetRandomColorCommand() =
    inherit PSCmdlet()

    [<Parameter(Mandatory = true)>]
    member val Message : string = "" with get, set

    override this.EndProcessing() =
        let randomColor = Lorem.HexNumber 6
        let colorNumber = Int32.Parse(randomColor, Globalization.NumberStyles.HexNumber)
        let ansiColorString = PSStyle.Instance.Foreground.FromRgb colorNumber

        this.WriteObject(ansiColorString + this.Message + PSStyle.Instance.Reset)