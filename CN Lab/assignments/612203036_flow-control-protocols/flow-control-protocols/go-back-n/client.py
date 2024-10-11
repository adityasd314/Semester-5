import socket

# Client configuration
clientSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
serverAddress = ('localhost', 9876)
clientSocket.connect(serverAddress)

# Send username to the server
username = "ClientUser"
clientSocket.send(username.encode('utf-8'))

received_data = []
corrupt_packet = "C"  # We'll simulate corruption at packet "C"

while True:
    # Receive data from the server
    serverData = clientSocket.recv(1024).decode('utf-8')

    # If no more data, end the process
    if serverData == "End":
        print("All data received. Closing connection.")
        break

    print(f"Received from server: {serverData}")

    # Simulate corruption for packet "C"
    if serverData == corrupt_packet:
        print("Simulating corruption!")
        clientSocket.send("Corrupt".encode('utf-8'))
        continue

    # Store received data and send acknowledgment
    received_data.append(serverData)
    clientSocket.send(f"ACK: {serverData}".encode('utf-8'))

# Close the socket
clientSocket.close()
