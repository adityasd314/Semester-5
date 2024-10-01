import sys
import socket

def resolve_hostname(hostname):
    try:
        ip_address = socket.gethostbyname(hostname)
        print(f"The IP address of {hostname} is {ip_address}")
    except socket.gaierror:
        print(f"Error: Unable to resolve hostname '{hostname}'.")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python resolve_dns.py <hostname>")
    else:
        hostname = sys.argv[1]
        resolve_hostname(hostname)
