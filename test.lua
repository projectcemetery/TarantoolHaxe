local crypto = require ('crypto')
local clock = require ('clock')
local time = clock.thread64 ()
local f = crypto.digest.sha512;

local i = 1
for i = 1,1000000 do
  local s = "12"
  if (type (s) == "string") then
    --print ("GOOD")
    i = i + 1
  end
end

--for i = 1,1000000 do
    --local s = f ("12342342")
--end
time = (clock.thread64 () - time) / 1000

print (time)