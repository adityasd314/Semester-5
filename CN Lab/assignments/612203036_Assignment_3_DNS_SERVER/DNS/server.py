from socket import *

serverPort = 5354
serverSocket = socket(AF_INET, SOCK_DGRAM)
serverSocket.bind(('', serverPort))
print("DNS Server running on port", serverPort)

dns_records = {
    'example.com': '93.184.216.34',
    'localhost': '127.0.0.1',
    'google.com': '142.250.190.78',
    'github.com': '140.82.121.3'
}

while True:
    message, clientAddress = serverSocket.recvfrom(2048)
    domain_name = message.decode()
    print(f"Received DNS query for: {domain_name}")
    
    ip_address = dns_records.get(domain_name, '0.0.0.0') 
    
    serverSocket.sendto(ip_address.encode(), clientAddress)
