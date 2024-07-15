shell = require("shell")
component = require("component")
m = component.modem
event = require("event")
args, ops = shell.parse(...)
m.open(2)
m.open(1)

m.broadcast(1,"nanomachines", "setResponsePort", 2)
event.pull("modem_message")
m.broadcast(1,"nanomachines", "getTotalInputCount")
_, _, _, _, _, _, _, inputs = event.pull("modem_message")
print(inputs)
if ops == nil then
for i = 1, inputs do
m.broadcast(1,"nanomachines", "setInput", i, true)
os.sleep(1)
m.broadcast(1,"nanomachines", "getActiveEffects")
_, _, _, _, _, _, _, result = event.pull("modem_message")
print(i, result)
m.broadcast(1,"nanomachines", "setInput", i, false)
event.pull("modem_message")
end

else
if #ops < 5 then

if #ops > 2 then
print("Warning: This will cause damage due to amount of options.\nContinue?")
input = io.read()
if input == "" then
return
end
end
for i in ops do
m.broadcast(1, "nanomachines", "setInput", i, true)
end
print("Done.")
else
print("Too many options.")
end
end