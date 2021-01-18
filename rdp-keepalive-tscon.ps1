echo "Provide username and password of session to be transferred to tscon:"
$userName = Read-Host "Enter username"
$securePwd = Read-Host "Enter password" -AsSecureString
$plainPwd =[Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($securePwd))
$sessionid=((quser $userName | select -Skip 1) -split '\s+')[2];
tscon $sessionid /password $plainPwd /dest:console
