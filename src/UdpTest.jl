module UdpTest
"""
module UdpTest
    Simple Porting from Python Udp-Test Module
"""
using Sockets

import Base.show

export show_info, server, client, runn, inizia, sock



function __init__()
    inizia()
end

function inizia()
    println("Init")
    global sock = UDPSocket()

end

function show_info(message, remote, prefix)
    println("remote = $remote")
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
    start to listen on port and reply any arrived message
end
"""
function server(port)
    bind(sock , IPv4(0), port)
@async while true
            remote, message = recvfrom(sock)
            println("messaggio ricevuto $remote")
            show_info(message, remote, "Get a message from")
            send(sock,remote,port,message)
        end
end

"""
    function client(host::String, port::Int)
    Ask for a message to send to the host on the port.
        show the received replay
"""
function client(host, port)
    bind(sock, ip"0.0.0.0", port)
    host_ip = getaddrinfo(host)
    while true
        print("Send Message: ")
        line = readline()
        send(sock,host_ip,port,line)
        remote, line = recvfrom(sock)
        show_info(line, host_ip, "Received reply from")
    end
end


function runn()
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
    println("porta $port")
    return "porta $port"
end

end # module
