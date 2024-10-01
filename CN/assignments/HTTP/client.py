from socket import *

def send_request(path):
    serverName = 'localhost'
    serverPort = 8080
    clientSocket = socket(AF_INET, SOCK_STREAM)
    clientSocket.connect((serverName, serverPort))

    request = f"GET {path} HTTP/1.1\r\nHost: localhost\r\n\r\n"
    clientSocket.send(request.encode())

    response = clientSocket.recv(1024).decode()
    print("Response from server:\n", response)

    clientSocket.close()

def display_menu():
    print("Options:")
    print("1. GET / (Root Path)")
    print("2. GET /info (Info Page)")
    print("3. GET /notfound (Non-existent Path)")
    print("4. GET /exit (Exit the Client)")

while True:
    display_menu()
    choice = input("Enter your choice (1-4): ")

    if choice == '1':
        send_request('/')
    elif choice == '2':
        send_request('/info')
    elif choice == '3':
        send_request('/notfound')
    elif choice == '4':
        print("Exiting client...")
        break
    else:
        print("Invalid choice, please select a valid option.")
