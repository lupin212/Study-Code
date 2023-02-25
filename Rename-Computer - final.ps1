<# Script Change Computer Name
#>

$username = "Domain\adminlocal"
$securePwd = "Abcd@12345"
$credObject = New-Object System.Management.Automation.PSCredential -ArgumentList $username, $securePwd
$ComputerName     =       Read-Host -Prompt “Nhap ten Computer cu ten o day”    
$ComputerNameNEW  =       Read-Host -Prompt “Nhap ten Computer moi o day”
$ComputerName     =       $ComputerName -split ‘,’
if ($ComputerName -match “:”)

                      {
                      $Path = $ComputerName
                      $ComputerName = Get-Content $path
          }

                      $Total = $ComputerName.count 
                                foreach ($Computer in $ComputerName )
                                                {
													            Write-Host “Kiem tra ket noi den $Computer…….” -ForegroundColor yellow
                                                                $NetTestPC = Test-NetConnection -ComputerName $Computer -ErrorVariable a
																If ($NetTestPC.PingSucceeded)
                                {
                                Rename-Computer -ComputerName $Computer -NewName $ComputerNameNEW -DomainCredential $credObject -Force -PassThru
                                                                Write-Host “Ket noi thanh cong den $Computer” -ForegroundColor Green
                                                                }
                                                                else
                                                                                {
                                                                                                Write-Host “Loi ket noi den May tinh: $Computer - $a” -ForegroundColor red
                                                                                }

                                                }						
        Write-Host “Total $Total Computer Processed” -ForegroundColor white
Read-Host -Prompt "Press any key to continue"		
Exit		