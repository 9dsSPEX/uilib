
LOGIN:
local username = ""
local password = ""
local lib = loadstring(game:HttpGet("https://pastebin.com/raw/XPawsNn4",true))()
local main = lib:window("login")
main:textbox("Username", function(text)
    username = text
end)
main:textbox("Password", function(text)
    password = text
end)
main:button("login", function()
    print("Username - "..username.."\nPassword - "..password)
end)

BUTTON EXAMPLE:
local lib = loadstring(game:HttpGet("https://pastebin.com/raw/XPawsNn4",true))()
local main = lib:window("button")
main:button("name", function()
    print("hi!")
end)

TEXTBOX EXAMPLE:
local lib = loadstring(game:HttpGet("https://pastebin.com/raw/XPawsNn4",true))()
local main = lib:window("button")
main:textbox("name", function(text)
    print(text)
end)

CHECKBOX EXAMPLE:
local lib = loadstring(game:HttpGet("https://pastebin.com/raw/XPawsNn4",true))()
local main = lib:window("button")
main:checkbox("name", function(chc)
  if(chc == true)
  print("lol")
  
else
print("aw")
end
end)

LABEL:
local lib = loadstring(game:HttpGet("https://pastebin.com/raw/XPawsNn4",true))()
local main = lib:window("button")
main:label("name")

SLIDER:
local lib = loadstring(game:HttpGet("https://pastebin.com/raw/XPawsNn4",true))()
local slider = lib:slider("title", min,max,location,function(e) print(e) end)
local slider = lib:slider("print value", 0,100,0,function(e) print(e) end) --will start at 0

]]--
