local ssl = require ("tarantoolssl")

local function on_accept (self, from)    
    self:write ("GOOD")
    print (self:read (10))
end

local sock = ssl.tcp_server("localhost", 9090, "61640450_127.0.0.1.cert", "61640450_127.0.0.1.key", on_accept)