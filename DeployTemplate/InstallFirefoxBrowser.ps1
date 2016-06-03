    param
    (
        
    [Parameter(Mandatory)]
    $VersionNumber,
        
    [Parameter(Mandatory)]
    $Language,
        
       
    [Parameter(Mandatory)]
    $LocalPath        
        
    )


Configuration InstallFirefox
{
    
    Import-DscResource -ModuleName 'xPSDesiredStateConfiguration'
    Import-DscResource -ModuleName 'PSDesiredStateConfiguration'

    xRemoteFile Downloader
    {
        Uri = "https://download.mozilla.org/?product=firefox-" + $VersionNumber + "&lang=" + $Language
        DestinationPath = $LocalPath
    }
     
    Package Installer
    {
        Ensure = "Present"
        Path = $LocalPath
        Name = "Mozilla Firefox"
        ProductId = ''
        Arguments = "/SilentMode"
        DependsOn = "[xRemoteFile]Downloader"
    }
}

InstallFirefox
