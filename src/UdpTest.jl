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
