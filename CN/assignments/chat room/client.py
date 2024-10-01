import socket
import threading
import sys

def receive_messages(client_socket):
    while True:
        try:
            message = client_socket.recv(1024).decode('utf-8')
            if not message:
                break
            print(message)
        except:
            print("Error receiving message.")
            client_socket.close()
            break

def send_messages(client_socket):
    while True:
        try:
            message = input()
            if message.lower() == 'exit':
                print("Exiting chat...")
                client_socket.close()
                break
            client_socket.send(message.encode('utf-8'))
        except:
            break

if __name__ == "__main__":
    server_host = 'localhost'
    server_port = 12345

    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client_socket.connect((server_host, server_port))

    username = input("Enter your username: ")
    client_socket.send(username.encode('utf-8'))

    thread_recv = threading.Thread(target=receive_messages, args=(client_socket,))
    thread_recv.start()

    thread_send = threading.Thread(target=send_messages, args=(client_socket,))
    thread_send.start()
