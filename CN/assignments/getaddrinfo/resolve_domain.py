import socket

def resolve_domain(domain_name):
    try:
        addresses = socket.getaddrinfo(domain_name, None)

        print(f"IP address(es) for {domain_name}:")
        for result in addresses:
            ip_address = result[4][0]
            print(ip_address)

    except socket.gaierror:
        print(f"Error: Unable to resolve domain name '{domain_name}'.")

if __name__ == "__main__":
    domain_name = input("Enter a domain name: ")
    resolve_domain(domain_name)
