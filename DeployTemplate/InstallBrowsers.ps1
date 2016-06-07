    param
    (
        
    [Parameter(Mandatory)]
    $FirefoxVersionNumber,
        
    [Parameter(Mandatory)]
    $FirefoxLanguage,
	
    [Parameter(Mandatory)]
    $FirefoxOS,	

    [Parameter(Mandatory)]
    $LocalPathFirefox,        

    [Parameter(Mandatory)]
    $MachineOS,     
	
    [Parameter(Mandatory)]
    $ChromeLanguage,
	
    [Parameter(Mandatory)]
    $LocalPathChrome        
    )


Configuration InstallBrowsers
{
   
    Import-DscResource -ModuleName 'xPSDesiredStateConfiguration'
    Import-DscResource -ModuleName 'PSDesiredStateConfiguration'

    xRemoteFile DownloaderFirefox
    {
        Uri = "https://download.mozilla.org/?product=firefox-" + $FirefoxVersionNumber + "&os=" + $FirefoxOS + "&lang=" + $FirefoxLanguage
        DestinationPath = $LocalPathFirefox
    }
     
    Package InstallerFirefox
    {
        Ensure = "Present"
        Path = $LocalPathFirefox
        Name = "Mozilla Firefox " + $FirefoxVersionNumber + " (" + $MachineOS + " " + $FirefoxLanguage +")"
        ProductId = ''
        Arguments = "-ms"
        DependsOn = "[xRemoteFile]DownloaderFirefox"
    }
	
	Script ConfigureFirefox
    {
        GetScript = {
            @{
                Result = "FirefoxConfigured"
            }
        }
        TestScript = {
            $True
        }
        SetScript ={
            Invoke-Item -Path $LocalPathFirefox\install.cmd
       
        }
    }	
	xRemoteFile DownloaderChrome
    {
        Uri = "https://dl.google.com/tag/s/appguid={8A69D345-D564-463C-AFF1-A69D9E530F96}&iid={00000000-0000-0000-0000-000000000000}&lang=" + $ChromeLanguage + "&browser=3&usagestats=0&appname=Google%2520Chrome&needsadmin=prefers/edgedl/chrome/install/GoogleChromeStandaloneEnterprise.msi" 
        DestinationPath = $LocalPathChrome
    }
     
    Package InstallerChrome
    {
        Ensure = "Present"
        Path = $LocalPathChrome
        Name = "Google Chrome"
        ProductId = ''
        DependsOn = "[xRemoteFile]DownloaderChrome"
    }
		
	Script Reboot
    {
        GetScript = {
            @{
                Result = "Reboot"
            }
        }
        TestScript = {
            $True
        }
        SetScript ={
            Restart-Computer -Force
       
        }
    }
	
}

InstallBrowsers
