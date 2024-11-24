 # Define output CSV file path
 $outputFile = "C:\PATH\DHCP_Leases.csv"

 # Define the CSV delimiter (change as needed)
 $delimiter = ";"
 
 # Ensure the DHCPServer module is available
 if (!(Get-Module -Name DHCPServer -ListAvailable)) {
     Write-Error "The DHCPServer module is not installed. Please install the RSAT: DHCP tools."
     exit
 }
 
 # Import the DHCPServer module
 Import-Module DHCPServer
 
 # Get all DHCP scopes
 $scopes = Get-DhcpServerv4Scope
 
 # Initialize an array to store lease data
 $leasesData = @()
 
 # Iterate through each scope and get the leases
 foreach ($scope in $scopes) {
     $scopeId = $scope.ScopeId
     $leases = Get-DhcpServerv4Lease -ScopeId $scopeId
 
     foreach ($lease in $leases) {
         # Collect the lease information in a custom object
         $leaseInfo = [PSCustomObject]@{
             ScopeId      = $scopeId
             IPAddress    = $lease.IPAddress
             HostName     = $lease.HostName
             ClientID     = $lease.ClientId
             AddressState = $lease.AddressState
         }
         # Add the object to the data array
         $leasesData += $leaseInfo
     }
 }
 
 # Export the data to a CSV file
 $leasesData | Export-Csv -Path $outputFile -Delimiter $delimiter -NoTypeInformation
 
 Write-Output "DHCP leases exported to $outputFile"
  
 