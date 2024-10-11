import socket
import time

serverSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
serverAddress = ('localhost', 9876)
serverSocket.bind(serverAddress)

serverSocket.listen(1)
print(f"Server is listening on {serverAddress[0]}:{serverAddress[1]}")

clientSocket, clientAddress = serverSocket.accept()
print(f"Accepted connection from {clientAddress[0]}:{clientAddress[1]}")

username = clientSocket.recv(1024).decode('utf-8')
print(f"Client's username is {username}.")

data = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]

window_size = 5
start = 0
end = window_size
window = data[start:end]

while start < len(data):
    # Send window of packets
    for i in range(start, end):
        if i < len(data):
            print(f"Sending packet: {data[i]}")
            clientSocket.send(data[i].encode('utf-8'))
            time.sleep(0.5)  # Simulate delay in sending

    # Receive acknowledgment from the client
    ack = clientSocket.recv(1024).decode('utf-8')
    print(f"Received acknowledgment: {ack}")

    # If we receive "Corrupt" signal, resend the entire window
    if ack == "Corrupt":
        print("Corruption detected! Resending window...")
    else:
        # Slide the window
        start += window_size
        end += window_size

    # If we've sent all data, break the loop
    if start >= len(data):
        clientSocket.send("End".encode('utf-8'))
        break

# Close the sockets
clientSocket.close()
serverSocket.close()
