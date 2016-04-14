# Login to Azure
#Login-AzureRmAccount

# Get the resource group
$ResourceGroup = Get-AzureRmResourceGroup -ResourceGroupName "TheCloudGuy"

# Create the VNet
New-AzureRmVirtualNetwork -ResourceGroupName $($ResourceGroup.ResourceGroupName) -Name VN-TheCloudGuy -Location $($ResourceGroup.Location) -AddressPrefix 172.16.0.0/20

# Retrieve the VNet
$VNet = Get-AzureRmVirtualNetwork -ResourceGroupName $($ResourceGroup.ResourceGroupName) -Name VN-TheCloudGuy

# Add subnets
Add-AzureRmVirtualNetworkSubnetConfig -Name GatewaySubnet -VirtualNetwork $VNet -AddressPrefix 172.16.1.0/26
Add-AzureRmVirtualNetworkSubnetConfig -Name VirtualMachines -VirtualNetwork $VNet -AddressPrefix 172.16.2.0/24

# Save the configuration
Set-AzureRmVirtualNetwork -VirtualNetwork $VNet