from socket import *

def query_dns(domain_name):
    serverName = 'localhost'
    serverPort = 5354
    clientSocket = socket(AF_INET, SOCK_DGRAM)

    clientSocket.sendto(domain_name.encode(), (serverName, serverPort))

    ip_address, serverAddress = clientSocket.recvfrom(2048)
    print(f"The IP address for {domain_name} is {ip_address.decode()}")

    clientSocket.close()

def display_menu():
    print("\nOptions:")
    print("1. Query 'example.com'")
    print("2. Query 'localhost'")
    print("3. Query 'google.com'")
    print("4. Query 'github.com'")
    print("5. Query a custom domain")
    print("6. Exit the client")

while True:
    display_menu()
    choice = input("Enter your choice (1-6): ")

    if choice == '1':
        query_dns('example.com')
    elif choice == '2':
        query_dns('localhost')
    elif choice == '3':
        query_dns('google.com')
    elif choice == '4':
        query_dns('github.com')
    elif choice == '5':
        domain_name = input("Enter the domain name to query: ")
        query_dns(domain_name)
    elif choice == '6':
        print("Exiting client...")
        break
    else:
        print("Invalid choice, please select a valid option.")
