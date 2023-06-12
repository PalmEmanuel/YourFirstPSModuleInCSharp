using System.Management.Automation;
using LoremNET;
using System.Net.Mail;

namespace Lab1.RandomEmail;

[Cmdlet(VerbsCommon.Get, "PEURandomEmail")]
public class RandomEmailCommand : PSCmdlet
{
    [Parameter()]
    public SwitchParameter UsernameOnly { get; set; }

    protected override void EndProcessing() {
        var email = new MailAddress(Lorem.Email());

        WriteObject(UsernameOnly.IsPresent ? email.User : email);
    }
}
