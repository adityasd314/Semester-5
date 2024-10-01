import socket
import threading
import datetime

clients = []
usernames = {}

def broadcast(message, sender_socket=None):
    for client in clients:
        if client != sender_socket:
            try:
                client.send(message.encode())
            except:
                clients.remove(client)

def handle_client(client_socket):
    try:
        username = client_socket.recv(1024).decode('utf-8')
        usernames[client_socket] = username
        welcome_message = f"{username} has joined the chat!"
        print(welcome_message)
        broadcast(welcome_message)

        while True:
            message = client_socket.recv(1024).decode('utf-8')
            if not message:
                break
            
            current_time = datetime.datetime.now().strftime("%H:%M:%S")
            full_message = f"[{current_time}] {username}: {message}"
            print(full_message)
            broadcast(full_message, client_socket)
    except:
        pass
    finally:
        if client_socket in clients:
            clients.remove(client_socket)
            client_socket.close()
            exit_message = f"{usernames[client_socket]} has left the chat."
            print(exit_message)
            broadcast(exit_message)

def start_server():
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.bind(('localhost', 12345))
    server.listen(5)
    print("Server started and waiting for connections...")

    while True:
        client_socket, addr = server.accept()
        print(f"New connection from {addr}")
        clients.append(client_socket)

        thread = threading.Thread(target=handle_client, args=(client_socket,))
        thread.start()

if __name__ == "__main__":
    start_server()
