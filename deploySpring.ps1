param(
    [string]
    $appdirectory,

    [string]
    $resourceGroup,

    [string]
    $webappname
)

# Get publishing profile for the web app
$xml = [Xml](Get-AzureRmWebAppPublishingProfile -Name $webappname `
-ResourceGroupName $resourceGroup `
-OutputFile null)

# Extract connection information from publishing profile
$username = $xml.SelectNodes("//publishProfile[@publishMethod=`"FTP`"]/@userName").value
$password = $xml.SelectNodes("//publishProfile[@publishMethod=`"FTP`"]/@userPWD").value
$url = $xml.SelectNodes("//publishProfile[@publishMethod=`"FTP`"]/@publishUrl").value

# Upload files recursively 
Set-Location $appdirectory
$webclient = New-Object -TypeName System.Net.WebClient
$webclient.Credentials = New-Object System.Net.NetworkCredential($username,$password)
$relativepath = (Resolve-Path -Path $appdirectory -Relative).Replace(".\", "").Replace('\', '/')
$uri = New-Object System.Uri("$url/$relativepath")
"Uploading to " + $uri.AbsoluteUri
$webclient.UploadFile($uri, $file.FullName)
$webclient.Dispose()