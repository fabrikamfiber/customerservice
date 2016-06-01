#Installs the specified version of Firefox in the specified language.

Configuration InstallBrowser
{
    param
    (
        
    [Parameter(Mandatory)]
    $VersionNumber,
        
    [Parameter]
    $Language,
        
    [Parameter]
    $OS,
        
    [Parameter(Mandatory)]
    $LocalPath        
        
    )
    
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