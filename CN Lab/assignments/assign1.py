# Input: Enter subnet mask / (/24-/30)
# Output: subnet mark is (in decimal) :
# Input: enter valid Class C IP address
# Output: no. of subnets :
# Output: no of host per subnet.
# Output: network. id :
# Output: broadcast address:
# Output: usable host address range

import math
subnet_mask = int(input("Enter subnet mask / (/24-/30) : "))

# format AAa.BBb.CCc.DD
subnet_mask_formatted = [0, 0, 0, 0]
for i in range(subnet_mask):
    subnet_mask_formatted[i//8] += 2**(7-i%8)
print(".".join([str(i) for i in subnet_mask_formatted]))
# Enter a valid class C ip address
ip_address = input("Enter valid Class C IP address : ")
ip_address = ip_address.split(".")

# Output: no of host per subnet.
# Output: network. id :
# Output: broadcast address:
# Output: usable host address range

# Number of subnets
subnets = 2**(32-subnet_mask)
print("Number of subnets : ", subnets)
#  Output: no of host per subnet.
hosts = 2**(8-subnet_mask%8)-2
print("Number of hosts per subnet : ", hosts)

# Network ID
network_id = [0, 0, 0, 0]
for i in range(4):
    network_id[i] = int(ip_address[i]) & subnet_mask_formatted[i]
print("Network ID : ", ".".join([str(i) for i in network_id]))

# Broadcast Address
broadcast_address = [0, 0, 0, 0]
for i in range(4):
    broadcast_address[i] = network_id[i] + (255-subnet_mask_formatted[i])
print("Broadcast Address : ", ".".join([str(i) for i in broadcast_address]))

# usable host address range 

possible_host_addresses = [x for i in ]
    
