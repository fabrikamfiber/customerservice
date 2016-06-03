    param
    (
        
    [Parameter]
    $VersionNumber,
        
    [Parameter]
    $Language,
        
    [Parameter]
    $OS,
        
    [Parameter(Mandatory)]
    $LocalPath        
        
    )
  


  Configuration InstallBrowser
{
  Import-DscResource -ModuleName xChrome
  Import-DscResource –ModuleName 'PSDesiredStateConfiguration' 

      MSFT_xChrome chrome
    {
    Language = $Language
    LocalPath = $LocalPath
    }
    }
    InstallBrowser
