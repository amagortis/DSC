function Get-AllNodesConfigurationData
{
    [cmdletbinding()]
    param ($Path)
    if (($script:ConfigurationData.AllNodes.Count -eq 0))
    {  
        Write-Verbose "Processing AllNodes from $Path."
        $script:ConfigurationData.AllNodes = @()
        dir (join-path $Path 'AllNodes\*.psd1') | 
            Get-Hashtable | 
            foreach-object { 
                Write-Verbose "Adding Name: $($_.Name)"
                $script:ConfigurationData.AllNodes += $_ 
            }
    }
}
