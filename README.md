# Export-DHCP-Leases

This repository contains a PowerShell script to export all DHCP leases from a DHCP server into a CSV file. The script is designed to work seamlessly with Windows DHCP servers and outputs the data in a structured format for further analysis or reporting.

Features:
Exports DHCP Lease Information: Retrieves all current leases from the DHCP server.
Customizable Output: Saves the data to a CSV file with the following fields:
- ScopeId
- IPAddress
- HostName
- ClientID
- AddressState
Delimiter Customization: Default delimiter is ;, but this can be changed as needed.
Easy-to-Use: Requires minimal setup and runs directly in PowerShell.

Requirements:
Operating System: Windows Server with DHCP Server role installed.
Permissions: Run the script with administrator privileges.
PowerShell Module: The DHCPServer module must be installed (included in RSAT: DHCP tools).

Usage:
Clone or download this repository to your Windows Server.
Open PowerShell as Administrator.
Run the script:
.\Export-DHCPLeases.ps1
The exported CSV file will be saved to the path defined in the $outputFile variable (default: C:\Path\To\Save\DHCP_Leases.csv).

Output Example:
The resulting CSV file will look like this:
ScopeId;IPAddress;HostName;ClientID;AddressState
192.168.1.0;192.168.1.101;Device1;XX-XX-XX-XX-XX-XX;Active

Customization:
Output File Path: Modify the $outputFile variable to specify your desired CSV file location.
Delimiter: Change the $delimiter variable in the script to use a different delimiter (e.g., , or |).
Filter Leases: Add PowerShell filtering to include/exclude specific leases based on criteria.

Troubleshooting:
Missing DHCPServer Module: Ensure the DHCP Server tools are installed. Install via PowerShell:
Install-WindowsFeature -Name RSAT-DHCP

This script simplifies the process of exporting DHCP lease information, making it easier to analyze network data or integrate it into external systems.