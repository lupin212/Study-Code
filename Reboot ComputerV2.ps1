<# Script reboot computer By Sulh
Su dung reboot Computer tu xa
Reboot nhieu may: PC1,PC2, ...
#>

$username = "domain\adminlocal"
$securePwd = "Abcd@1234"
$credObject = New-Object System.Management.Automation.PSCredential -ArgumentList $username, $securePwd   
$ComputerName = Read-Host -Prompt “Nhap ten may tinh can khoi dong lai tai day; vi du PC1,PC2,PC3   ”
$Name = $ComputerName -split ","
$Total = $Name.count 
        foreach ($Computer in $Name )
                        {            
							Write-Host “Kiem tra ket noi den $Computer…….” -ForegroundColor yellow
                            if (Test-Connection -ComputerName $Computer -Count 1 -Quiet)
                                {
                                Restart-Computer -ComputerName $Computer -Credential $credObject -Force
                                }
                            else
                                {
                                    Write-Host “Loi ket noi den May tinh: $Computer” -ForegroundColor red
                                }
                        }

Write-Host “Tong $Total PC trong qua trinh Reboot” -ForegroundColor white
Read-Host -Prompt "Press any key to continue"		
Exit
