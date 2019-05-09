# Codice
## Python
```Python
import sys
import socket
import click

VERSION = "0.1.1"

def show_info(message, remote, prefix):
    if not sys.version.startswith("2"):
        message = message.decode("utf-8")
    info = "{prefix} {remote_ip} : {remote_port} ==> {message}".format(
        prefix=prefix,
        remote_ip=remote[0],
        remote_port=remote[1],
        message=message,
        )
    click.echo(info)


@click.group()
def test():
    pass


@test.command()
@click.option("-p", "--port", type=int, default=5005)
def server(port):
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.bind(('0.0.0.0', port))
    while True:
        message, remote = sock.recvfrom(1024*64)
        show_info(message, remote, "Get a message from")
        sock.sendto(message, remote)


@test.command()
@click.option("-h", "--host", default="127.0.0.1")
@click.option("-p", "--port", type=int, default=5005)
@click.option("-l", "--local-port", type=int, default=0)
def client(host, port, local_port):
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    if local_port:
        sock.bind(('0.0.0.0', local_port))
    while True:
        line = input("Send message: ")
        sock.sendto(line.encode("utf-8"), (host, port))
        message, remote = sock.recvfrom(1024*64)
        show_info(message, remote, "Received reply from")



if __name__ == "__main__":
    test()

```
## Julia

```Julia
#######################################
# UdpTest module name
#######################################
module UdpTest
    using Sockets
    import Base.show

    export server, client, show_info

    function __init__()
        inizia()
    end

    function inizia()
        println("Init")
        global sock = UDPSocket()
        global port=5005
        for a in ARGS
            b=split(a)
            if occursin("-p",a) || occursin("--port",a)
                try
                    port=split(a)[2]
                catch
                    println("Using defalut port $port")
                end
            end

        end
    end

    function show_info(message, remote, prefix)
        try
            prefix=prefix
            remote_ip=remote
            remote_port="-"#remote[2]
            message=message
            info = "$prefix $remote_ip : $remote_port ==> $message"
            println(info)
            return 0
        catch e
            println(e)
            return 1
        end
    end
"""
function server(port::Int)
    start to listen on port and reply any Received message
"""
    function server(port)
        try
            bind(sock , IPv4(0), port)
        @async while true
                    remote, message = recvfrom(sock)
                    println("messaggio ricevuto $remote")
                    show_info(message, remote, "Get a message from")
                    send(sock,remote,port,message)
                end
        catch e
            println(e)
            return 1
        end
    end

"""
    function client(host::String, port::Int)
    require a message to send to the HOST on the PORT.
        Eventually show the received replay.
"""
    function client(host, port)
        try
            bind(sock, ip"0.0.0.0", port)
            host_ip = getaddrinfo(host)
            while true
                print("Send Message: ")
                line = readline()
                send(sock,host_ip,port,line)
                remote, line = recvfrom(sock)
                show_info(line, host_ip, "Received reply from")
            end
        catch e
            println(e)
            return 1
        end
    end

end # module

```
