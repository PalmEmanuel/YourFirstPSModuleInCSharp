namespace PEURandom;
using System.Management.Automation;
using System.Net.Mail;
using LoremNET;

[Cmdlet(VerbsCommon.Get, $"{Consts.ModulePrefix}Email")]
public class GetPEURandomEmailCmdlet : PSCmdlet
{
    [Parameter()]
    public SwitchParameter UsernameOnly;

    protected override void EndProcessing()
    {
        MailAddress email = new(Lorem.Email());
        if (UsernameOnly)
        {
            WriteObject(email.User);
        }
        else
        {
            WriteObject(email.ToString());
        }
    }
}