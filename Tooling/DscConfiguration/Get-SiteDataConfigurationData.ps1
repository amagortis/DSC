function Get-SiteDataConfigurationData
{
    [cmdletbinding()]
    param ($Path)
    if (($script:ConfigurationData.SiteData.Keys.Count -eq 0))
    { 
        Write-Verbose "Processing SiteData from $Path." 
        foreach ( $item in (dir (join-path $Path 'SiteData\*.psd1')) )
        {
            Write-Verbose "Loading data for site $($item.basename) from $($item.fullname)."
            $script:ConfigurationData.SiteData.Add($item.BaseName, (Get-Hashtable $item.FullName))
        }
    }
}
