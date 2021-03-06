function Get-CredentialConfigurationData
{
    [cmdletbinding()]
    param ($Path)
    if (($script:ConfigurationData.Credentials.Keys.Count -eq 0) )
    { 
        Write-Verbose "Processing Credentials from $Path."
        foreach ( $item in (dir (join-path $Path 'Credentials\*.psd1.encrypted')) )
        {
            $script:ConfigurationData.Credentials = dir (join-path $Path 'Credentials\*.psd1.encrypted') | 
                Get-EncryptedPassword -StoreName {$_.Name -replace '\.encrypted' -replace '\.psd1'} |
                ConvertTo-CredentialLookup
        }
    }
}
