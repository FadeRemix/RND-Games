local Plrs = game.Players
local LPlayer = Plrs.LocalPlayer
local LChar = LPlayer.Character
local LHumanoid = LChar.Humanoid

local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/sol"))()


local ABat = false

--[[SolarisLib:New({
  Name - Title of the UI <string>
  FolderToSave - Name of the folder where the UI files will be stored <string>
})]]


local win = Lib:New({
  Name = "Homerun Simulator",
  FolderToSave = "LibStuff"
})

--win:Tab(title <string>)
local tab = win:Tab("Tab 1")

--tab:Section(title <string>)
local sec = tab:Section("Cheats")

--sec:Button(title <string>, callback <function>)
sec:Button("Credits", function()
  Lib:Notification("Script Creator", "Fade#8495")
  Lib:Notification("Library Used", "Solaris")
end)

local BPslider = sec:Slider("Batting Power", 0,100,0,1,"Batting Power", function(Val)
  BPower = Val
end)

--sec:Toggle(title <string>,default <boolean>, flag <string>, callback <function>)
local ABtoggle = sec:Toggle("Toggle", false,"Toggle", function(TogBool)
    ABat = TogBool
end)

--[[
toggle:Set(state <boolean>)
]]


--[[
slider:Set(state <number>)
]]

--sec:Dropdown(title <string>,options <table>,default <string>, flag <string>, callback <function>)
local COdropdown = sec:Dropdown("Select Crate", {"General 1","General 2","Forest","Parking Lot","Desert","Beach - $","Moon - $","Mars - $","Jupiter - $","Premium 1 - $10M","Premium 2 - $50M"},"","Crate Opener", function(CrateOpenr)
  CrateToOpen = CrateOpenr
end)

sec:Button("Buy Crate", function()
game:GetService("ReplicatedStorage").RF.Open_Crate:InvokeServer(CrateToOpen)
end)

local POdropdown = sec:Dropdown("Select Place", {"Forest - $10k","Parking Lot - $50k","Desert - $120k","Beach - $2M","Moon - $10M","Mars - $25M","Jupiter"},"","Buy Place", function(PlaceToBuy)
  print(t)
end)

sec:Button("Buy Place", function()
game:GetService("ReplicatedStorage").RF.Open_Crate:InvokeServer(PlaceToBuy)
end)

--sec:Slider(title <string>,default <number>,max <number>,minimum <number>,increment <number>, flag <string>, callback <function>)
local WSslider = sec:Slider("Walkspeed", 18,100,18,1,"Walkspeed", function(Val)
    LHumanoid.WalkSpeed = Val
end)

--[[
Dropdown:Refresh(options <table>, deletecurrent <boolean>)
Dropdown:Set(option <string>)
]]

--sec:MultiDropdown(title <string>,options <table>,default <table>, flag <string>, callback <function>)
local multidropdown =sec:MultiDropdown("Multi Dropdown", {"a","b","c","d","e"},{"b", "c"},"Dropdown", function(t)
  print(table.concat(t, ", "))
end)

--[[
Dropdown:Refresh(options <table>, deletecurrent <boolean>)
Dropdown:Set(option <table>)
]]

--sec:Colorpicker(title <string>, default <color3>, flag <string>, callback <function>)
sec:Colorpicker("Colorpicker", Color3.fromRGB(255,255,255),"Colorpicker", function(t)
  print(t)
end)

--sec:Textbox(title <string> ,disappear <boolean>, callback <function>)
sec:Textbox("Textbox", true, function(t)
  print(t)
end)

--sec:Bind(title <string>, default <keycode>, hold <boolean>, flag <string>, callback <function>)
sec:Bind("Hold Bind", Enum.KeyCode.E, true, "BindHold", function(t)
  print(t)
end)

sec:Bind("Normal Bind", Enum.KeyCode.F, false, "BindNormal", function()
  print("Bind pressed")
end)

--[[
bind:Set(state <keycode>)
]]

--sec:Label(text <string>)
local label = sec:Label("Label")

--[[
label:Set(text <string>)
]]


local tab2 = win:Tab("Tab 2")

while wait(2) do
  if ABat then
    game:GetService("ReplicatedStorage").RF.Launch_Ball:InvokeServer(BPower)
    print("on")
  end
end