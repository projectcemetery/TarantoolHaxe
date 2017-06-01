package.path = package.path .. ";./src/platform/net/SecureSocket.lua"

local ssl = require ("SecureSocket")

local function on_accept (self, sock, from)
    print ("GOOD")
    --self:write ("GOOD")
    print (self:read (10))
end


local sock = ssl.tcp_server("localhost", 9090, "61640450_127.0.0.1.cert", "61640450_127.0.0.1.key", on_accept)