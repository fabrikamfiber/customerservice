#Installs the specified version of Firefox in the specified language.

    param
    (
        
    [Parameter(Mandatory)]
    $VersionNumber,
        
    [Parameter(Mandatory)]
    $Language,
        
    [Parameter]
    $OS,
        
    [Parameter(Mandatory)]
    $LocalPath        
        
    )
    

Configuration InstallBrowser
{
    Import-DscResource -module xFirefox
    Import-DscResource –ModuleName 'PSDesiredStateConfiguration' 
 
    
    MSFT_xFirefox firefox
    {
    VersionNumber = $VersionNumber
    Language = $Language
    OS = $OS
    LocalPath = $LocalPath
    }
}

InstallBrowser