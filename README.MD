# Your First PS Module in C#

This is a demo of how to develop a PowerShell Module in C#.

## Customizations

### Custom PowerShell Version

This repository by default uses the latest PowerShell version that matches the .NET SDK in the container. For example, the .NET 7 SDK ships with PowerShell 7.3.1.

If you want to test with a specific PowerShell version, open `devcontainer.json`, uncomment the PowerShell feature, and specify the version you want to test with, however it's generally better to download and install the executable separately and run it standalone in tests.

### Custom .NET SDK

Adjust the `devcontainer.json` and change the image version to the SDK you want to develop with. If you not using a devcontainer, you also need to update the `global.json` to specify a minimum. Note that most of the time you always want to be using the latest available, since newer SDKs can target older versions. For example, if you want to make a module to target PowerShell 7.2 (.NET 6), you can do this with the .NET 7 SDK, you don't need to install the .NET 6 SDK.

## Examples of Great C# Modules

- [Pester/src/csharp](https://github.com/pester/Pester/tree/main/src/csharp): The ubiquitous test and mock framework for PowerShell.
- [JustinGrote/Mortar](https://github.com/JustinGrote/Mortar): A templating engine for PowerShell, leveraging the dotnet templating engine.
- [PalmEmanuel/AzBobbyTables](https://github.com/PalmEmanuel/AzBobbyTables): A lightweight PowerShell module for working with Azure Storage Tables.
- [JustinGrote/PowerConfig](https://github.com/JustinGrote/PowerConfig): Configure your Script or Module with an overlaying config engine. Uses Microsoft.Extensions.Configuration.
- [BicepNet](https://github.com/PSBicep/BicepNet) for [PSBicep](https://github.com/PSBicep/PSBicep): A PowerShell module for the Bicep language, used for deploying Azure resources declaratively.
- [lordmilko/PrtgAPI](https://github.com/lordmilko/PrtgAPI): C#/PowerShell interface for PRTG Network Monitor.
