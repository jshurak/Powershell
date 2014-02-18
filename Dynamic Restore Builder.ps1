get-content 'C:\Users\jshurak\Documents\Clients\AMFC\dr\SQL Server Server List.txt' | % {
    Write-Output $_
}
