from socket import *
import time

def handle_request(request):
    try:
        lines = request.split('\r\n')
        method, path, _ = lines[0].split(' ')

        if method == 'GET':
            if path == '/':
                content = "Hello, this server was created by Aditya Deshmukh [612203036]"
                status = '200 OK'
            elif path == '/info':
                content = "This is the info page."
                status = '200 OK'
            else:
                content = "404 Not Found"
                status = '404 Not Found'

            response = f"HTTP/1.1 {status}\r\n"
            response += f"Content-Length: {len(content)}\r\n"
            response += f"Content-Type: text/plain\r\n"
            response += f"Date: {time.strftime('%a, %d %b %Y %H:%M:%S GMT', time.gmtime())}\r\n"
            response += f"\r\n{content}"

        else:
            response = "HTTP/1.1 405 Method Not Allowed\r\n\r\nMethod Not Allowed"
        
        return response

    except Exception as e:
        return f"HTTP/1.1 500 Internal Server Error\r\n\r\nInternal Server Error: {str(e)}"

serverPort = 8080
serverSocket = socket(AF_INET, SOCK_STREAM)
serverSocket.bind(('', serverPort))
serverSocket.listen(1)

print("HTTP server running on port", serverPort)

while True:
    connectionSocket, addr = serverSocket.accept()
    request = connectionSocket.recv(1024).decode()
    print("Request received:\n", request)

    response = handle_request(request)
    connectionSocket.send(response.encode())
    connectionSocket.close()
