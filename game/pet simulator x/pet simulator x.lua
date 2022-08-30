getgenv().UwU = loadstring(game:HttpGet "https://raw.githubusercontent.com/aloneanqel1453/test/main/Lib/PJMeow/Notifycation")()
-- https://raw.githubusercontent.com/aloneanqel1453/test/main/Lib/BracketV3.lua
local SettingsTable = {
    FarmNearest = nil;
    FarmRandom = nil;
    MultiTarget = false;
    GemFarm = nil;
    AreaFarm = nil;
    FarmSelectedCoin = nil;
    keybind = "LeftAlt";
    -----------------------------------------
    FastColect = false;
    LootBag = false;
    RankRew = false;
    FreeGift = false;
    Bankcollect = false;
    StastTracker = false;
    AutoBestPet = false;
    autodametrip = false;
    autocointrip = false;
    -------pets-------
    amountg = 6;
    amoundm = 6;
    autogold = false;
    autorainbow = false;
    enablegold_rainbow = false;
    darkmatterclaim = false;
    autodarkmatter = false;
    listdm = {};
    -------Eggs-------
    RemEggAnimation = false;

    gamepass = false;
    StartModLeave = false;
    openegg = {};
    autoegg = false;
    autoeggtrip = false;
    autoopenbag = false;
    timeopenbag = 2;
    autoluck = false;
    autoultraluck = false;
    -----web hook ----
    wpstart = false;
    wpurlp = nil;
    wpuid = nil;
    wlist = { "Exclusive" };

    -----key bind ----
    KBbank = "K";
    KBgolden = "J";
    KBrainbow = "n";
    KBfuse = "Four";
    KBdm = "Five";
    KBmerchant = "Six";
    KBtele = "Seven";
}


game:GetService("Players").LocalPlayer.Idled:connect(
    function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)

-- \ Anti AFK
local playername = game.Players.LocalPlayer.Name
local Project_daerty = "daerty/"
local configdir = Project_daerty .. "config/"
local ConfigsStorage = configdir .. "PetSimulatorX/"
local ConfigName = ConfigsStorage .. playername .. ".cfg"
local Configdefault =  ConfigsStorage .. "Default.cfg"
local HttpService = game:GetService("HttpService")


function savesettings()
    local JSON;
    if (writefile) then
        JSON = HttpService:JSONEncode(SettingsTable)
        writefile(ConfigName, JSON)
       -- getgenv().UwU:Notify("System", "Sucessfully Saved Settings!")
    else
        -- getgenv().UwU:Notify("System", "Exploit Not Supported")
        print("Exploit Not Supported")
    end
end

--  loadsettings()
--  savesettings()



function loadsettings()
    local JSON;
    if isfile(ConfigName) then
        if (readfile) then
            SettingsTable = HttpService:JSONDecode(readfile(ConfigName, SettingsTable))
            --getgenv().UwU:Notify("System", playername)
        else

            -- getgenv().UwU:Notify("System", "Exploit Not Supported")
            print("Exploit Not Supported")
        end
    else
        savesettings()
    end
end
function addfolder()
    if isfolder(Project_daerty) then

    else
        makefolder(Project_daerty)
    end
    if isfolder(configdir) then

    else
        makefolder(configdir)
    end
    if isfolder(ConfigsStorage) then

    else
        makefolder(ConfigsStorage)
    end
    if isfile(Configdefault) then
        SettingsTable = HttpService:JSONDecode(readfile(Configdefault, SettingsTable))
        
        savesettings()
        getgenv().UwU:Notify("System", "Load default")
    end
end

addfolder()
loadsettings()



if SettingsTable.gamepass == true then
    local pass = require(game:GetService("ReplicatedStorage").Framework.Client["5 | Gamepasses"])

    pass.Owns = function() return true end
end

function gamepass()

    local pass = require(game:GetService("ReplicatedStorage").Framework.Client["5 | Gamepasses"])

    pass.Owns = function() return true end

end

function lamtron(number)
    local array = { "K", "M", "B", "T", "Q" }
    local indexarray = 0
    local renumber

    while number > 999 do
        indexarray = indexarray + 1
        number = number / 1000
    end
    renumber = tostring(string.format("%.2f", number)) .. array[indexarray]
    return renumber
end

---------------------------------------------------GUI---------------------------------
local UIlib = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/aloneanqel1453/test/main/Lib/PJMeow/ui"))()
local FarmingSpeed = 1


spawn(function()
    while wait(10) do
        savesettings()
    end
end)

local Win = UIlib:Window("Mèo Ba Tư", "Pet Simulator X", Enum.KeyCode[SettingsTable.keybind])
-- uitoggled= true
-- print(Win.uitoggled)
local Autofarm = Win:Tab("AutoFarm")
local OldFarm = Win:Tab("Only Farm")
local Misc = Win:Tab("Misc")
local Eggs = Win:Tab("Eggs")
local pets2 = Win:Tab("Pets")
local Visuals = Win:Tab("Visuals")
local WebHook = Win:Tab("WebHook")
local Credits = Win:Tab("Credits")



local check = checklists
local lib = require(game:GetService("ReplicatedStorage"):WaitForChild("Framework"):WaitForChild("Library"))
local Library = require(game:GetService("ReplicatedStorage"):WaitForChild("Framework"):WaitForChild("Library"))
local GameLibrary = require(game:GetService("ReplicatedStorage"):WaitForChild("Framework"):WaitForChild("Library"))

-- spawn(function()
--     pcall(function()
--         getgenv().UwU:Notify("Welcome!", "Script Is setting up!")
--     end)
-- end)
-- Misc:Bind('test',Enum.KeyCode.RightControl,function (v)
--     print(v)

-- end)
local FP = Misc:Label("")
spawn(function()
    while game:GetService("RunService").RenderStepped:wait() do
        FP:Refresh("FPS : " .. tostring(game:GetService("Stats").Workspace.FPS:GetValueString()))
    end
end)
local Time = Misc:Label("")
spawn(function()
    while task.wait() do
        local Data = os.date("*t")
        Time:Refresh("IRL Time : " .. Data.hour .. ":" .. Data.min .. ":" .. Data.sec)
    end
end)

Misc:Slider("Walk Speed", 0, 250, 28, function(v)

    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v

end)

Misc:Slider("Jump Power", 0, 250, 50, function(v)

    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v

end)

Misc:Slider("Gravity", 0, 250, 196.2, function(v)
    game.workspace.Gravity = v
end)

Misc:Toggle("Auto Equip Best Pets", SettingsTable.AutoBestPet, function(t)
    SettingsTable.AutoBestPet = t


end)

spawn(function()
    while wait() do
        if SettingsTable.AutoBestPet then
            pcall(function()
                local args = {
                    [1] = {}
                }
                workspace.__THINGS.__REMOTES:FindFirstChild("equip best pets"):InvokeServer(unpack(args))
            end)
        end
    end

end)

Misc:Button("Get Gamepasses", function()
    SettingsTable.gamepass = not SettingsTable.gamepass

    gamepass()
end)


Misc:Toggle("Auto Leave if Mod Joins", SettingsTable.StartModLeave, function(t)
    SettingsTable.StartModLeave = t

end)

spawn(function()
    while wait() do
        if SettingsTable.StartModLeave then
            game.Players.PlayerAdded:Connect(function(newPlayer)
                if newPlayer:IsInGroup(5060810) and StartModLeave then
                    game.Players.LocalPlayer:Kick("\n Big Games Staff Joined \n Auto Leave!")
                end
            end)
        end
    end
end)

Misc:Toggle("Stats Tracker", SettingsTable.StastTracker, function(t)
    SettingsTable.StastTracker = t

    if SettingsTable.StastTracker then
        local lib = require(game:GetService("ReplicatedStorage").Framework.Library)
        local Save = lib.Save.Get
        local Commas = lib.Functions.Commas
        local Types = {}
        local Menus = game:GetService("Players").LocalPlayer.PlayerGui.Main.Right

        for i, v in pairs(Menus:GetChildren()) do
            if v.ClassName == "Frame" and v.Name ~= "Rank" and not string.find(v.Name, "2") then
                table.insert(Types, v.Name)
            end
        end

        function get(thistype)
            if game.PlaceId == 10321372166 and string.find(string.lower(thistype), "coins") then
                return Save().HardcoreCurrency[thistype]
            else
                return Save()[thistype]
            end
        end

        local LayoutOrders = {
            ["Diamonds"] = 999910;
            ["Halloween Candy"] = 999920;
            ["Gingerbread"] = 999930;
            ["Rainbow Coins"] = 999940;
            ["Tech Coins"] = 999950;
            ["Fantasy Coins"] = 999960;
            ["Coins"] = 999970;
        }
        getgenv().MyTypes = {}
        for i, v in pairs(Menus:GetChildren()) do
            if string.find(v.Name, "2") then
                v:Destroy()
            end
        end

        for i, v in pairs(Types) do
            if not Menus:FindFirstChild(v .. "2") then
                Menus:WaitForChild(v).LayoutOrder = LayoutOrders[v]
                local tempmark = Menus:WaitForChild(v):Clone()
                tempmark.Name = tostring(tempmark.Name .. "2")
                tempmark.Size = UDim2.new(0, 170, 0, 30)
                tempmark.Parent = Menus
                tempmark.LayoutOrder = tempmark.LayoutOrder + 1
                tempmark.BackgroundColor3 = Color3.fromRGB(210, 210, 210)
                getgenv().MyTypes[v] = tempmark
            end
        end

        spawn(function() Menus:WaitForChild("Diamonds2").Add.Visible = false end)
        for i, v in pairs(Types) do
            spawn(function()
                repeat task.wait() until getgenv().MyTypes[v]
                local megatable = {}
                local imaginaryi = 1
                local ptime = 0
                local last = tick()
                local now = last
                local TICK_TIME = 0.5
                while true do
                    if ptime >= TICK_TIME then
                        while ptime >= TICK_TIME do ptime = ptime - TICK_TIME end
                        local currentbal = get(v)
                        megatable[imaginaryi] = currentbal
                        local diffy = currentbal - (megatable[imaginaryi - 120] or megatable[1])
                        imaginaryi = imaginaryi + 1
                        getgenv().MyTypes[v].Amount.Text = tostring(Commas(diffy) .. " in 60s")
                        getgenv().MyTypes[v].Amount_odometerGUIFX.Text = tostring(Commas(diffy) .. " in 60s")
                    end
                    task.wait()
                    now = tick()
                    ptime = ptime + (now - last)
                    last = now
                end
            end)
        end
    else
        local Menus = game:GetService("Players").LocalPlayer.PlayerGui.Main.Right
        for i, v in pairs(Menus:GetChildren()) do
            if string.find(v.Name, "2") then
                v:Destroy()
            end
        end
    end
end)

--  Misc:Button("Unlock Hoverboards", function()
--   spawn(function()
--       local tabel = require(game.ReplicatedStorage.Framework.Modules.Client["4 | Save"]).Get()
--       tabel.Hoverboards = {}
--       for i,v in pairs(game.ReplicatedStorage.Game.Hoverboards:GetChildren())do
--           table.insert(tabel.Hoverboards, v.Name)
--       end
--       getsenv(game.Players.LocalPlayer.PlayerScripts.Scripts.GUIs.Hoverboards).Update()
--       getsenv(game.Players.LocalPlayer.PlayerScripts.Scripts.GUIs.Hoverboards).Equip = function(board)
--           tabel.EquippedHoverboard = board
--           getsenv(game.Players.LocalPlayer.PlayerScripts.Scripts.GUIs.Hoverboards).Update()
--       end
--   end)
--   end)

Misc:line()
Misc:Button("Teleport to Trading Plaza", function()
    if game.PlaceId ~= 7722306047 then
        game:GetService("TeleportService"):Teleport(7722306047, game.Players.LocalPlayer)
    else
        spawn(function()
            pcall(function()
                getgenv().UwU:Notify("Notice!", "You are already in trading plaza!")
            end)
        end)
    end
end)

Misc:Button("Teleport to Pet Sim World", function()
    if game.PlaceId ~= 6284583030 then
        game:GetService("TeleportService"):Teleport(6284583030, game.Players.LocalPlayer)
    else
        getgenv().UwU:Notify("Notice!", "You are already in Pet Sim World!")
    end
end)

Misc:Button("Teleport to Pet Sim Hardcore", function()
    if game.PlaceId ~= 10321372166 then
        game:GetService("TeleportService"):Teleport(10321372166, game.Players.LocalPlayer)
    else
        getgenv().UwU:Notify("Notice!", "You are already in Pet Sim World!")
    end
end)

Misc:line()

local GTime = Misc:Label("Gift Time: ")
spawn(function()
    while task.wait() do
        GTime:Refresh("Gift Time: " .. game:GetService("Players").LocalPlayer.PlayerGui.FreeGiftsTop.Button.Timer.Text)
    end
end)

Misc:Toggle("Auto Collect Gifts", SettingsTable.FreeGift, function(t)
    SettingsTable.FreeGift = t


end)
spawn(function()
    local igift = 1
    while task.wait(.5) do
        pcall(function()
            if SettingsTable.FreeGift then
                --function getNil(name,class) for _,v in pairs(getnilinstances())do if v.ClassName==class and v.Name==name then return v;end end end
                local ohTable1 = {
                    [1] = igift
                }
                workspace.__THINGS.__REMOTES["redeem free gift"]:InvokeServer(ohTable1)
                igift = igift + 1
                if igift > 12 then

                    igift = 1
                end
            end
        end)
    end
end)
Misc:Toggle("Auto Collect Bank Interest", SettingsTable.Bankcollect, function(t)
    SettingsTable.Bankcollect = t

end)

spawn(function()
    while task.wait() do
        if SettingsTable.Bankcollect then
            pcall(function()
                function getNil(name, class) for _, v in pairs(getnilinstances()) do if v.ClassName == class and
                            v.Name == name then return v; end
                    end
                end

                local mybanks = lib.Network.Invoke("get my banks")

                local request, request2 = lib.Network.Invoke("collect bank interest", mybanks[1]["BUID"]);

                if request then

                else
                    return;
                end
            end)
        end
    end
end)


-- local lib = require(game.ReplicatedStorage:WaitForChild('Framework'):WaitForChild('Library'))
-- local request, request2 = lib.Network.Invoke("join coin", "995", {[1] = "id8ed6b2d49dc84268a08c4b7d1eea2c2f"});
--     lib.Network.Fire("farm coin", "995", "id8ed6b2d49dc84268a08c4b7d1eea2c2f");
-- if request then

-- else
-- return;
-- end



Misc:Button("Destroy Pet Notifications", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Main.Bottom.Inventory.Notification:Destroy()
end)



--   Misc:Toggle("Auto Buy Merchant Item 1", false, function(t)
--       getgenv().PromptGuioof:AddText("Auto Buy Merchant Item 1", Enum.Font.Code, Color3.fromRGB(200, 200, 200))
--       Item1 = t
--           while Item1 do task.wait(.6)
--               function getNil(name,class) for _,v in pairs(getnilinstances())do if v.ClassName==class and v.Name==name then return v;end end end
--               pcall(function()
--                   local ohTable1 = {
--                       [1] = 1
--                   }

--                   workspace.__THINGS.__REMOTES["buy merchant item"]:InvokeServer(ohTable1)
--                   local ohTable1 = {}

--                   workspace.__THINGS.__REMOTES["get merchant items"]:InvokeServer(ohTable1)
--               end)
--           end
--       end)

--   Misc:Toggle("Auto Buy Merchant Item 2", false, function(t)
--       getgenv().PromptGuioof:AddText("Auto Buy Merchant Item 2", Enum.Font.Code, Color3.fromRGB(200, 200, 200))
--       Item2 = t
--           while Item2 do task.wait(.6)
--               function getNil(name,class) for _,v in pairs(getnilinstances())do if v.ClassName==class and v.Name==name then return v;end end end
--               pcall(function()
--                   local ohTable1 = {
--                       [1] = 2
--                   }

--                   workspace.__THINGS.__REMOTES["buy merchant item"]:InvokeServer(ohTable1)
--                   local ohTable1 = {}

--                   workspace.__THINGS.__REMOTES["get merchant items"]:InvokeServer(ohTable1)
--               end)
--           end
--       end)

--     Misc:Toggle("Auto Buy Merchant Item 3", false, function(t)
--       getgenv().PromptGuioof:AddText("Auto Buy Merchant Item 3", Enum.Font.Code, Color3.fromRGB(200, 200, 200))
--         Item3 = t
--             while Item3 do task.wait(.6)
--               function getNil(name,class) for _,v in pairs(getnilinstances())do if v.ClassName==class and v.Name==name then return v;end end end
--                 pcall(function()
--                     local ohTable1 = {
--                         [1] = 3
--                     }

--                     workspace.__THINGS.__REMOTES["buy merchant item"]:InvokeServer(ohTable1)
--                     local ohTable1 = {}

--                   workspace.__THINGS.__REMOTES["get merchant items"]:InvokeServer(ohTable1)
--                 end)
--             end
--         end)


Misc:line()

Misc:Button("Bank", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Bank.Enabled = true
end)

-- Misc:Bind("Open Bank", Enum.KeyCode.One, function(t)
--     SettingsTable.KBbank = t.Name
--     game:GetService("Players").LocalPlayer.PlayerGui.Bank.Enabled = true

-- end)
Misc:Button("Golden", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Golden.Enabled = true
end)
-- Misc:Bind("Open Golden",Enum.KeyCode[SettingsTable.KBgolden],function (t)
--     SettingsTable.KBgolden = t.Name
--     game:GetService("Players").LocalPlayer.PlayerGui.Golden.Enabled = true

-- end)
Misc:Button("Rainbow", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Rainbow.Enabled = true
end)
-- Misc:Bind("Open Rainbow",Enum.KeyCode[SettingsTable.KBrainbow],function (t)
--     SettingsTable.KBrainbow = t.Name
--     game:GetService("Players").LocalPlayer.PlayerGui.Rainbow.Enabled = true

-- end)
Misc:Button("Fuse Pets", function()
    game:GetService("Players").LocalPlayer.PlayerGui.FusePets.Enabled = true
end)
-- Misc:Bind("Open Fuse",Enum.KeyCode[SettingsTable.KBfuse],function (t)
--     SettingsTable.KBfuse = t.Name
--     game:GetService("Players").LocalPlayer.PlayerGui.FusePets.Enabled = true

-- end)
Misc:Button("DarkMatter", function()
    game:GetService("Players").LocalPlayer.PlayerGui.DarkMatter.Enabled = true
end)
-- Misc:Bind("Open DarkMatter",Enum.KeyCode[SettingsTable.KBdm],function (t)
--     SettingsTable.KBdm = t.Name
--     game:GetService("Players").LocalPlayer.PlayerGui.DarkMatter.Enabled = true

-- end)
Misc:Button("Merchant", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Merchant.Enabled = true
end)
-- Misc:Bind("Open Merchant",Enum.KeyCode[SettingsTable.KBmerchant],function (t)
--     SettingsTable.KBmerchant = t.Name
--     game:GetService("Players").LocalPlayer.PlayerGui.Merchant.Enabled = true

-- end)
Misc:Button("Teleport", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Teleport.Enabled = true
end)
-- Misc:Bind("Open Teleport",Enum.KeyCode[SettingsTable.KBtele],function (t)
--     SettingsTable.KBtele = t.Name
--     game:GetService("Players").LocalPlayer.PlayerGui.Teleport.Enabled = true

-- end)
Misc:line()

local Players_Table = {}
for i, v in pairs(game.Players:GetPlayers()) do
    if v ~= game.Players.LocalPlayer then
        table.insert(Players_Table, v.Name)
    end
end


Misc:Dropdown("Select Player", Players_Table, function(t)
    SelectedPlayer = t
end)

local NormalCoins
local FantasyCoins
local TechCoins
local PixelCoins
local PlayerName
local RankSpoofLab
local Token_Spoof

local Spoof_Data

--  local lib = require(game:GetService("ReplicatedStorage"):WaitForChild("Framework"):WaitForChild("Library"))


Misc:Button("Spoof Player", function()
    local mybanks = lib.Network.Invoke("get stats", game:GetService("Players")[SelectedPlayer], false)

    for i, v in pairs(mybanks) do
        if i == "Coins" then
            Spoof_Data = v
        end
        if i == "Fantasy Coins" then
            fantasyCoinsSpoof = v
        end
        if i == "Tech Coins" then
            TechCoinSpoof = v
        end
        if i == "Rainbow Coins" then
            RainbowCoinSpoof = v
        end
        if i == "Rank" then
            rankSpoof = v
        end
        if i == "SafeSaveToken" then
            SpoofToken = v
        end
    end
    PlayerName:Refresh("Player Name: " .. game:GetService("Players")[SelectedPlayer].Name)
    RankSpoofLab:Refresh("Rank: " .. rankSpoof)
    Token_Spoof:Refresh("Safe Token: " .. SpoofToken)
    NormalCoins:Refresh("Coins: " .. Spoof_Data)
    FantasyCoins:Refresh("Fantasy Coins: " .. fantasyCoinsSpoof)
    TechCoins:Refresh("Tech Coins: " .. TechCoinSpoof)
    PixelCoins:Refresh("Pixel Coins: " .. RainbowCoinSpoof)
end)
PlayerName = Misc:Label("Player Name: ")
RankSpoofLab = Misc:Label("Rank Spoof: ")
Token_Spoof = Misc:Label("Safe Token: ")
NormalCoins = Misc:Label("Coins: ")
FantasyCoins = Misc:Label("Fantasy Coins: ")
TechCoins = Misc:Label("Tech Coins: ")
PixelCoins = Misc:Label("Pixel Coins: ")




function GetMyPets()
    local returntable = {}
    for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
        if v.ClassName == 'TextButton' and v.Equipped.Visible then
            table.insert(returntable, v.Name)
        end
    end
    return returntable
end

local CurrentFarmingPets = {}
local pethingy = GetMyPets()
local cointhiny = nil
local cointhiny2 = nil


local areaTable = {
    --Misc
    ['VIP'] = { 'VIP' };
    --Spawn
    ['Town'] = { 'Town', 'Town FRONT' }; ['Forest'] = { 'Forest', 'Forest FRONT' };
    ['Beach'] = { 'Beach', 'Beach FRONT' };
    ['Mine'] = { 'Mine', 'Mine FRONT' }; ['Winter'] = { 'Winter', 'Winter FRONT' };
    ['Glacier'] = { 'Glacier', 'Glacier Lake' }; ['Desert'] = { 'Desert', 'Desert FRONT' };
    ['Volcano'] = { 'Volcano', 'Volcano FRONT' }; ['Tech'] = { 'Tech', 'Tech FRONT' };
    -- Fantasy init
    ['Enchanted Forest'] = { 'Enchanted Forest', 'Enchanted Forest FRONT' }; ['Ancient Island'] = { 'Ancient Island' };
    ['Samurai Island'] = { 'Samurai Island', 'Samurai Island FRONT' }; ['Candy Island'] = { 'Candy Island' };
    ['Haunted Island'] = { 'Haunted Island', 'Haunted Island FRONT' }; ['Hell Island'] = { 'Hell Island' };
    ['Heaven Island'] = { 'Heaven Island' };
    -- Tech
    ['Ice Tech'] = { 'Ice Tech' }; ['Tech City'] = { 'Tech City'; 'Tech City FRONT' };
    ['Dark Tech'] = { 'Dark Tech'; 'Dark Tech FRONT' }; ['Steampunk'] = { 'Steampunk'; 'Steampunk FRONT' },
    ['Alien Forest'] = { "Alien Forest"; "Alien Forest FRONT" }, ['Alien Lab'] = { "Alien Forest"; "Alien Lab FRONT" },
    ['Glitch'] = { "Glitch"; "Glitch FRONT" }; ['Hacker Portal'] = { "Hacker Portal", "Hacker Portal FRONT" };
    -- Axolotl
    ['Axolotl Ocean'] = { 'Axolotl Ocean', 'Axolotl Ocean FRONT' };
    ['Axolotl Deep Ocean'] = { 'Axolotl Deep Ocean', 'Axolotl Deep Ocean FRONT' };
    ['Axolotl Cave'] = { 'Axolotl Cave', 'Axolotl Cave FRONT' };
}

local AreaList = {
    'Town'; 'Forest'; 'Beach'; 'Mine'; 'Winter'; 'Glacier'; 'Desert'; 'Volcano'; -- Spawn World
    'Enchanted Forest'; 'Ancient Island'; 'Samurai Island'; 'Candy Island'; 'Haunted Island'; 'Hell Island';
    'Heaven Island'; -- Fantasy World
    'Ice Tech'; 'Tech City'; 'Dark Tech'; 'Steampunk'; 'Alien Lab'; 'Alien Forest'; 'Glitch'; "Hacker Portal"; -- Tech World
    'Axolotl Ocean'; 'Axolotl Deep Ocean'; 'Axolotl Cave' -- Axolotl World
}


-------------------------------
workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "buy egg")
workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "join coin")
workspace.__THINGS.__REMOTES.MAIN:FireServer("a", "farm coin")
workspace.__THINGS.__REMOTES.MAIN:FireServer("a", "claim orbs")
workspace.__THINGS.__REMOTES.MAIN:FireServer("a", "change pet target")
workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "get trade")
workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "add trade pet")
workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "remove trade pet")
workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "convert to dark matter")
workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "redeem dark matter pet")
workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "redeem rank rewards")
workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "redeem vip rewards")
workspace.__THINGS.__REMOTES.MAIN:FireServer("a", "toggle setting")
workspace.__THINGS.__REMOTES.MAIN:FireServer("a", "activate boost")
workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "use golden machine")
workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "use rainbow machine")
workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "buy upgrade")
workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "redeem merch code")
workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "redeem free gift")
workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "fuse pets")
-------------------------------

function FarmCoin(CoinID, PetID)
    game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({ [1] = CoinID, [2] = { [1] = PetID } })
    game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({ [1] = CoinID, [2] = PetID })
end

function GetThePets()
    local returntable = {}
    for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
        if v.ClassName == 'TextButton' and v.Equipped.Visible then
            table.insert(returntable, v.Name)
        end
    end
    return returntable
end

local Chests = {
    "All"; -- All Chests
    -- Spawn
    "Volcano Magma Chest",
    -- Fantasy
    "Ancient Island Enchanted Chest", "Hell Island Hell Chest", "Haunted Island Haunted Chest",
    "Heaven Island Angel Chest", "Heavens Gate Grand Heaven Chest",
    -- Tech
    "Giant Tech Chest", "Giant Steampunk Chest", "Giant Alien Chest",
    -- Other
    "Giant Present",
    -- Axolotl
    "Giant Ocean Chest",
    -- Pixel World
    "Giant Pixel Chest"
}

Autofarm:Toggle("Gem Farm", false, function(t)
    if t then
    else
    end
    SettingsTable.GemFarm = t
end)

Autofarm:Toggle("Chest Farm", false, function(t)
    if t then
    else
    end
    ChestFarm = t
end)

Autofarm:Checklist("Select Chest", "chests", Chests, function(v)
    SelectChest = v
end)

Autofarm:line()

Autofarm:Toggle("Farm Selected Coin", false, function(t)
    if t then
    else
    end
    FarmSelectedCoin = t
end)

Autofarm:Toggle("Ultra Area Farm (risk of getting Kicked!)", false, function(t)
    if t then
    else
    end
    UltraAreaFarm = t
end)

Autofarm:Toggle("Area Farm", SettingsTable.AreaFarm, function(t)
    if t then
    else
    end
    SettingsTable.AreaFarm = t
end)

local Areas = { 'All' }
for i, v in pairs(game:GetService("ReplicatedStorage").Game.Coins:GetDescendants()) do
    if v.ClassName == "Folder" and v.Name ~= "Spawn" and v.Name ~= "Fantasy" and v.Name ~= "Tech" and v.Name ~= "Other"
        and v.Name ~= "Axolotl" and v.Name ~= "Pixel" then
        table.insert(Areas, v.Name)
    end
end

Autofarm:Checklist("Area", "SelArea", Areas, function(t)
    SelectedArea = t
end)

local noiceCoin = {
    'Coins',
    'Crate',
    'Large Coins',
    'Safe',
    'Small Chest',
    'Present',
    'Large Present',
    'Tiny Coins',
    'Vault',
    'Chest',
    'Tech Cube',
    'Small Tech Cube',
}


Autofarm:Checklist("Select Coin", "hope", noiceCoin, function(t)
    SecCoin2 = t
end)

Autofarm:line()

Autofarm:Toggle("Farm Nearest", false, function(t)
    if t then
    else
    end
    SettingsTable.FarmNearest = t
end)

Autofarm:Toggle("MultiTarget", SettingsTable.MultiTarget, function(t)
    if t then
    else
    end
    SettingsTable.MultiTarget = t
end)

Autofarm:Toggle("Farm Coins by Health", false, function(t)
    if t then
    else
    end
    FarmCoinHealth = t
end)

spawn(function()
    while task.wait(.7) do
        if game:GetService("Workspace")["__THINGS"].Orbs:FindFirstChildOfClass("Part") and (FarmCoinHealth
            or SettingsTable.MultiTarget or SettingsTable.FarmNearest or SettingsTable.AreaFarm
            or UltraAreaFarm or FarmSelectedCoin or SettingsTable.GemFarm or ChestFarm or SettingsTable.GemFarm) then
            local TweenService = game:GetService("TweenService")

            for i, v in pairs(game:GetService("Workspace")["__THINGS"].Orbs:GetChildren()) do
                if v:IsA("Part") and v:FindFirstChild("Orb") then
                    v.Orb.Sunray:Destroy()
                    TweenService:Create(
                        v,
                        TweenInfo.new(.3, Enum.EasingStyle.Linear),
                        { CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame }
                    ):Play()
                end
            end
        end
    end
end)

Autofarm:line()


Autofarm:Toggle("World Hop", false, function(t)
    if t then
    else
    end
    worldhop = t
end)

local WorldTable = {
    'Pixel',
    'Axolotl Ocean', 'Fantasy', 'Spawn', 'Tech'
}

Autofarm:Checklist("Select Worlds", "worldsel", WorldTable, function()

end)



spawn(function()
    while task.wait(.5) do
        if worldhop then
            pcall(function()
                for i, v in pairs(check["worldsel"].Value) do
                    GameLibrary.WorldCmds.Load(v)
                    wait(setTime or 5)
                end
            end)
        else
        end
    end
end)

Autofarm:Textbox("Type in Wait Time", "Here!", function(t)
    setTime = t
end)

Autofarm:line()

maxhealth = 2500000000000000000

Autofarm:Slider("Select Health", 1, maxhealth, 500, function(t)
    SelHealth = t
end)

Autofarm:Slider("Select Distance", 1, 400, 307, function(v)
    SelDistacne = v
end)

Autofarm:line()


local CratesMasteryList = { "Town Crate"; "Forest Crate"; "Beach Crate"; "Mine Crate"; "Desert Crate"; "Volcano Crate";
    "Winter Crate"; "Glacier Crate"; "Enchanted Forest Crate"; "Ancient Island Crate"; "Samurai Island Crate";
    "Candy Island Crate"; "Haunted Island Crate"; "Hell Island Crate"; "Heaven Island Crate"; "Tech City Crate";
    "Dark Tech Crate"; "Alien Forest Crate"; "Axolotl Ocean Crate"; "Pixel Forest Crate"; "Pixel Alps Crate"; }

local CoinsPilesMasteryList = { "Town Coins", "Town Large Coins", 'Town Tiny Coins', "Forest Coins", "Forest Large Coins",
    "Forest Tiny Coins", "Beach Coins", "Beach Large Coins", "Beach Tiny Coins", "Mine Coins", "Mine Large Coins",
    "Mine Tiny Coins", "Desert Coins", "Desert Large Coins", "Desert Tiny Coins", "Volcano Coins", "Volcano Large Coins",
    "Volcano Tiny Coins", "Winter Coins", "Winter Large Coins", "Winter Tiny Coins", "Glacier Coins",
    "Glacier Large Coins", "Glacier Tiny Coins", "Enchanted Forest Coins", "Enchanted Forest Large Coins",
    "Enchanted Forest Tiny Coins", "Ancient Island Coins", "Ancient Island Large Coins", "Ancient Island Tiny Coins",
    "Samurai Island Coins", "Samurai Island Large Coins", "Samurai Island Tiny Coins", "Candy Island Coins",
    "Candy Island Large Coins", "Candy Island Tiny Coins", "Haunted Island Coins", 'Haunted Island Large Coins',
    'Haunted Island Tiny Coins', 'Heaven Island Coins', 'Heaven Island Large Coins', 'Heaven Island Tiny Coins',
    'Tech City Coins', 'Tech City Large Coins', 'Tech City Tiny Coins', 'Dark Tech Coins', 'Dark Tech Large Coins',
    'Dark Tech Tiny Coins', 'Steampunk Coins', 'Steampunk Large Coins', 'Steampunk Tiny Coins', 'Alien Lab Coins',
    'Alien Lab Large Coins', 'Alien Lab Tiny Coins', 'Alien Forest Coins', 'Alien Forest Large Coins',
    'Alien Forest Tiny Coins', 'Blue Glitched Coins', 'Blue Glitched Large Coins', 'Blue Glitched Tiny Coins',
    'Pink Glitched Coins', 'Pink Glitched Large Coins', 'Pink Glitched Tiny Coins', 'Axolotl Ocean Coins',
    'Axolotl Ocean Large Coins', 'Axolotl Ocean Tiny Coins', 'Pixel Forest Coins', 'Pixel Forest Large Coins',
    'Pixel Forest Tiny Coins', 'Pixel Kyoto Coins', 'Pixel Kyoto Large Coins' }

local ChestsMasteryList = { 'Town Chest', "Forest Small Chest", "Forest Chest", "Beach Chest", "Beach Small Chest",
    "Mine Small Chest", "Mine Chest", "Desert Chest", "Desert Small Chest", "Winter Chest", "Winter Small Chest",
    "Glacier Chest", "Glacier Small Chest", "Enchanted Forest Chest", "Enchanted Forest Small Chest",
    "Samurai Island Chest", "Samurai Island Small Chest", "Candy Island Chest", "Candy Island Small Chest",
    "Hell Island Chest", 'Hell Island Small Chest', "Heaven Island Chest", 'Heaven Island Small Chest',
    "Axolotl Deep Ocean Chest", "Axolotl Deep Ocean Small Chest", "Pixel Forest Chest", 'Pixel Forest Small Chest',
    "Pixel Alps Chest", 'Pixel Alps Small Chest' }

local PresentsMasteryList = { "Town Present", "Forest Present", "Beach Present", "Mine Present", "Desert Present",
    "Volcano Present", "Winter Present", "Glacier Present", "Enchanted Forest Present", "Ancient Island Present",
    "Samurai Island Present", "Candy Island Present", "Haunted Island Present", "Hell Island Present",
    "Heaven Island Present", "Tech City Present", "Dark Tech Present", "Alien Forest Present", "Blue Glitched Present",
    "Pink Glitched Present", "Axolotl Ocean Present", "Pixel Forest Present", "Pixel Kyoto Present",
    "Pixel Kyoto Large Present" }

local VaultsSafesMasteryList = { "Forest Safe", "Forest Vault", "Beach Safe", "Beach Vault", "Mine Safe", "Mine Vault",
    "Desert Safe", "Desert Vault", "Volcano Safe", "Volcano Vault", "Winter Safe", "Winter Vault", "Glacier Safe",
    "Glacier Vault", "Enchanted Forest Safe", "Enchanted Forest Vault", "Ancient Island Vault", 'Ancient Island Safe',
    "Candy Island Vault", 'Candy Island Safe', "Haunted Island Vault", 'Haunted Island Safe', "Heaven Island Vault",
    'Heaven Island Safe', "Tech City Vault", 'Tech City Safe', "Steampunk Vault", 'Steampunk Safe', "Alien Lab Vault",
    'Alien Lab Safe', "Blue Glitched Vault", 'Blue Glitched Safe', "Pink Glitched Vault", 'Pink Glitched Safe',
    "Axolotl Deep Ocean Vault", 'Axolotl Deep Ocean Safe', "Pixel Forest Vault", 'Pixel Forest Safe', "Pixel Vault Safe",
    "Pixel Vault Vault" }

local DiamondsMasteryList = { "Diamonds", "Tiny Diamonds" }
local MasteryIndex = { "All", "Coins Piles Mastery", "Crates Mastery", "Chests Mastery", "Presents Mastery",
    "Vaults & Safes Mastery", "Diamonds Mastery" }
Autofarm:Checklist("Mastery List", "Mast", MasteryIndex, function(v)
    hewoUwU = v
end)

Autofarm:Toggle("Auto Farm Mastery", false, function(t)
    if t then
    else
    end
    Mastery = t
end)

spawn(function()
    while task.wait(FarmingSpeed) do
        if Mastery then
            pcall(function()
                for i2, v2 in pairs(check["Mast"].Value) do
                    if v2 == "Crates Mastery" then
                        local CurrentFarmingPets = {}
                        local pethingy = GetMyPets()
                        for i, v in pairs(CratesMastery()) do
                            if v.index % #pethingy == #pethingy - 1 then wait() end
                            if not CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] or
                                CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] == nil then
                                if game:GetService("Workspace")["__THINGS"].Coins:FindFirstChild(v.index) then
                                    pcall(function()
                                        CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] = 'Farming'
                                        FarmCoin(v.index, pethingy[v.index % #pethingy + 1])
                                    end)
                                end
                            end
                        end
                    elseif v2 == "All" then
                        local CurrentFarmingPets = {}
                        local pethingy = GetMyPets()
                        for i, v in pairs(CoinsPilesMastery()) do
                            if v.index % #pethingy == #pethingy - 1 then wait() end
                            if not CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] or
                                CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] == nil then
                                if game:GetService("Workspace")["__THINGS"].Coins:FindFirstChild(v.index) then
                                    pcall(function()
                                        CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] = 'Farming'
                                        FarmCoin(v.index, pethingy[v.index % #pethingy + 1])
                                    end)
                                end
                            end
                        end
                        for i, v in pairs(DiamondsMastery()) do
                            if v.index % #pethingy == #pethingy - 1 then wait() end
                            if not CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] or
                                CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] == nil then
                                if game:GetService("Workspace")["__THINGS"].Coins:FindFirstChild(v.index) then
                                    pcall(function()
                                        CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] = 'Farming'
                                        FarmCoin(v.index, pethingy[v.index % #pethingy + 1])
                                    end)
                                end
                            end
                        end
                        for i, v in pairs(VaultsSafesMastery()) do
                            if v.index % #pethingy == #pethingy - 1 then wait() end
                            if not CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] or
                                CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] == nil then
                                if game:GetService("Workspace")["__THINGS"].Coins:FindFirstChild(v.index) then
                                    pcall(function()
                                        CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] = 'Farming'
                                        FarmCoin(v.index, pethingy[v.index % #pethingy + 1])
                                    end)
                                end
                            end
                        end
                        for i, v in pairs(ChestsMastery()) do
                            if v.index % #pethingy == #pethingy - 1 then wait() end
                            if not CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] or
                                CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] == nil then
                                if game:GetService("Workspace")["__THINGS"].Coins:FindFirstChild(v.index) then
                                    pcall(function()
                                        CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] = 'Farming'
                                        FarmCoin(v.index, pethingy[v.index % #pethingy + 1])
                                    end)
                                end
                            end
                        end
                        for i, v in pairs(PresentsMastery()) do
                            if v.index % #pethingy == #pethingy - 1 then wait() end
                            if not CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] or
                                CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] == nil then
                                if game:GetService("Workspace")["__THINGS"].Coins:FindFirstChild(v.index) then
                                    pcall(function()
                                        CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] = 'Farming'
                                        FarmCoin(v.index, pethingy[v.index % #pethingy + 1])
                                    end)
                                end
                            end
                        end


                    elseif v2 == "Coins Piles Mastery" then
                        local CurrentFarmingPets = {}
                        local pethingy = GetMyPets()
                        for i, v in pairs(CoinsPilesMastery()) do
                            if v.index % #pethingy == #pethingy - 1 then wait() end
                            if not CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] or
                                CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] == nil then
                                if game:GetService("Workspace")["__THINGS"].Coins:FindFirstChild(v.index) then
                                    pcall(function()
                                        CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] = 'Farming'
                                        FarmCoin(v.index, pethingy[v.index % #pethingy + 1])
                                    end)
                                end
                            end
                        end
                    elseif v2 == "Chests Mastery" then
                        local CurrentFarmingPets = {}
                        local pethingy = GetMyPets()
                        for i, v in pairs(ChestsMastery()) do
                            if v.index % #pethingy == #pethingy - 1 then wait() end
                            if not CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] or
                                CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] == nil then
                                if game:GetService("Workspace")["__THINGS"].Coins:FindFirstChild(v.index) then
                                    pcall(function()
                                        CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] = 'Farming'
                                        FarmCoin(v.index, pethingy[v.index % #pethingy + 1])
                                    end)
                                end
                            end
                        end
                    elseif v2 == "Presents Mastery" then
                        local CurrentFarmingPets = {}
                        local pethingy = GetMyPets()
                        for i, v in pairs(PresentsMastery()) do
                            if v.index % #pethingy == #pethingy - 1 then wait() end
                            if not CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] or
                                CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] == nil then
                                if game:GetService("Workspace")["__THINGS"].Coins:FindFirstChild(v.index) then
                                    pcall(function()
                                        CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] = 'Farming'
                                        FarmCoin(v.index, pethingy[v.index % #pethingy + 1])
                                    end)
                                end
                            end
                        end
                    elseif v2 == "Vaults & Safes Mastery" then
                        local CurrentFarmingPets = {}
                        local pethingy = GetMyPets()
                        for i, v in pairs(VaultsSafesMastery()) do
                            if v.index % #pethingy == #pethingy - 1 then wait() end
                            if not CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] or
                                CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] == nil then
                                if game:GetService("Workspace")["__THINGS"].Coins:FindFirstChild(v.index) then
                                    pcall(function()
                                        CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] = 'Farming'
                                        FarmCoin(v.index, pethingy[v.index % #pethingy + 1])
                                    end)
                                end
                            end
                        end
                    elseif v2 == "Diamonds Mastery" then
                        local CurrentFarmingPets = {}
                        local pethingy = GetMyPets()
                        for i, v in pairs(DiamondsMastery()) do
                            if v.index % #pethingy == #pethingy - 1 then wait() end
                            if not CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] or
                                CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] == nil then
                                if game:GetService("Workspace")["__THINGS"].Coins:FindFirstChild(v.index) then
                                    pcall(function()
                                        CurrentFarmingPets[pethingy[v.index % #pethingy + 1]] = 'Farming'
                                        FarmCoin(v.index, pethingy[v.index % #pethingy + 1])
                                    end)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

function CratesMastery()
    local returntable = {}
    local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
    for i, v in pairs(ListCoins) do
        local shit = v
        shit["index"] = i
        for aa, bb in pairs(CratesMasteryList) do
            if string.find(v.n, bb) then
                local thing = string.gsub(v.n, bb .. " ", " ")
                if table.find(CratesMasteryList, thing) then
                    shit.n = thing
                    table.insert(returntable, shit)
                end
            end
        end
    end
    return returntable
end

function CoinsPilesMastery()
    local returntable = {}
    local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
    for i, v in pairs(ListCoins) do
        local shit = v
        shit["index"] = i
        for aa, bb in pairs(CoinsPilesMasteryList) do
            if string.find(v.n, bb) then
                local thing = string.gsub(v.n, bb .. " ", " ")
                if table.find(CoinsPilesMasteryList, thing) then
                    shit.n = thing
                    table.insert(returntable, shit)
                end
            end
        end
    end
    return returntable
end

function ChestsMastery()
    local returntable = {}
    local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
    for i, v in pairs(ListCoins) do
        local shit = v
        shit["index"] = i
        for aa, bb in pairs(ChestsMasteryList) do
            if string.find(v.n, bb) then
                local thing = string.gsub(v.n, bb .. " ", " ")
                if table.find(ChestsMasteryList, thing) then
                    shit.n = thing
                    table.insert(returntable, shit)
                end
            end
        end
    end
    return returntable
end

function PresentsMastery()
    local returntable = {}
    local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
    for i, v in pairs(ListCoins) do
        local shit = v
        shit["index"] = i
        for aa, bb in pairs(PresentsMasteryList) do
            if string.find(v.n, bb) then
                local thing = string.gsub(v.n, bb .. " ", " ")
                if table.find(PresentsMasteryList, thing) then
                    shit.n = thing
                    table.insert(returntable, shit)
                end
            end
        end
    end
    return returntable
end

function VaultsSafesMastery()
    local returntable = {}
    local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
    for i, v in pairs(ListCoins) do
        local shit = v
        shit["index"] = i
        for aa, bb in pairs(VaultsSafesMasteryList) do
            if string.find(v.n, bb) then
                local thing = string.gsub(v.n, bb .. " ", " ")
                if table.find(VaultsSafesMasteryList, thing) then
                    shit.n = thing
                    table.insert(returntable, shit)
                end
            end
        end
    end
    return returntable
end

function DiamondsMastery()
    local returntable = {}
    local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
    for i, v in pairs(ListCoins) do
        local shit = v
        shit["index"] = i
        for aa, bb in pairs(DiamondsMasteryList) do
            if string.find(v.n, bb) then
                local thing = string.gsub(v.n, bb .. " ", " ")
                if table.find(DiamondsMasteryList, thing) then
                    shit.n = thing
                    table.insert(returntable, shit)
                end
            end
        end
    end
    return returntable
end

Autofarm:line()

Autofarm:Toggle("Hide Coin Health", false, function(v)
    ShowHealt = v
end)

spawn(function()
    while task.wait() do
        if ShowHealt then
            pcall(function()
                for i, v in pairs(game:GetService("Workspace")["__THINGS"].Coins:GetDescendants()) do
                    if v.Name == "HUD" then
                        v:Destroy()
                    end
                end
            end)
        end
    end
end)

Autofarm:Toggle("Hide Coins", false, function(v)
    ShowCoin = v
end)

spawn(function()
    while task.wait() do
        if ShowCoin then
            pcall(function()
                for i, v in pairs(game:GetService("Workspace")["__THINGS"].Coins:GetChildren()) do
                    v:Destroy()
                end
            end)
        end
    end
end)

function FarmCoin(CoinID, PetID)
    game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({ [1] = CoinID, [2] = { [1] = PetID } })
    game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({ [1] = CoinID, [2] = PetID })
end

spawn(function()
    while task.wait(FarmingSpeed) do
        if ChestFarm then
            pcall(function()

                if fastoption then
                    for i2, v2 in pairs(check["chests"].Value) do
                        if v2 == 'All' then
                            local function FarmCoin(CoinID, PetID)
                                game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({ [1] = CoinID,
                                    [2] = { [1] = PetID } })
                                game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({ [1] = CoinID,
                                    [2] = PetID })
                            end

                            local function GetPet()
                                local ReturnTable = {}
                                for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets
                                    :GetChildren()) do
                                    if v.ClassName == "TextButton" and v.Equipped.Visible then
                                        table.insert(ReturnTable, v.Name)
                                    end
                                end
                                return ReturnTable
                            end

                            local function GetCoins(chest)
                                local ReturnTable = {}
                                local ListCoins = workspace.__THINGS.__REMOTES["get coins"]:InvokeServer({})[1]
                                for i, v in pairs(ListCoins) do
                                    if v.n == 'Volcano Magma Chest' or
                                        v.n == "Ancient Island Enchanted Chest" or
                                        v.n == "Hell Island Hell Chest" or
                                        v.n == "Haunted Island Haunted Chest" or
                                        v.n == "Heaven Island Angel Chest" or
                                        v.n == "Heavens Gate Grand Heaven Chest" or
                                        v.n == "Giant Tech Chest" or
                                        v.n == "Giant Steampunk Chest" or
                                        v.n == "Giant Alien Chest" or
                                        v.n == "Giant Ocean Chest" or
                                        v.n == "Giant Present"
                                    then
                                        local Coin = v
                                        Coin["index"] = i
                                        table.insert(ReturnTable, Coin)
                                    end
                                end
                                return ReturnTable
                            end

                            local PetThiny = GetPet()
                            local Cointhiny = GetCoins()

                            for i = 1, #Cointhiny do
                                coroutine.wrap(function()
                                    FarmCoin(Cointhiny[i].index, PetThiny[1])
                                    FarmCoin(Cointhiny[i].index, PetThiny[2])
                                    FarmCoin(Cointhiny[i].index, PetThiny[3])
                                    FarmCoin(Cointhiny[i].index, PetThiny[4])
                                    FarmCoin(Cointhiny[i].index, PetThiny[5])
                                    FarmCoin(Cointhiny[i].index, PetThiny[6])
                                    FarmCoin(Cointhiny[i].index, PetThiny[7])
                                    FarmCoin(Cointhiny[i].index, PetThiny[8])
                                    FarmCoin(Cointhiny[i].index, PetThiny[9])
                                    FarmCoin(Cointhiny[i].index, PetThiny[10])
                                    FarmCoin(Cointhiny[i].index, PetThiny[11])
                                    FarmCoin(Cointhiny[i].index, PetThiny[12])
                                    FarmCoin(Cointhiny[i].index, PetThiny[13])
                                    FarmCoin(Cointhiny[i].index, PetThiny[14])
                                    FarmCoin(Cointhiny[i].index, PetThiny[15])
                                    FarmCoin(Cointhiny[i].index, PetThiny[16])
                                    FarmCoin(Cointhiny[i].index, PetThiny[17])
                                    FarmCoin(Cointhiny[i].index, PetThiny[18])
                                    FarmCoin(Cointhiny[i].index, PetThiny[19])
                                    FarmCoin(Cointhiny[i].index, PetThiny[20])
                                    FarmCoin(Cointhiny[i].index, PetThiny[21])
                                    FarmCoin(Cointhiny[i].index, PetThiny[22])
                                end)()
                            end
                        else
                            local function FarmCoin(CoinID, PetID)
                                game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({ [1] = CoinID,
                                    [2] = { [1] = PetID } })
                                game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({ [1] = CoinID,
                                    [2] = PetID })
                            end

                            local function GetPet()
                                local ReturnTable = {}
                                for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets
                                    :GetChildren()) do
                                    if v.ClassName == "TextButton" and v.Equipped.Visible then
                                        table.insert(ReturnTable, v.Name)
                                    end
                                end
                                return ReturnTable
                            end

                            local function GetCoins(chest)
                                local ReturnTable = {}
                                local ListCoins = workspace.__THINGS.__REMOTES["get coins"]:InvokeServer({})[1]
                                for i, v in pairs(ListCoins) do
                                    for i2, v2 in pairs(check["chests"].Value) do
                                        if v.n == v2 then
                                            local Coin = v
                                            Coin["index"] = i
                                            table.insert(ReturnTable, Coin)
                                        end
                                    end
                                end
                                return ReturnTable
                            end

                            local PetThiny = GetPet()
                            local Cointhiny = GetCoins()

                            for i = 1, #Cointhiny do
                                coroutine.wrap(function()
                                    FarmCoin(Cointhiny[i].index, PetThiny[1])
                                    FarmCoin(Cointhiny[i].index, PetThiny[2])
                                    FarmCoin(Cointhiny[i].index, PetThiny[3])
                                    FarmCoin(Cointhiny[i].index, PetThiny[4])
                                    FarmCoin(Cointhiny[i].index, PetThiny[5])
                                    FarmCoin(Cointhiny[i].index, PetThiny[6])
                                    FarmCoin(Cointhiny[i].index, PetThiny[7])
                                    FarmCoin(Cointhiny[i].index, PetThiny[8])
                                    FarmCoin(Cointhiny[i].index, PetThiny[9])
                                    FarmCoin(Cointhiny[i].index, PetThiny[10])
                                    FarmCoin(Cointhiny[i].index, PetThiny[11])
                                    FarmCoin(Cointhiny[i].index, PetThiny[12])
                                    FarmCoin(Cointhiny[i].index, PetThiny[13])
                                    FarmCoin(Cointhiny[i].index, PetThiny[14])
                                    FarmCoin(Cointhiny[i].index, PetThiny[15])
                                    FarmCoin(Cointhiny[i].index, PetThiny[16])
                                    FarmCoin(Cointhiny[i].index, PetThiny[17])
                                    FarmCoin(Cointhiny[i].index, PetThiny[18])
                                    FarmCoin(Cointhiny[i].index, PetThiny[19])
                                    FarmCoin(Cointhiny[i].index, PetThiny[20])
                                    FarmCoin(Cointhiny[i].index, PetThiny[21])
                                    FarmCoin(Cointhiny[i].index, PetThiny[22])
                                end)()
                            end
                        end
                    end
                else
                    for i2, v2 in pairs(check["chests"].Value) do
                        if v2 == 'All' then
                            local function FarmCoin(CoinID, PetID)
                                game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({ [1] = CoinID,
                                    [2] = { [1] = PetID } })
                                game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({ [1] = CoinID,
                                    [2] = PetID })
                            end

                            local function GetPet()
                                local ReturnTable = {}
                                for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets
                                    :GetChildren()) do
                                    if v.ClassName == "TextButton" and v.Equipped.Visible then
                                        table.insert(ReturnTable, v.Name)
                                    end
                                end
                                return ReturnTable
                            end

                            local function GetCoins(chest)
                                local ReturnTable = {}
                                local ListCoins = workspace.__THINGS.__REMOTES["get coins"]:InvokeServer({})[1]
                                for i, v in pairs(ListCoins) do
                                    if v.n == 'Volcano Magma Chest' or
                                        v.n == "Ancient Island Enchanted Chest" or
                                        v.n == "Hell Island Hell Chest" or
                                        v.n == "Haunted Island Haunted Chest" or
                                        v.n == "Heaven Island Angel Chest" or
                                        v.n == "Heavens Gate Grand Heaven Chest" or
                                        v.n == "Giant Tech Chest" or
                                        v.n == "Giant Steampunk Chest" or
                                        v.n == "Giant Alien Chest" or
                                        v.n == "Giant Ocean Chest" or
                                        v.n == "Giant Present"
                                    then
                                        local Coin = v
                                        Coin["index"] = i
                                        table.insert(ReturnTable, Coin)
                                    end
                                end
                                return ReturnTable
                            end

                            local PetThiny = GetPet()
                            local Cointhiny = GetCoins()

                            for i = 1, #Cointhiny do
                                FarmCoin(Cointhiny[i].index, PetThiny[1])
                                FarmCoin(Cointhiny[i].index, PetThiny[2])
                                FarmCoin(Cointhiny[i].index, PetThiny[3])
                                FarmCoin(Cointhiny[i].index, PetThiny[4])
                                FarmCoin(Cointhiny[i].index, PetThiny[5])
                                FarmCoin(Cointhiny[i].index, PetThiny[6])
                                FarmCoin(Cointhiny[i].index, PetThiny[7])
                                FarmCoin(Cointhiny[i].index, PetThiny[8])
                                FarmCoin(Cointhiny[i].index, PetThiny[9])
                                FarmCoin(Cointhiny[i].index, PetThiny[10])
                                FarmCoin(Cointhiny[i].index, PetThiny[11])
                                FarmCoin(Cointhiny[i].index, PetThiny[12])
                                FarmCoin(Cointhiny[i].index, PetThiny[13])
                                FarmCoin(Cointhiny[i].index, PetThiny[14])
                                FarmCoin(Cointhiny[i].index, PetThiny[15])
                                FarmCoin(Cointhiny[i].index, PetThiny[16])
                                FarmCoin(Cointhiny[i].index, PetThiny[17])
                                FarmCoin(Cointhiny[i].index, PetThiny[18])
                                FarmCoin(Cointhiny[i].index, PetThiny[19])
                                FarmCoin(Cointhiny[i].index, PetThiny[20])
                                FarmCoin(Cointhiny[i].index, PetThiny[21])
                                FarmCoin(Cointhiny[i].index, PetThiny[22])
                            end
                        else
                            local function FarmCoin(CoinID, PetID)
                                game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({ [1] = CoinID,
                                    [2] = { [1] = PetID } })
                                game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({ [1] = CoinID,
                                    [2] = PetID })
                            end

                            local function GetPet()
                                local ReturnTable = {}
                                for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets
                                    :GetChildren()) do
                                    if v.ClassName == "TextButton" and v.Equipped.Visible then
                                        table.insert(ReturnTable, v.Name)
                                    end
                                end
                                return ReturnTable
                            end

                            local function GetCoins(chest)
                                local ReturnTable = {}
                                local ListCoins = workspace.__THINGS.__REMOTES["get coins"]:InvokeServer({})[1]
                                for i, v in pairs(ListCoins) do
                                    for i2, v2 in pairs(check["chests"].Value) do
                                        if v.n == v2 then
                                            local Coin = v
                                            Coin["index"] = i
                                            table.insert(ReturnTable, Coin)
                                        end
                                    end
                                end
                                return ReturnTable
                            end

                            local PetThiny = GetPet()
                            local Cointhiny = GetCoins()

                            for i = 1, #Cointhiny do
                                FarmCoin(Cointhiny[i].index, PetThiny[1])
                                FarmCoin(Cointhiny[i].index, PetThiny[2])
                                FarmCoin(Cointhiny[i].index, PetThiny[3])
                                FarmCoin(Cointhiny[i].index, PetThiny[4])
                                FarmCoin(Cointhiny[i].index, PetThiny[5])
                                FarmCoin(Cointhiny[i].index, PetThiny[6])
                                FarmCoin(Cointhiny[i].index, PetThiny[7])
                                FarmCoin(Cointhiny[i].index, PetThiny[8])
                                FarmCoin(Cointhiny[i].index, PetThiny[9])
                                FarmCoin(Cointhiny[i].index, PetThiny[10])
                                FarmCoin(Cointhiny[i].index, PetThiny[11])
                                FarmCoin(Cointhiny[i].index, PetThiny[12])
                                FarmCoin(Cointhiny[i].index, PetThiny[13])
                                FarmCoin(Cointhiny[i].index, PetThiny[14])
                                FarmCoin(Cointhiny[i].index, PetThiny[15])
                                FarmCoin(Cointhiny[i].index, PetThiny[16])
                                FarmCoin(Cointhiny[i].index, PetThiny[17])
                                FarmCoin(Cointhiny[i].index, PetThiny[18])
                                FarmCoin(Cointhiny[i].index, PetThiny[19])
                                FarmCoin(Cointhiny[i].index, PetThiny[20])
                                FarmCoin(Cointhiny[i].index, PetThiny[21])
                                FarmCoin(Cointhiny[i].index, PetThiny[22])
                            end
                        end
                    end
                end
            end)
        end
    end
end)


spawn(function()
    while task.wait(FarmingSpeed) do
        if SettingsTable.GemFarm then
            function getGemid()
                for i, v in pairs(game:GetService("Workspace")["__THINGS"].Coins:GetDescendants()) do
                    if v:IsA "MeshPart" then
                        if v.MeshId == 'rbxassetid://7041620873' or v.MeshId == 'rbxassetid://7041621431' or
                            v.MeshId == 'rbxassetid://7041621329' or v.MeshId == 'rbxassetid://7041620873' then
                            a = v.Parent.Name
                        end
                    end
                end
                return a
            end

            function GetThePets2()
                local returntable = {}
                for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
                    if v.ClassName == 'TextButton' and v.Equipped.Visible then
                        table.insert(returntable, v.Name)
                    end
                end
                return returntable
            end

            local GetMyPets = GetThePets2()

            function FarmCoin65(CoinID, PetID)
                game.workspace["__THINGS"]["__REMOTES"]["join coin"]:InvokeServer({ [1] = CoinID, [2] = { [1] = PetID } })
                game.workspace["__THINGS"]["__REMOTES"]["farm coin"]:FireServer({ [1] = CoinID, [2] = PetID })
            end

            for i, v in pairs(GetMyPets) do
                pcall(function()
                    FarmCoin65(getGemid(), v)
                end)
            end
        end
    end
end)


spawn(function()
    while task.wait(.6) do
        if FarmCoinHealth then
            pcall(function()
                function FarmCoin(CoinID, PetID)
                    game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({ [1] = CoinID,
                        [2] = { [1] = PetID } })
                    game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({ [1] = CoinID, [2] = PetID })
                end

                function GetPet()
                    local Returntable = {}
                    for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:
                        GetChildren()) do
                        if v.ClassName == "TextButton" and v.Equipped.Visible then
                            table.insert(Returntable, v.Name)
                        end
                    end
                    return Returntable
                end

                local NearestCoin = tonumber(SelDistacne)
                function GetCoins()
                    local Returntable = {}
                    local Areas = (areaTable)
                    local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
                    for i, v in pairs(ListCoins) do
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.p).Magnitude < NearestCoin
                            or v.h >= SelHealth then
                            local Coin = v
                            Coin["index"] = i
                            table.insert(Returntable, Coin)
                            NearestCoin = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.p).Magnitude
                        end
                    end
                    return Returntable
                end

                local petthingy = GetPet()

                local cointhiny = GetCoins()

                for i = 1, #cointhiny do
                    coroutine.wrap(function()
                        FarmCoin(cointhiny[i].index, petthingy[i % #petthingy + 1])
                    end)()
                end

            end)
        end
    end
end)

--FarmSelectedCoin
--SelectedArea
spawn(function()
    while task.wait(FarmingSpeed) do
        if FarmSelectedCoin then
            pcall(function()
                for i4, v4 in pairs(check["SelArea"].Value) do
                    if v4 == "All" then
                        local function FarmCoin(CoinID, PetID)
                            game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({ [1] = CoinID,
                                [2] = { [1] = PetID } })
                            game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({ [1] = CoinID, [2] = PetID })
                        end

                        local function GetPet()
                            local ReturnTable = {}
                            for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets
                                :GetChildren()) do
                                if v.ClassName == "TextButton" and v.Equipped.Visible then
                                    table.insert(ReturnTable, v.Name)
                                end
                            end
                            return ReturnTable
                        end

                        local function GetCoins(area)
                            local ReturnTable = {}
                            local ListCoins = workspace.__THINGS.__REMOTES["get coins"]:InvokeServer({})[1]
                            for i, v in pairs(ListCoins) do
                                for i2, v2 in pairs(check["hope"].Value) do
                                    if v.n == "Town" .. " " .. v2 or
                                        v.n == "Forest" .. " " .. v2 or
                                        v.n == "Beach" .. " " .. v2 or
                                        v.n == "Mine" .. " " .. v2 or
                                        v.n == "Winter" .. " " .. v2 or
                                        v.n == "Glacier" .. " " .. v2 or
                                        v.n == "Desert" .. " " .. v2 or
                                        v.n == "Volcano" .. " " .. v2 or
                                        v.n == "Enchanted Forest" .. " " .. v2 or
                                        v.n == "Ancient Island" .. " " .. v2 or
                                        v.n == "Samurai Island" .. " " .. v2 or
                                        v.n == "Candy Island" .. " " .. v2 or
                                        v.n == "Haunted Island" .. " " .. v2 or
                                        v.n == "Hell Island" .. " " .. v2 or
                                        v.n == "Heaven Island" .. " " .. v2 or
                                        v.n == "Ice Tech" .. " " .. v2 or
                                        v.n == "Tech City" .. " " .. v2 or
                                        v.n == "Dark Tech" .. " " .. v2 or
                                        v.n == "Steampunk" .. " " .. v2 or
                                        v.n == "Alien Lab" .. " " .. v2 or
                                        v.n == "Alien Forest" .. " " .. v2 or
                                        v.n == "Glitch" .. " " .. v2 or
                                        v.n == "Hacker Portal" .. " " .. v2 or
                                        v.n == "Axolotl Ocean" .. " " .. v2 or
                                        v.n == "Axolotl Deep Ocean" .. " " .. v2 or
                                        v.n == "Axolotl Cave" .. " " .. v2
                                    then
                                        local Coin = v
                                        Coin["index"] = i
                                        table.insert(ReturnTable, Coin)
                                    end
                                end
                            end
                            return ReturnTable
                        end

                        local PetThiny = GetPet()
                        local Cointhiny = GetCoins()

                        for i = 1, #Cointhiny do
                            coroutine.wrap(function()
                                FarmCoin(Cointhiny[i].index, PetThiny[i % #PetThiny + 1])
                            end)()
                        end

                    else

                        local function FarmCoin(CoinID, PetID)
                            game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({ [1] = CoinID,
                                [2] = { [1] = PetID } })
                            game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({ [1] = CoinID, [2] = PetID })
                        end

                        local function GetPet()
                            local ReturnTable = {}
                            for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets
                                :GetChildren()) do
                                if v.ClassName == "TextButton" and v.Equipped.Visible then
                                    table.insert(ReturnTable, v.Name)
                                end
                            end
                            return ReturnTable
                        end

                        local function GetCoins(area)
                            local ReturnTable = {}
                            local ListCoins = workspace.__THINGS.__REMOTES["get coins"]:InvokeServer({})[1]
                            for i, v in pairs(ListCoins) do
                                for i2, v2 in pairs(check["hope"].Value) do
                                    for i3, v3 in pairs(check["SelArea"].Value) do
                                        if v.n == v3 .. " " .. v2 then
                                            local Coin = v
                                            Coin["index"] = i
                                            table.insert(ReturnTable, Coin)
                                        end
                                    end
                                end
                            end
                            return ReturnTable
                        end

                        local PetThiny = GetPet()
                        local Cointhiny = GetCoins()

                        for i = 1, #Cointhiny do
                            coroutine.wrap(function()
                                FarmCoin(Cointhiny[i].index, PetThiny[i % #PetThiny + 1])
                            end)()
                        end
                    end
                end

            end)
        end
    end
end)

spawn(function()
    while task.wait(FarmingSpeed) do
        if SettingsTable.AreaFarm then
            pcall(function()

                for i, v in pairs(check["SelArea"].Value) do
                    getgenv().Area = v
                end

                function FarmCoin(CoinID, PetID)
                    game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({ [1] = CoinID,
                        [2] = { [1] = PetID } })
                    game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({ [1] = CoinID, [2] = PetID })
                    game:GetService("ReplicatedStorage").Framework.Modules["2 | Network"]["update coin pets"]:Fire(CoinID
                        , { [1] = PetID })
                end

                function GetMyPets()
                    local returntable = {}
                    for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:
                        GetChildren()) do
                        if v.ClassName == 'TextButton' and v.Equipped.Visible then
                            table.insert(returntable, v.Name)
                        end
                    end
                    return returntable
                end

                function GetCoins()
                    local returntable = {}
                    local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
                    for i, v in pairs(ListCoins) do
                        if Area == "All" or string.find(string.lower(v.a), string.lower(Area)) then
                            table.insert(returntable, i)
                        end
                    end
                    return returntable
                end

                local cointhiny = GetCoins()
                local getpet = GetMyPets()
                for i = 1, #cointhiny do
                    pcall(function() FarmCoin(cointhiny[i], getpet[i % #getpet + 1]) end)
                end

                --[[
                          local function FarmCoin(CoinID, PetID)
                              game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({[1] = CoinID, [2] = {[1] = PetID}})
                              game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({[1] = CoinID, [2] = PetID})
                           end
                      
                           local function GetPet()
                              local ReturnTable = {}
                                  for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
                                      if v.ClassName == "TextButton" and v.Equipped.Visible then
                                          table.insert(ReturnTable, v.Name)
                                      end
                                  end
                              return ReturnTable
                           end
          
          
                          local function GetCoins()
                              local ReturnTable = {}
                              local AreaTable = (areaTable)
                              local ListCoins = workspace.__THINGS.__REMOTES["get coins"]:InvokeServer({})[1]
                              for i,v in pairs(ListCoins) do
                                  for i2, v2 in pairs(check["SelArea"].Value) do
                                  if v2 == "All" or v.a == v2 then
                                      local Coin = v
                                      Coin["index"] = i
                                      table.insert(ReturnTable, Coin)
                                  end
                              end
                              end
                              return ReturnTable
                          end
          
                          local PetThiny = GetPet()
                          local Cointhiny = GetCoins()
          
                          for i = 1, #Cointhiny do
                              FarmCoin(Cointhiny[i].index, PetThiny[i%#PetThiny+1])
                          end]]
            end)
        end
    end
end)





spawn(function()
    while task.wait(FarmingSpeed) do
        if UltraAreaFarm then
            pcall(function()

                for i, v in pairs(check["SelArea"].Value) do
                    getgenv().Area = v
                end

                function FarmCoin(CoinID, PetID)
                    game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({ [1] = CoinID,
                        [2] = { [1] = PetID } })
                    game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({ [1] = CoinID, [2] = PetID })
                end

                function GetMyPets()
                    local returntable = {}
                    for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:
                        GetChildren()) do
                        if v.ClassName == 'TextButton' and v.Equipped.Visible then
                            table.insert(returntable, v.Name)
                        end
                    end
                    return returntable
                end

                function GetCoins()
                    local returntable = {}
                    local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
                    for i, v in pairs(ListCoins) do
                        if Area == "All" or string.find(string.lower(v.a), string.lower(Area)) then
                            table.insert(returntable, i)
                        end
                    end
                    return returntable
                end

                local cointhiny = GetCoins()
                local getpet = GetMyPets()
                for i = 1, #cointhiny do
                    coroutine.wrap(function()
                        pcall(function() FarmCoin(cointhiny[i], getpet[i % #getpet + 1]) end)
                    end)()
                end
            end)
        end
    end
end)

function GetThePets540()
    local returntable = {}
    for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
        if v.ClassName == 'TextButton' and v.Equipped.Visible then
            table.insert(returntable, v.Name)
        end
    end
    return returntable
end

function FarmCoin2(CoinID, PetID)
    game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({ [1] = CoinID, [2] = { [1] = PetID } })
    game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({ [1] = CoinID, [2] = PetID })
end

local pethingy2 = GetThePets540()

spawn(function()
    while task.wait(FarmingSpeed) do
        if SettingsTable.FarmNearest then
            pcall(function()

                local nearest
                local NearestOne = tonumber(SelDistacne) or 307
                for i, v in pairs(game:GetService("Workspace")["__THINGS"].Coins:GetChildren()) do
                    if (v.POS.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                        NearestOne then
                        nearest = v
                        NearestOne = (v.POS.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    end
                end

                local Cointhiny2 = nearest.Name
                for i = 1, #Cointhiny2 do
                    coroutine.wrap(function()
                        FarmCoin2(Cointhiny2, pethingy2[i % #pethingy2 + 1])

                    end)()
                end
            end)
        end
    end
end)

spawn(function()
    while game:GetService("RunService").Heartbeat:wait(FarmingSpeed) do
        if SettingsTable.MultiTarget then
            pcall(function()

                function FarmCoin(CoinID, PetID)
                    game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({ [1] = CoinID,
                        [2] = { [1] = PetID } })
                    game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({ [1] = CoinID, [2] = PetID })
                end

                function GetPet()
                    local Returntable = {}
                    for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:
                        GetChildren()) do
                        if v.ClassName == "TextButton" and v.Equipped.Visible then
                            table.insert(Returntable, v.Name)
                        end
                    end
                    return Returntable
                end

                local NearestCoin = tonumber(SelDistacne) or 307
                function GetCoins()
                    local Returntable = {}
                    local Areas = (areaTable)
                    local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
                    for i, v in pairs(ListCoins) do
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.p).Magnitude < NearestCoin then
                            local Coin = v
                            Coin["index"] = i
                            table.insert(Returntable, Coin)
                            NearestCoin = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.p).Magnitude
                        end
                    end
                    return Returntable
                end

                local petthingy = GetPet()

                local cointhiny = GetCoins()

                for i = 1, #cointhiny do
                    coroutine.wrap(function()
                        FarmCoin(cointhiny[i].index, petthingy[i % #petthingy + 1])
                    end)()
                end
            end)
        end
    end
end)

Autofarm:line()

Autofarm:Toggle("Fast Farm", false, function(t)
    if t then
    else
    end
    fastoption = t
end)

Autofarm:line()

Autofarm:Toggle("Fast AutoCollect Coins", SettingsTable.FastColect, function(t)

    SettingsTable.FastColect = t

end)
spawn(function()
    while task.wait() do
        pcall(function()
            if SettingsTable.FastColect then
                local ohTable1 = { [1] = {} }
                for i, v in pairs(game.workspace['__THINGS'].Orbs:GetChildren()) do
                    ohTable1[1][i] = v.Name
                end
                game.workspace['__THINGS']['__REMOTES']["claim orbs"]:FireServer(ohTable1)
            end

        end)
    end
end)
Autofarm:Toggle('Auto Collect Loot Bags', SettingsTable.FastColect, function(t)

    SettingsTable.LootBag = t
end)

spawn(function()
    while task.wait() do
        if SettingsTable.LootBag then
            pcall(function()
                for i, v in pairs(game:GetService("Workspace")["__THINGS"].Lootbags:GetChildren()) do
                    if (v:GetAttribute("ReadyForCollection")) then
                        if not v:GetAttribute("Collected") then
                            getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.Scripts.Game.Lootbags).Collect(v)
                            v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        end
                    end
                end
            end)
        end
    end
end)

Autofarm:Toggle("Auto Redeam Rank Rewards", SettingsTable.RankRew, function(t)

    SettingsTable.RankRew = t

end)
spawn(function()
    while wait(.3) do
        if SettingsTable.RankRew then

            workspace.__THINGS.__REMOTES["redeem rank rewards"]:InvokeServer({})
        end
    end
end)
Autofarm:Toggle("Auto Use Triple Damage Boost", SettingsTable.autodametrip, function(state)
    SettingsTable.autodametrip = state

end)
spawn(function()
    while wait() do


        if SettingsTable.autodametrip then
            function getNil(name, class) for _, v in pairs(getnilinstances()) do if v.ClassName == class and
                        v.Name == name then return v; end
                end
            end

            local args = {
                [1] = {
                    [1] = "Triple Damage"
                }
            }

            workspace.__THINGS.__REMOTES:FindFirstChild("activate boost"):FireServer(unpack(args))



            while wait(1200) do
                if SettingsTable.autodametrip then
                    function getNil(name, class) for _, v in pairs(getnilinstances()) do if v.ClassName == class and
                                v.Name == name then return v; end
                        end
                    end

                    local args = {
                        [1] = {
                            [1] = "Triple Damage"
                        }
                    }

                    workspace.__THINGS.__REMOTES:FindFirstChild("activate boost"):FireServer(unpack(args))

                end
            end
        end
    end
end)
Autofarm:Toggle("Auto Use Triple Coin Boost", SettingsTable.autocointrip, function(state)
    SettingsTable.autocointrip = state

end)

spawn(function()
    while wait() do


        if SettingsTable.autocointrip then
            function getNil(name, class) for _, v in pairs(getnilinstances()) do if v.ClassName == class and
                v.Name == name then return v; end end end

            local args = {
                [1] = {
                    [1] = "Triple Coins",
                },
            }

            workspace["__THINGS"]["__REMOTES"]["activate boost"]:FireServer(unpack(args))


            while wait(1200) do
                if SettingsTable.autocointrip then
                    function getNil(name, class) for _, v in pairs(getnilinstances()) do if v.ClassName == class and
                                v.Name == name then return v; end
                        end
                    end

                    local args = {
                        [1] = {
                            [1] = "Triple Coins",
                        },
                    }

                    workspace["__THINGS"]["__REMOTES"]["activate boost"]:FireServer(unpack(args))
                end
            end


        end
    end
end)
Autofarm:Button("FPSBoost", function()

    local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or
            e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end)



local EggTable = { 'All' }
for i, v in pairs(game.ReplicatedStorage.Game.Eggs:GetChildren()) do
    for i2, v2 in pairs(v:GetChildren()) do
        table.insert(EggTable, v2.Name)
    end
end

local current = 0
local EggCount = Eggs:Label("")

local pathToScript = game.Players.LocalPlayer.PlayerScripts.Scripts.Game['Open Eggs']
local oldFunc = getsenv(pathToScript).OpenEgg
Eggs:Toggle("Remove egg opening animation", SettingsTable.RemEggAnimation, function(delanimation)
    SettingsTable.RemEggAnimation = delanimation
    if delanimation == true then

        getsenv(pathToScript).OpenEgg = function() return end
    else

        getsenv(pathToScript).OpenEgg = oldFunc
    end
end)

Eggs:Checklist("Select Egg", "SelEg", EggTable, function(t)
    SettingsTable.openegg = check["SelEg"].Value
    return
end, SettingsTable.openegg)

game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.ChildAdded:Connect(function(child)
    if child.Name ~= "Empty" then
        current = current + 1
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            EggCount:Refresh("Eggs Opened: " .. current)
        end)
    end
end)

Eggs:Toggle("Start Egg Open", SettingsTable.autoegg, function(startegss)
    SettingsTable.autoegg = startegss

end)

spawn(function()
    while task.wait() do
        if SettingsTable.autoegg then
            for i, v in pairs(check["SelEg"].Value) do
                if v == "All" then
                    for b, a in pairs(game.ReplicatedStorage.Game.Eggs:GetChildren()) do
                        for i2, v2 in pairs(a:GetChildren()) do
                            local args = {
                                [1] = {
                                    [1] = v2.Name,
                                    [2] = SettingsTable.autoeggtrip
                                }
                            }
                            workspace.__THINGS.__REMOTES:FindFirstChild("buy egg"):InvokeServer(unpack(args))

                        end
                    end
                else
                    local args = {
                        [1] = {
                            [1] = v,
                            [2] = SettingsTable.autoeggtrip
                        }
                    }
                    workspace.__THINGS.__REMOTES:FindFirstChild("buy egg"):InvokeServer(unpack(args))

                end
            end
        end
    end
end

)

Eggs:Toggle("Triple Open Eggs (Gamepass Needed)", SettingsTable.autoeggtrip, function(t)

    SettingsTable.autoeggtrip = t
end)

Eggs:Toggle("Auto Open inv", SettingsTable.autoopenbag, function(t)
    SettingsTable.autoopenbag = t

end)
spawn(function()
    while task.wait() do
        if SettingsTable.autoopenbag then
            game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Enabled = true
            wait(.8)
            game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Enabled = false
            wait(SettingsTable.timeopenbag * 60) -- this is 5 min

        end
    end
end)
Eggs:Slider("Select Time (Auto Open Inv)", 1, 30, SettingsTable.timeopenbag, function(v)
    SettingsTable.timeopenbag = v
end)

Eggs:line()
Eggs:Toggle("Auto Use Super Luck!", SettingsTable.autoluck, function(v)
    SettingsTable.autoluck = v
    function getNil(name, class) for _, v in pairs(getnilinstances()) do if v.ClassName == class and v.Name == name then return v; end end end



end)
spawn(function()
    while task.wait() do
        if SettingsTable.autoluck then
            local args = {
                [1] = {
                    [1] = "Super Lucky",
                },
            }

            workspace["__THINGS"]["__REMOTES"]["activate boost"]:FireServer(unpack(args))
            task.wait(1199)
        end
    end
end)
Eggs:Toggle("Auto Use ULTRA Luck!", SettingsTable.autoultraluck, function(v)
    SettingsTable.autoultraluck = v

    function getNil(name, class) for _, v in pairs(getnilinstances()) do if v.ClassName == class and v.Name == name then return v; end end end


end)
spawn(function()
    while task.wait() do task.wait()
        if SettingsTable.autoultraluck then
            local args = {
                [1] = {
                    [1] = "Ultra Lucky",
                },
            }

            workspace["__THINGS"]["__REMOTES"]["activate boost"]:FireServer(unpack(args))
            task.wait(899)
        end
    end
end)
Eggs:line()
Eggs:Toggle("Auto Upgrade Pet Storage", false, function(t)
    getgenv().PetStorage = t
    while wait() do
        if getgenv().PetStorage == true then
            local args = {
                [1] = {
                    [1] = "Pet Storage"
                }
            }
            workspace.__THINGS.__REMOTES:FindFirstChild("buy upgrade"):InvokeServer(unpack(args))

        end
    end
end)

Eggs:Toggle("Auto Upgrade walkspeed", false, function(t)
    getgenv().walkspeed = t
    while wait() do
        if getgenv().walkspeed == true then

            local args = {
                [1] = {
                    [1] = "Player Walkspeed"
                }
            }

            workspace.__THINGS.__REMOTES:FindFirstChild("buy upgrade"):InvokeServer(unpack(args))

        end
    end
end)
Eggs:Toggle("Auto Upgrade Orbs Reach", false, function(t)
    getgenv().walksorbreachpeed = t
    while wait() do
        if getgenv().orbreach == true then

            local args = {
                [1] = {
                    [1] = "Orb Pickup Distance"
                }
            }

            workspace.__THINGS.__REMOTES:FindFirstChild("buy upgrade"):InvokeServer(unpack(args))

        end
    end
end)
Eggs:Toggle("Auto Upgrade More Diamonds", false, function(t)
    getgenv().morediamonds = t
    while wait() do
        if getgenv().morediamonds == true then
            local args = {
                [1] = {
                    [1] = "More Diamonds"
                }
            }

            workspace.__THINGS.__REMOTES:FindFirstChild("buy upgrade"):InvokeServer(unpack(args))

        end
    end
end)
Eggs:Toggle("Auto Upgrade Pet Speed", false, function(t)
    getgenv().PetWalkspeed = t
    while wait() do
        if getgenv().PetWalkspeed == true then
            local args = {
                [1] = {
                    [1] = "Pet Walkspeed"
                }
            }

            workspace.__THINGS.__REMOTES:FindFirstChild("buy upgrade"):InvokeServer(unpack(args))

        end
    end
end)
Eggs:Toggle("Auto Upgrade Pet Strength", false, function(t)
    getgenv().PetStrength = t
    while wait() do
        if getgenv().PetStrength == true then

            local args = {
                [1] = {
                    [1] = "Pet Strength"
                }
            }

            workspace.__THINGS.__REMOTES:FindFirstChild("buy upgrade"):InvokeServer(unpack(args))
        end
    end
end)



local Network = GameLibrary.Network
local Run_Service = game:GetService("RunService")
local rs = Run_Service.RenderStepped
local IDToName = {}
local NameToID = {}
local PettoRarity = {}
local RarityTable = {}
local PetNamesTable = {}
local PetNamesTable = {}

local IDToName = {}
local NameToID = {}
for i, v in pairs(Library.Directory.Pets) do
    IDToName[i] = v.name
    NameToID[v.name] = i
end

function GetMyPets()
    local returntable = {}
    for i, v in pairs(GameLibrary.Save.Get().Pets) do
        if v.e then
            table.insert(returntable, v.uid)
        end
    end
    return returntable
end

function GetPets()
    local MyPets = {}
    for i, v in pairs(GameLibrary.Save.Get().Pets) do
        -- print(v)
        local ThingyThingyTempTypeThing = (v.g and 'Gold') or (v.r and 'Rainbow') or (v.dm and 'Dark Matter') or 'Normal'
        local TempString = ThingyThingyTempTypeThing .. IDToName[v.id]
        if v.hc then
            TempString = "HC" .. TempString
        end
        if MyPets[TempString] then
            table.insert(MyPets[TempString], v.uid)
        else
            MyPets[TempString] = {}
            table.insert(MyPets[TempString], v.uid)
        end
    end

    -- print(unpack(MyPets))
    return MyPets
end

for i, v in pairs(GameLibrary.Directory.Pets) do
    IDToName[i] = v.name
    NameToID[v.name] = i
    PettoRarity[i] = v.rarity
    if not table.find(RarityTable, v.rarity) then
        table.insert(RarityTable, v.rarity)
    end
    table.insert(PetNamesTable, v.name)
end

pets2:Slider("Select pet amount", 1, 10, SettingsTable.amountg, function(countcombinefunc)
    SettingsTable.amountg = countcombinefunc

end)



pets2:Toggle("Auto golden", SettingsTable.autogold, function(togglegoldfunc)
    SettingsTable.autogold = togglegoldfunc

end)


pets2:Toggle("Auto rainbow", SettingsTable.autorainbow, function(toggleraibowfunc)
    SettingsTable.autorainbow = toggleraibowfunc

end)

pets2:Toggle("Enable Auto Golden / Rainbow", SettingsTable.enablegold_rainbow, function(autocombinefunc)
    SettingsTable.enablegold_rainbow = autocombinefunc




    -- spawn(function()
    --     while wait() and getgenv().AutoCom do
    --         if not getgenv().ToggleGold and not getgenv().ToggleRainbow then
    --             repeat wait(1) until getgenv().ToggleGold or getgenv().ToggleRainbow
    --         end
    --         if tonumber(getgenv().CountCombineFunc1) == nil then
    --             repeat wait() until tonumber(getgenv().CountCombineFunc1) ~= nil
    --         end
    --         for i, v in pairs(GetPets()) do
    --             if #v >= getgenv().CountCombineFunc1 and (getgenv().ToggleGold or getgenv().ToggleRainbow) then
    --                 if string.find(i, "Normal") and getgenv().ToggleGold then
    --                     local Args = {}
    --                     for eeeee = 1, getgenv().CountCombineFunc1 do
    --                         Args[#Args + 1] = v[#Args + 1]
    --                     end
    --                     GameLibrary.Network.Invoke("use golden machine", Args)
    --                 elseif string.find(i, "Gold") and getgenv().ToggleRainbow then
    --                     local Args = {}
    --                     for eeeee = 1, getgenv().CountCombineFunc1 do
    --                         Args[#Args + 1] = v[#Args + 1]
    --                     end
    --                     GameLibrary.Network.Invoke("use rainbow machine", Args)
    --                 end
    --             end
    --         end
    --     end
    -- end)
end)

-- -- Script generated by R2Sv2
-- -- R2Sv2 developed by Luckyxero

-- local A_1 =
-- {
-- 	[1] =
-- {
-- 	[1] = "idd6e0c98a89e34d3d9db7a70d16251a97",
-- 	[2] = "id78260631d7fa4f9fad947541ca1294a9",
-- 	[3] = "id354fa333416e4df091098e01b3e070bd",
-- 	[4] = "id9aa234d58880466c999094d7e321e320",
-- 	[5] = "id81597c3433f04e848c001dbfba29c8b8",
-- 	[6] = "idce8f5d17e18549fa9e113e627a12dcb8"
-- }
-- }
-- local Event = game:GetService("Workspace")["__THINGS"]["__REMOTES"]["use golden machine"]
-- Event:InvokeServer(A_1)

spawn(function()
    while wait(1) do
        if SettingsTable.enablegold_rainbow then

            for i, v in pairs(GetPets()) do

                if #v >= tonumber(SettingsTable.amountg) then

                    if string.find(i, "Normal") and SettingsTable.enablegold_rainbow and SettingsTable.autogold then
                        local Args = {}

                        for eeeee = 1, SettingsTable.amountg do
                            Args[eeeee] = v[eeeee]
                        end

                        Library.Network.Invoke("use golden machine", Args)
                    elseif string.find(i, "Gold") and SettingsTable.enablegold_rainbow and SettingsTable.autorainbow then
                        local Args = {}
                        for eeeee = 1, SettingsTable.amountg do
                            Args[eeeee] = v[eeeee]
                        end
                        Library.Network.Invoke("use rainbow machine", Args)
                    end
                end
            end
        end
    end
end)

pets2:line()

local FusePets_Table = { "All" }
for i, v in pairs(Library.Directory.Pets) do
    table.insert(FusePets_Table, v.name)
end

pets2:Checklist("Select Pets Fuse", "selFusePet", FusePets_Table, function(t)

end)

--   pets2:Textbox("Enter Pets Name", "Type Here", function(t)
--         FusePetsPetName = t
--   end)

local TypeListFuse = { "Normal"; "Gold"; "Rainbow"; "Dark Matter"; }
pets2:Checklist("Pet Rarity Type of", "prto", TypeListFuse, function(t)

end)

pets2:Slider("Amount Of Pets To Fuse", 3, 12, 3, function(t)
    FusePetsAmmount = t
end)

pets2:Toggle("Auto Fuse", false, function(t)
    StartAutoFuse = t
end)

pets2:Toggle("Allow Hardcore Pets", false, function(t)
    AllowHCPetsFuse = t
end)

function hasenchant(tbl, value)
    for i, v in pairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

spawn(function()
    while task.wait() do
        if StartAutoFuse then
            pcall(function()


                -- local petsammount = FusePetsAmmount
                -- local PetId = -1

                for i2pog, v2pog in pairs(checklists["selFusePet"].Value) do
                    if v2pog == "All" then
                        local Library = require(game:GetService("ReplicatedStorage"):WaitForChild("Framework"):
                            WaitForChild("Library"))
                        local NameID = {}
                        for i, v in pairs(Library.Directory.Pets) do
                            NameID[i] = v.name
                        end


                        local selectedpets = {}
                        for i, v in pairs(Library.Save.Get().Pets) do
                            local prarity = Library.PetCmds.Get(v.uid)
                            local PetRaito = (v.g and 'Gold') or (v.r and 'Rainbow') or (v.dm and 'Dark Matter') or
                                'Normal'
                            local PetRaito2 = (v.g) or (v.r) or (v.dm)
                            local PetRaito3 = v.g or v.r or v.dm

                            local PetSting = PetRaito .. NameID[v.id]
                            if selectedpets[PetSting] then
                                table.insert(selectedpets[PetSting], v.uid)
                            else
                                selectedpets[PetSting] = {}
                                table.insert(selectedpets[PetSting], v.uid)
                            end
                        end

                        -- local PetRaito = 'Gold' or 'Rainbow' or 'Dark Matter' or 'Normal'
                        local PP
                        for i2, v2 in pairs(selectedpets) do
                            PP = {}
                            if string.find(i2, "Rainbow") or string.find(i2, "Gold") or string.find(i2, "Dark Matter") or
                                string.find(i2, "Normal") then
                                for i = 1, FusePetsAmmount do
                                    PP[#PP + 1] = v2[#PP + 1]
                                end
                                if (#PP == FusePetsAmmount) then
                                    workspace.__THINGS.__REMOTES["fuse pets"]:InvokeServer({ PP })
                                end
                            end
                        end

                    else
                        for i69, v69 in pairs(Library.Directory.Pets) do
                            if v2pog == v69.name then
                                local selectedpets = {}
                                for i, v in pairs(Library.Save.Get().Pets) do
                                    local prarity = Library.PetCmds.Get(v.uid)
                                    if not (#selectedpets == FusePetsAmmount) then
                                        if (v.id == (i69)) then
                                            for i2, v2 in pairs(checklists["prto"].Value) do
                                                if AllowHCPetsFuse then
                                                    if (
                                                        v2 == "Normal" and not prarity.r and not prarity.g and
                                                            not prarity.dm and prarity.hc) or
                                                        (prarity.r and v2 == "Rainbow") or (prarity.g and v2 == "Gold")
                                                        or (prarity.dm and v2 == "Dark Matter") then
                                                        table.insert(selectedpets, v.uid)
                                                    end
                                                end

                                                if (
                                                    v2 == "Normal" and not prarity.r and not prarity.g and not prarity.dm
                                                        and not prarity.hc) or (prarity.r and v2 == "Rainbow") or
                                                    (prarity.g and v2 == "Gold") or (prarity.dm and v2 == "Dark Matter") then
                                                    table.insert(selectedpets, v.uid)
                                                end

                                            end
                                        end
                                    end
                                end
                                if (#selectedpets == FusePetsAmmount) then
                                    workspace.__THINGS.__REMOTES["fuse pets"]:InvokeServer({ selectedpets })
                                end
                                ---
                            end
                        end
                    end
                end
            end)
        end
    end
end)

pets2:line()

pets2:Toggle("Auto Claim Dark Matter Pets", SettingsTable.darkmatterclaim, function(autoclaimdark)
    SettingsTable.darkmatterclaim = autoclaimdark



end)
spawn(function()
    while task.wait() do
        if SettingsTable.darkmatterclaim then
            for i, v in pairs(GameLibrary.Save.Get().DarkMatterQueue) do
                if math.floor(v.readyTime - os.time()) < 0 then
                    workspace.__THINGS.__REMOTES["redeem dark matter pet"]:InvokeServer({ [1] = i })
                end
            end
        end
        task.wait(30)
    end
end)
pets2:line()

pets2:Checklist("Select Pet DarkMatter", "selSPDmatter", FusePets_Table, function(t)
    SettingsTable.listdm = t
    return
end, SettingsTable.listdm)

pets2:Slider("Pet Amount DarkMatter", 1, 10, SettingsTable.amoundm, function(t)
    SettingsTable.amoundm = t
end)

pets2:Toggle("Auto Convert DarkMatter", SettingsTable.autodarkmatter, function(t)
    SettingsTable.autodarkmatter = t
end)

spawn(function()
    while task.wait() do
        if SettingsTable.autodarkmatter then
            pcall(function()
                local PetsTable = {}
                local PetId = -1

                for i4, v4 in pairs(checklists["selSPDmatter"].Value) do
                    for i6, v6 in pairs(lib.Directory.Pets) do
                        if v4 == "All" then
                            for i, v in pairs(lib.Save.Get().Pets) do
                                local prarity = lib.PetCmds.Get(v.uid)
                                if not (#PetsTable == tonumber(SettingsTable.amoundm)) then
                                    if v.id == i6 then
                                        if prarity.r then
                                            table.insert(PetsTable, v.uid)
                                        end
                                    end
                                end
                            end
                        elseif v4 == v6.name then
                            for i, v in pairs(lib.Save.Get().Pets) do
                                local prarity = lib.PetCmds.Get(v.uid)
                                if not (#PetsTable == tonumber(SettingsTable.amoundm)) then
                                    if v.id == i6 then
                                        if prarity.r then
                                            table.insert(PetsTable, v.uid)
                                        end
                                    end
                                end
                            end
                        end

                    end
                end
                if #PetsTable == (tonumber(SettingsTable.amoundm)) then
                    workspace.__THINGS.__REMOTES["convert to dark matter"]:InvokeServer({ PetsTable })
                end
            end)
        end
    end
end)




pets2:line()


--   local enchants = {
--       'Magnet',
--       'Royalty',
--       'Glittering',
--       'Tech Coins',
--       'Fantasy Coins',
--       'Rainbow Coins',
--       'Coins',
--       'Teamwork',
--       'Diamonds',
--       'Strength',
--       'Chests',
--       'Presents',
--       'Agility',
--       'Charm'
--   }

local enchantis = {}
for i, v in pairs(game:GetService("ReplicatedStorage").Directory.Powers:GetChildren()) do
    local powernames = string.gsub(v.Name, "Power -- ", "")
    table.insert(enchantis, powernames)
end



pets2:Toggle("Start Enchanting", false, function(t)
    StartChant = t
end)

local enchants = {
    'Magnet',
    'Royalty',
    'Glittering',
    'Tech Coins',
    'Fantasy Coins',
    'Rainbow Coins',
    'Coins',
    'Teamwork',
    'Diamonds',
    'Strength',
    'Chests',
    'Presents',
    'Agility',
    'Charm',
}

pets2:Dropdown("Select Enchant", enchantis, function(t)
    PowerName = t
end)

pets2:Slider("Select Enchant Level", 1, 6, 1, function(t)
    PowerLevel = t
end)

-- pets2:Toggle("Target Hardcore Pets (Enchant)", false, function(t)
--     TargetHCPets = t
-- end)



function hasInput(tbl, value)
    for i, v in pairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

function hasValue(tbl, value)
    for i, v in pairs(tbl) do
        if i == value then
            return true
        end
    end
    return false
end

spawn(function()
    while task.wait() do
        if StartChant then
            pcall(function()
                if PowerName == "Royalty" or PowerName == "Magnet" or PowerName == "Charm" or PowerName == "Teamwork" or
                    PowerName == "Glittering" then
                    for i, v in pairs(lib.Save.Get().Pets) do
                        local getpvalue = lib.PetCmds.Get(v.uid)
                        if getpvalue.e then
                            if hasValue(getpvalue, "powers") then
                                for i2, v2 in pairs(getpvalue.powers) do
                                    if hasInput(v2, PowerName) then
                                    else
                                        workspace.__THINGS.__REMOTES["enchant pet"]:InvokeServer({ v.uid })
                                    end
                                end
                            else
                                workspace.__THINGS.__REMOTES["enchant pet"]:InvokeServer({ v.uid })
                            end
                        end
                    end
                else
                    for i, v in pairs(lib.Save.Get().Pets) do
                        local getpvalue = lib.PetCmds.Get(v.uid)
                        if getpvalue.e then
                            if hasValue(getpvalue, "powers") then
                                for i2, v2 in pairs(getpvalue.powers) do
                                    if hasInput(v2, PowerLevel) and hasInput(v2, PowerName) then --hasInput(v, "Strength") and
                                    else
                                        workspace.__THINGS.__REMOTES["enchant pet"]:InvokeServer({ v.uid })
                                    end
                                end
                            else
                                workspace.__THINGS.__REMOTES["enchant pet"]:InvokeServer({ v.uid })
                            end
                        end
                    end
                end
            end)
        end
    end
end)


pets2:line()

pets2:Textbox("Enter New Pet Name", "", function(t)
    selpname = t
end)

pets2:Button("Rename All Pets (ONLY CLICK ONCE!)", function()
    spawn(function()
        pcall(function()
            getgenv().UwU:Notify("System", "Renaming Pets \n please be patient!")
        end)
    end)

    for i, v in pairs(Library.Save.Get().Pets) do
        if v.nk ~= selpname then
            -- print(v.uid)
            local scriptEnvironment = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.Scripts.GUIs.Rename)
            scriptEnvironment.Rename(v.uid, selpname)
            task.wait(.87)
        end
    end
end)

local v1 = {};
for i, v in pairs(Library.Directory.Pets) do
    for i, v in pairs(v) do
        if i == "name" then
            table.insert(v1, v)
        end
    end
end

Visuals:Dropdown("Select Pet", v1, function(petname)
    PetNamehere = petname
end)

Visuals:Button("Open Pet", function()
    function HatchEgg(Pet)
        local pet = Pet
        for i, v in pairs(game.ReplicatedStorage.Game.Pets:GetChildren()) do
            if string.split(tostring(v), ' - ')[2] == pet then
                pet = string.split(tostring(v), ' - ')[1]
            end
        end
        local tbl = {
            {
                nk = 'Preston',
                idt = '69',
                e = false,
                uid = '69',
                s = 999999999999,
                id = pet,
            }
        }
        local egg
        for i_, script in pairs(game.ReplicatedStorage.Game.Eggs:GetDescendants()) do
            if script:IsA('ModuleScript') then
                if typeof(require(script).drops) == 'table' then
                    for i, v in pairs(require(script).drops) do
                        if v[1] == pet then
                            egg = require(script).displayName
                        end
                    end
                end
            end
        end
        if Pet == 'Huge Cat' then egg = 'Cracked Egg' end
        for i, v in pairs(getgc(true)) do
            if (typeof(v) == 'table' and rawget(v, 'OpenEgg')) then
                v.OpenEgg(egg, tbl)
            end
        end
    end

    HatchEgg(PetNamehere)
end)


Visuals:Button("Visual Dupe Gems", function()
    function comma_value(amount)
        local formatted = amount
        while true do
            formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
            if (k == 0) then
                break
            end
        end
        return formatted
    end

    local diamonds = game.Players.LocalPlayer.PlayerGui.Main.Right.Diamonds.Amount
    local old = diamonds.Text
    local oldNumber = string.gsub(old, ",", "")
    local newNumber = oldNumber * 10000
    local new = comma_value(newNumber)
    local newString = tostring(new)
    diamonds.Text = newString
end)

Visuals:Button("Make all your Pets Huge Santa", function()
    for i, v in pairs(game:GetService("Workspace")["__THINGS"].Pets:GetChildren()) do
        v.Mesh.MeshId = "rbxassetid://8211668957"
        v.Mesh.TextureId = "rbxassetid://8211668593"
        v.Mesh.Scale = Vector3.new(2, 2, 2)
    end
end)

Visuals:Toggle("Get Coin Bonus (Fake!)", false, function(t)
    StartBonus = t
end)

spawn(function()
    while task.wait() do
        if StartBonus then
            pcall(function()
                local ohVector31 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                game:GetService("ReplicatedStorage").Framework.Modules["2 | Network"]["coin bonus"]:Fire(ohVector31)
            end)
        end
    end
end)

Visuals:Toggle("Spawn LootBags (Fake!)", false, function(t)
    FakeLootbag = t
end)

spawn(function()
    while task.wait() do
        if FakeLootbag then
            pcall(function()
                local ohString1 = "ce6e120a0c304567be950939b7a574c8"
                local ohTable2 = {
                    ["type"] = "Good",
                    ["claimed"] = false,
                    ["position"] = game.Players.LocalPlayer.Character.HumanoidRootPart.Position,
                    ["world"] = "Pixel",
                    ["player"] = game:GetService("Players").LocalPlayer,
                    ["reward"] = {
                        [1] = "Coins",
                        [2] = 5008984,
                        [3] = "Rainbow Coins"
                    }
                }
                game:GetService("ReplicatedStorage").Framework.Modules["2 | Network"]["spawn lootbag"]:Fire(ohString1,
                    ohTable2)
            end)
        end
    end
end)









Credits:Button("Save Settings", function()
    savesettings()
end)

Credits:Button("Load Settings", function()
    loadsettings()
end)

Credits:line()
Credits:Button("Destroy Gui", function()
    game.CoreGui:FindFirstChild("woof"):Destroy()
end)

Credits:Button("Rejoin", function()
    local ts = game:GetService("TeleportService")
    local p = game:GetService("Players").LocalPlayer
    ts:Teleport(game.PlaceId, p)
end)

Credits:line()

UIlib:setTheme(Credits)

-- for i,v in pairs(game:GetService("ReplicatedStorage").Game.Coins:GetChildren()) do
--     for i2,v2 in pairs(v:GetChildren()) do
--         OldFarm:Toggle(v2.Name, false, function(t)

--         end)
--     end
-- end

OldFarm:Label("This Farm Will Always Auto Update!")

-- OldFarm:Toggle("Send All Pets", false, function(t)
--     send_All_Pets = t
-- end)

send_All_Pets = false

OldFarm:line()



for i, imaegg in pairs(game:GetService("ReplicatedStorage").Game.Coins:GetChildren()) do
    for nu, hwe in pairs(imaegg:GetChildren()) do
        OldFarm:Toggle(hwe.Name, false, function(t)
            StartOldFarm = t
            while StartOldFarm do task.wait()
                if send_All_Pets then
                    function FarmCoin(CoinID, PetID)
                        game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({ [1] = CoinID,
                            [2] = { [1] = PetID } })
                        game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({ [1] = CoinID, [2] = PetID })
                    end

                    function GetMyPets()
                        local returntable = {}
                        for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:
                            GetChildren()) do
                            if v.ClassName == 'TextButton' and v.Equipped.Visible then
                                table.insert(returntable, v.Name)
                            end
                        end
                        return returntable
                    end

                    function GetCoins()
                        local returntable = {}
                        local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
                        for i, v in pairs(ListCoins) do
                            if string.find(string.lower(v.a), string.lower(hwe.Name)) then
                                table.insert(returntable, i)
                            end
                        end
                        return returntable
                    end

                    local cointhiny = GetCoins()
                    local getpet = GetMyPets()
                    for i = 1, #cointhiny do
                        coroutine.wrap(function()
                            FarmCoin(cointhiny[i].index, getpet[1])
                            FarmCoin(cointhiny[i].index, getpet[2])
                            FarmCoin(cointhiny[i].index, getpet[3])
                            FarmCoin(cointhiny[i].index, getpet[4])
                            FarmCoin(cointhiny[i].index, getpet[5])
                            FarmCoin(cointhiny[i].index, getpet[6])
                            FarmCoin(cointhiny[i].index, getpet[7])
                            FarmCoin(cointhiny[i].index, getpet[8])
                            FarmCoin(cointhiny[i].index, getpet[9])
                            FarmCoin(cointhiny[i].index, getpet[10])
                            FarmCoin(cointhiny[i].index, getpet[11])
                            FarmCoin(cointhiny[i].index, getpet[12])
                            FarmCoin(cointhiny[i].index, getpet[13])
                            FarmCoin(cointhiny[i].index, getpet[14])
                            FarmCoin(cointhiny[i].index, getpet[15])
                            FarmCoin(cointhiny[i].index, getpet[16])
                            FarmCoin(cointhiny[i].index, getpet[17])
                            FarmCoin(cointhiny[i].index, getpet[18])
                            FarmCoin(cointhiny[i].index, getpet[19])
                            FarmCoin(cointhiny[i].index, getpet[20])
                            FarmCoin(cointhiny[i].index, getpet[21])
                            FarmCoin(cointhiny[i].index, getpet[22])
                        end)()
                    end
                else
                    pcall(function()
                        function FarmCoin(CoinID, PetID)
                            game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({ [1] = CoinID,
                                [2] = { [1] = PetID } })
                            game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({ [1] = CoinID, [2] = PetID })
                        end

                        function GetMyPets()
                            local returntable = {}
                            for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets
                                :GetChildren()) do
                                if v.ClassName == 'TextButton' and v.Equipped.Visible then
                                    table.insert(returntable, v.Name)
                                end
                            end
                            return returntable
                        end

                        function GetCoins()
                            local returntable = {}
                            local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
                            for i, v in pairs(ListCoins) do
                                if string.find(string.lower(v.a), string.lower(hwe.Name)) then
                                    table.insert(returntable, i)
                                end
                            end
                            return returntable
                        end

                        local cointhiny = GetCoins()
                        local getpet = GetMyPets()
                        for i = 1, #cointhiny do
                            coroutine.wrap(function()
                                pcall(function() FarmCoin(cointhiny[i], getpet[i % #getpet + 1]) end)
                                task.wait(.3)
                            end)()
                        end

                    end)
                end
            end
        end)
    end
end

local listpet = {
    "Basic", "Rare", "Epic", "Legendary", "Mythical", "Exclusive"
}


WebHook:Checklist('List Pet Send', "wlist", listpet, function()

    SettingsTable.wlist = check["wlist"].Value

    return
end, SettingsTable.wlist
)

WebHook:Textbox("Paste Webhook URL", tostring(SettingsTable.wpurlp), function(t)
    SettingsTable.wpurlp = t
end)
WebHook:Textbox("User ID", tostring(SettingsTable.wpuid), function(t)
    SettingsTable.wpuid = t
end)

WebHook:line()

WebHook:Toggle("Start Tracking", SettingsTable.wpstart, function(t)
    SettingsTable.wpstart = t
end)






repeat wait() until game:GetService("Players")
repeat wait() until game:GetService("Players").LocalPlayer
repeat wait() until game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Loading"):
    WaitForChild("Black").BackgroundTransparency == 1
repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")


local IDToName = {}
local PettoRarity = {}
for i, v in pairs(Library.Directory.Pets) do
    IDToName[i] = v.name
    PettoRarity[i] = v.rarity
end

function GetThumbnail(id, type)
    local nailname = (type == 'Normal' or type == 'Rainbow' and 'thumbnail') or (type == 'Gold' and 'goldenThumbnail') or
        (type == 'Dark Matter' and 'darkMatterThumbnail')
    local eeee = Library.Directory.Pets[tostring(id)][nailname] or Library.Directory.Pets[tostring(id)]["thumbnail"]
    local AssetID = eeee:gsub("rbxassetid%:%/%/", "")
    local Link = "https://www.roblox.com/item-thumbnails?params=[{assetId:" .. AssetID .. "}]"
    local Response = game:GetService("HttpService"):JSONDecode(game:HttpGet(Link))
    return Response[1].thumbnailUrl
end

function Send(Name, Nickname, Strength, Rarity, Thumbnail, Formation, Color, NewPowers, nth)
    local Webhook = SettingsTable.wpurlp
    local msg = {
        ["username"] = playername,
        ["Icon"] = "https://cdn.discordapp.com/attachments/703598582154002502/1001963172028219473/download.jpg",
        ["content"] = "<@" .. SettingsTable.wpuid .. ">",
        ["embeds"] = {
            {
                ["color"] = tonumber(tostring("0x" .. Color)), --decimal
                ["title"] = "*" .. Rarity .. "* " .. Name,
                ["thumbnail"] = {
                    ["url"] = Thumbnail
                },
                ["fields"] = {
                    {
                        ["name"] = "Nickname",
                        ["value"] = Nickname,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Formation",
                        ["value"] = Formation,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Strength",
                        ["value"] = Strength,
                        ["inline"] = true
                    },
                },
                ["author"] = {},
                -- ['timestamp'] = os.date("%Y-%m-%dT%X.000Z"),
            }
        }
    }
    for qq, bb in pairs(NewPowers) do
        local thingy = {
            ["name"] = "Enchantment " .. tostring(qq),
            ["value"] = bb,
            ["inline"] = true
        }
        table.insert(msg["embeds"][1]["fields"], thingy)
    end
    request = http_request or request or HttpPost or syn.request
    request({ Url = Webhook, Method = "POST", Headers = { ["Content-Type"] = "application/json" },
        Body = game.HttpService:JSONEncode(msg) })
end

function SendWebhook(uid)
    for i, v in pairs(Library.Save.Get().Pets) do
        if v.uid == uid and table.find(SettingsTable.wlist, PettoRarity[v.id]) then
            local ThingyThingyTempTypeThing = (v.g and 'Gold') or (v.r and 'Rainbow') or (v.dm and 'Dark Matter') or
                'Normal'
            local Formation = (v.g and ':crown: Gold') or (v.r and ':rainbow: Rainbow') or
                (v.dm and ':milky_way: Dark Matter') or ':roll_of_paper: Normal'
            local Thumbnail = GetThumbnail(v.id, ThingyThingyTempTypeThing)
            local Name = IDToName[v.id]
            local Nickname = v.nk
            local nth = v.idt
            local Strength = v.s
            local Powers = v.powers or {}
            local Rarity = PettoRarity[v.id]
            local Color = (Rarity == 'Exclusive' and "e676ff") or (Rarity == 'Mythical' and "ff8c00") or
                (Rarity == 'Legendary' and "ff45f6") or (Rarity == 'Epic' and "ffea47") or
                (Rarity == 'Rare' and "42ff5e") or (Rarity == 'Basic' and "b0b0b0")
            local NewPowers = {}
            for a, b in pairs(Powers) do
                local eeeeeeee = tostring(b[1] .. " " .. b[2])
                table.insert(NewPowers, eeeeeeee)
            end
            Send(Name, Nickname, lamtron(Strength), Rarity, Thumbnail, Formation, Color, NewPowers, nth)
        end
    end
end

if getgenv().Connection then getgenv().Connection:Disconnect() end
getgenv().Connection = game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.ChildAdded:Connect(function(child)
    if SettingsTable.wpstart then
        SendWebhook(child.Name)
    end
end)
