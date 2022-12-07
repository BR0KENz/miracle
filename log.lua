

-- cleaned

local function miracle_debug(text)
    print('[MIRACLE] - ' .. text)
end;

miracle_debug('preparing script.')
repeat
    task.wait()
until game:IsLoaded()

_G.ScriptWhenNoMove = function() 
	game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer) -- Rejoin Scripts
end;
-- Config Zone

miracle_debug('preparing config.')

local miracle_cfg = {

    Delay = nil,

    auto_alias = nil,
    auto_description = nil,

    FilterItem = nil,
    Item = nil,

    SheetLink = nil,

    hop_blacklist = nil,
}

if miracle_cfg == nil then
    miracle_error('[MIRACLE] - Invalid config.')
end;

miracle_cfg.Delay = _G.delay

miracle_cfg.auto_alias = _G.auto_alias
miracle_cfg.auto_description = _G.auto_description



miracle_cfg.TimeAFK = 1000 -- Time AFK(Not Move)--_G.TimeAFK
miracle_cfg.FilterItem = true --_G.FilterItem
miracle_cfg.Item = _G.Item
miracle_cfg.Lengened = false --_G.Lengened

miracle_cfg.SheetLink = _G.sheet_link

miracle_cfg.hop_blacklist = _G.hop_blacklist

if miracle_cfg.Delay == nil or miracle_cfg.Item == nil or miracle_cfg.SheetLink == nil or miracle_cfg.hop_blacklist == nil then
    miracle_error('[MIRACLE] - Check your config.')
end;

if not miracle_cfg.Delay then 
	miracle_cfg.Delay = 10 
end;

if type(miracle_cfg.Delay) ~= "number" then
	miracle_cfg.Delay = 10 
end;

miracle_debug('everything done.')

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)


Nexus_Version = 101
loadstring(game:HttpGet"https://raw.githubusercontent.com/ic3w0lf22/Roblox-Account-Manager/master/RBX%20Alt%20Manager/Nexus/Nexus.lua")()
task.spawn(function()
    Nexus:Connect()
end)

local HttpService = game:GetService("HttpService")
local Request = syn.request


repeat
    wait()
until (game.Players.localPlayer.Neutral == false) == true

repeat
    wait()
until (game.Players.localPlayer.Neutral == false) == true

local function len(x)
    local q = 0
    for i, v in pairs(x) do
        q = q + 1
    end
    return q;
end;

function getRartiy(__)
    if __["Rarity"] == 3 and _G.Legendary then
        return __
    else
        return __
    end;
end;

wait(6)
spawn(function()
    while true do
        wait()

        local x, p = pcall(function()
            Nexus:NewLine()
            Nexus:CreateLabel("loginfo", "Miracle - 12/7/2022")
            Nexus:CreateLabel("loginfo", "Sheet-best")
            Nexus:NewLine()
            -- Nexus:CreateTextBox("loginput", "https://sheet.best/api/sheets/xxxxx", {100, 20})
            Nexus:CreateButton("logbtn", "Send", {100, 20})
            Nexus:NewLine()
        end)

        if x then
            break
        end
    end;
end)

function PraseFruit()
	r = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities")
    if r then
        q = len(r)
        w = 0
        for i, v in pairs(r) do
            if v["Awakened"] then
                w = w + 1
            end
        end;
		return " | A : " .. w .. " )"
    else
        return " )"
    end;
end;

Nexus:OnButtonClick("logbtn", function()
    -- url = Nexus:GetText("loginput")
    url = tostring(miracle_cfg.SheetLink)

    miracle_debug('URL: ' .. url)

    local World = ""
    local Money = ""
    local Username = game.Players.LocalPlayer.Name
    local Fragment = ""
    local Level = ""
    local Fruit = ""
    local Material = ""
    local Race = ""
    local World = ""
    local FruitMastery = ""
    local Gun = ""
    local RequestgetInventory
    local HttpService = game:GetService("HttpService")
    local Malee = ""
    local Sword = ""
    local Accesorry = ""
    local Awake = ""
    local Combo = ""
    local ComboFruit = ""

    local function formatNumber(number)
        local i, k, j = tostring(number):match("(%-?%d?)(%d*)(%.?.*)")
        return i .. k:reverse():gsub("(%d%d%d)", "%1,"):reverse() .. j
    end;

    local function notifyCheck(types, ...)
        if types == "Notify" then
            require(game.ReplicatedStorage.Notification).new(...):Display()
        end
    end;

    Money = formatNumber(game:GetService("Players").LocalPlayer.Data.Beli.Value)
    Fragment = formatNumber(game:GetService("Players").LocalPlayer.Data.Fragments.Value)
    Race = game:GetService("Players").LocalPlayer.Data.Race.Value
    -- print(Money)
    Level = formatNumber(game:GetService("Players").LocalPlayer.Data.Level.Value)
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") == 0 and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Zou") == 0 then
        World = "3"
    elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") == 0 and not game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Zou") == 0 then
        World = "2"
    else
        World = "1"
    end;

    RequestgetInventory = game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")
    for i, __ in pairs(RequestgetInventory) do
        if __["Type"] == "Sword" then
            if  __["Rarity"] >= 3  then 
                if Sword == "" then
                    Sword = __["Name"] .. " "
                else
                    Sword = Sword .. __["Name"] .. " "
                end;
            end;
        end;

        if __["Type"] == "Wear" then
            if Accesorry == "" then
                Accesorry = __["Name"] .. " "
            else
                Accesorry = Accesorry .. __["Name"] .. " "
            end;
        end;

        if __["Type"] == "Blox Fruit" then
            if __["Rarity"] >= 3  then
    			if Fruit == "" then
    				Fruit = __["Name"] .. " " -- note fix this if issue
    			else
    				Fruit = Fruit .. __["Name"] .. " "
    			end;
			end;
        end;

        if __["Type"] == "Material" then
            if Material == "" then
                Material = __["Name"] .. " "
            else
                Material = Material .. __["Name"] .. "( x" .. __["Count"] .. " )" .. " "
            end;
        end;

        if __["Type"] == "Gun" then
            if Gun == "" then
                Gun = __["Name"] .. " "
            else
                Gun = Gun .. __["Name"] .. " "
            end;
        end;

    end;
    local args = {
        [1] = "BuyDeathStep",
        [2] = true
    }

    DeathStep = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    HasDeathStep = DeathStep == 1
    wait(0.2)

    local args = {
        [1] = "BuySharkmanKarate",
        [2] = true
    }

    SharkmanKarate = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    HasSharkmanKarate = SharkmanKarate == 1
    wait(0.2)

    local args = {
        [1] = "BuySuperhuman",
        [2] = true
    }

    Superhuman = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    HasSuperhuman = Superhuman == 1
    wait(0.2)

    local args = {
        [1] = "BuyElectricClaw",
        [2] = true
    }

    ElectricClaw = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    HasElectricClaw = ElectricClaw == 1
    local args = {
        [1] = "BuyDragonTalon",
        [2] = true
    }

    DragonTalon = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    if type(DragonTalon) == "number" then
        HasDragonTalon = DragonTalon == 1 
    end;

    local args = {
        [1] = "BuyGodhuman",
        [2] = true
    }

    Godhuman = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    if type(Godhuman) == "number" then
        HasGodhuman = Godhuman == 1
    end;

    if HasGodhuman then
        Malee = Malee .. "God Human"
    end;

    if HasDragonTalon then
        Malee = Malee .. "Dragon Talon "
    end;
    if HasElectricClaw then
        Malee = Malee .. "Electric Claw "
    end;
    if HasSuperhuman then
        Malee = Malee .. "Superhuman "
    end;
    if HasSharkmanKarate then
        Malee = Malee .. "Sharkman Karate "
    end;
    if HasDeathStep then
        Malee = Malee .. "Death Step "
    end;

    local FruitName = ""
    for _i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            if v.ToolTip == "Blox Fruit" then
                FruitMastery = v.Level.Value
                FruitName = v.Name
            end;
        end;
    end;

    r = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities")
    if r then
        for i, v in pairs(r) do
            if v["Awakened"] then
                Awake = Awake .. i .. " "
            end
        end;
    else
        Awake = "None"
    end;

    local lp_items = {
        CDK = false,
        HallowScythe = false,
        DarkDagger = false,
        Tushita = false,
        Yama = false,
        TTKs = false,
        Leopard = false,
        DarkCoat = false,
    }

    RequestgetInventory = game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")
    for i, __ in pairs(RequestgetInventory) do
        if __["Type"] == "Sword" then
            if __["Name"] == "Cursed Dual Katana" then
                lp_items.CDK = true
            end

            if __["Name"] == "Hallow Scythe" then
                lp_items.HallowScythe = true
            end

            if __["Name"] == "Dark Dagger" then
                lp_items.DarkDagger = true
            end

            if __["Name"] == "Tushita" then
                lp_items.Tushita = true
            end

            if __["Name"] == "Yama" then
                lp_items.Yama = true
            end

            if __["Name"] == "True Triple Katana" then
                lp_items.TTKs = true
            end
        end;

        if __["Type"] == "Blox Fruit" then
            if __["Name"] == "Leopard-Leopard" then
                lp_items.Leopard = true
            end
        end;

    end;

    local Type = ""
    -- Combo = Sword .. " " .. Gun .. " " .. Accesorry
        
    if HasDragonTalon and HasElectricClaw and HasSuperhuman and HasSharkmanKarate and HasDeathStep and HasGodhuman then
        SixMalee = true
    end;

    if FruitName == "Dough-Dough" then 
        r = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities")
        if r then
            q = len(r)
            w = 0
            for i, v in pairs(r) do
                if v["Awakened"] then
                    w = w + 1
                end
            end;

            if w == q then 
                Type = "Full Dough"
            elseif w > 0 then
                Type = "DoughAwakening"
            else
                Type = "Dough"
			end

		end;
    end;

    if lp_items.Leopard then 
        Type = Type .. "&Leopard"        
    end;

    if lp_items.SixMalee then 
        Type = Type .. "&GodHuman"    
    end;

    if Gun ~= "" then
        Type = Type .. "&" .. Gun
    end;

    if Accesorry ~= "" then
        Type = Type .. "&" .. Accesorry
    end;

    if lp_items.CDK then 
        Type = Type .. "&CDK"    
    end;

    if lp_items.HallowScythe then 
        Type = Type .. "&HallowScythe"
    end;

    if lp_items.Tushita then 
        Type = Type .. "&Tushita"
    end;

        -- if Yama then 
        --     Type = "ดาบทูชิตะ & ดาบยามะ"    
        -- end;
        
    if lp_items.DarkDagger then 
        Type = Type .. "&DarkDagger"       
    end;

    if lp_items.TTKs then 
        Type = Type .. "&TTK"
    end;

    ComboFruit = FruitName .. '( M : ' .. FruitMastery .. PraseFruit()
    Payload = HttpService:JSONEncode({
        ["Account"] = Username,
        ["Info"] = Type,
        ["Level"] = Level,
        ["Sword"] = Sword,
        ["Fruit Inventory"] = Fruit,
        ["FruitInventory"] = Fruit,
        ["Melee"] = Malee,
        ["Race"] = Race,
        ["World"] = World,
        ["Fruit"] = ComboFruit,
        ["Fragment"] = Fragment,
        ['Money'] = Money
    })

    if syn or syn.request then
        requestWebhook = syn.request({
            ["Url"] = url,
            ["Method"] = "POST",
            ["Body"] = Payload,
            ["Headers"] = {
                ["Content-Type"] = "application/json"
            }
        })
    else
        requestWebhook = syn.request({
            ["Url"] = url,
            ["Method"] = "POST",
            ["Body"] = Payload,
            ["Headers"] = {
                ["Content-Type"] = "application/json"
            }
        })
    end;
end)

local Level = game:GetService("Players").LocalPlayer.Data.Level.Value
local Request = syn.request
local function formatNumber(number)
    local i, k, j = tostring(number):match("(%-?%d?)(%d*)(%.?.*)")
    return i .. k:reverse():gsub("(%d%d%d)", "%1,"):reverse() .. j
end;

spawn(function()
    while wait(miracle_cfg.Delay) do
    local World = ""
    local Money = ""
    local Username = game.Players.LocalPlayer.Name
    local Fragment = ""
    local Level = ""
    local Fruit = ""
    local Material = ""
    local Race = ""
    local World = ""
    local FruitMastery = ""
    local Gun = ""
    local RequestgetInventory
    local HttpService = game:GetService("HttpService")
    local Malee = ""
    local Sword = ""
    local Accesorry = ""
    local Awake = ""
    local Combo = ""
    local Evo = ""

    local function notifyCheck(types, ...)
        if types == "Notify" then
            require(game.ReplicatedStorage.Notification).new(...):Display()
        end
    end;

    Money = formatNumber(game:GetService("Players").LocalPlayer.Data.Beli.Value)
    Fragment = formatNumber(game:GetService("Players").LocalPlayer.Data.Fragments.Value)
    Race = game:GetService("Players").LocalPlayer.Data.Race.Value
    Level = game:GetService("Players").LocalPlayer.Data.Level.Value

    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") == 0 and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Zou") == 0 then
        World = "3"
    elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") == 0 and not game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Zou") and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Zou") ~= 0 then
        World = "2"
    else
        World = "1"
    end;

    RequestgetInventory = game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")
    for i, __ in pairs(RequestgetInventory) do

        if __["Type"] == "Sword" then
            if Sword == "" then
                if miracle_cfg.Item and miracle_cfg.FilterItem then
                    if table.find(miracle_cfg.Item, __["Name"]) then
                        Sword = __["Name"] .. " "
                    end
                else
                    Sword = __["Name"] .. " "
                end;
            else
                if miracle_cfg.Item and miracle_cfg.FilterItem then
                    if table.find(miracle_cfg.Item, __["Name"]) then
                        Sword = Sword .. __["Name"] .. " "
                    end
                else
                    Sword = Sword .. __["Name"] .. " "
                end;
            end;
        end;

        if __["Type"] == "Wear" then
            if Accesorry == "" then
                Accesorry = __["Name"] .. " "
            else
                Accesorry = Accesorry .. __["Name"] .. " "
            end;
        end;

        if __["Type"] == "Blox Fruit" then
            if Fruit == "" then
                if miracle_cfg.Lengened then
                    if __["Rarity"] == 3 then
                        Fruit = __["Name"] .. " "
                    end
                else
                    Fruit = __["Name"] .. " "
                end;
            else
                if miracle_cfg.Lengened then
                    if __["Rarity"] == 3 then
                        Fruit = Fruit .. __["Name"] .. " "
                    end
                else
                    Fruit = Fruit .. __["Name"] .. " "
                end;
            end;
        end;

        if __["Type"] == "Material" then
            if Material == "" then
                Material = __["Name"] .. " "
            else
                Material = Material .. __["Name"] .. "( x" .. __["Count"] .. " )" .. " "
            end;
        end;
        if __["Type"] == "Gun" then
            if Gun == "" then
                Gun = __["Name"] .. " "
            else
                Gun = Gun .. __["Name"] .. " "
            end;
        end;
    end;

    local args = {
        [1] = "BuyDeathStep",
        [2] = true
    }

    DeathStep = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    if DeathStep == 1 then
        HasDeathStep = true
    else
        HasDeathStep = false
    end;
    wait(0.2)

    local args = {
        [1] = "BuySharkmanKarate",
        [2] = true
    }

    SharkmanKarate = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    if SharkmanKarate == 0 then
        HasSharkmanKarate = false
    else
        HasSharkmanKarate = true
    end;
    wait(0.2)

    local args = {
        [1] = "BuySuperhuman",
        [2] = true
    }

    Superhuman = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    if Superhuman == 1 then
        HasSuperhuman = true
    else
        HasSuperhuman = false
    end;
    wait(0.2)

    local args = {
        [1] = "BuyElectricClaw",
        [2] = true
    }

    ElectricClaw = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    if ElectricClaw == 1 then
        HasElectricClaw = true
    else
        HasElectricClaw = false
    end;

    local args = {
        [1] = "BuyDragonTalon",
        [2] = true
    }

    DragonTalon = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    if type(DragonTalon) == "number" then
        if DragonTalon == 1 then
            HasDragonTalon = true
        else
            HasDragonTalon = false
        end;
    end;

    local args = {
        [1] = "BuyGodhuman",
        [2] = true
    }

    local FruitName = ""
    Godhuman = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    if type(Godhuman) == "number" then
        if Godhuman == 1 then
            HasGodhuman = true
        else
            HasGodhuman = false
        end;
    end;

    if HasGodhuman then
        Malee = Malee .. "God Human "
    end;

    if HasDragonTalon then
        Malee = Malee .. "Dragon Talon "
    end;
    if HasElectricClaw then
        Malee = Malee .. "Electric Claw "
    end;
    if HasSuperhuman then
        Malee = Malee .. "Superhuman "
    end;
    if HasSharkmanKarate then
        Malee = Malee .. "Sharkman Karate "
    end;
    if HasDeathStep then
        Malee = Malee .. "Death Step "
    end;

    for _i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            if v.ToolTip == "Blox Fruit" then
                FruitMastery = v.Level.Value
                FruitName = v.Name
            end;
        end;
    end;

    r = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities")
    if r then
        for i, v in pairs(r) do
            if v["Awakened"] then
                Awake = Awake .. i .. " "
            end
        end;
    else
        Awake = "None"
    end;

    if game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
        Evo = "Yes"
    else
        Evo = "No"
    end;

    local Payload = "World {w} Level: {l} Beli: {b} Fragment: {f}\nRace: {r}\nFruit: {fi}\nAwakened Skill: {a}\nEvolved: {re}\nSword: {s}\nFightingStyle: {m}\nFruitInventory: {fn}\nFruit Mastery: {fm}"
    Payload = string.gsub(
        string.gsub(
            string.gsub(
                string.gsub(
                    string.gsub(
                        string.gsub(
                            string.gsub(
                                string.gsub(
                                    string.gsub(
                                        string.gsub(
                                            string.gsub(string.gsub(Payload, "{l}", Level), "{r}", Race),
                                            "{m}",
                                                Malee
                                        ),
                                        "{fi}",
                                        Fruit
                                    ),
                                    "{s}",
                                    Sword
                                ),
                                "{b}",
                                Money
                            ),
                            "{f}",
                            Fragment
                        ),
                        "{a}",
                        Awake
                    ),
                    "{w}",
                    World
                ),
                "{fn}",
                FruitName
            ),
            "{fm}",
            FruitMastery
        ),
        "{re}",
        Evo
    )

    if miracle_cfg.auto_description then

        r = Request({
            Method = "POST",
            Url = "http://localhost:7963/SetDescription?Account=" .. Username,
            Body = Payload
        })
    end;

    end;

end)

spawn(function()
    while wait(miracle_cfg.Delay) do

        local Payload = ""
        local Username = game.Players.LocalPlayer.Name

        local FruitName = ""
        for _i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                if v.ToolTip == "Blox Fruit" then
                    FruitName = v.Name
                end;
            end;
        end;

        if FruitName == "Dough-Dough" then 
            r = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities")
            if r then
                q = len(r)
                w = 0
                for i, v in pairs(r) do
                    if v["Awakened"] then
                        w = w + 1
                    end
                end;
				if w == q then 
                    Payload = Payload .. "Full Dough"
                elseif w > 0 then
                    Payload = Payload .. "DoughAwakening"
                else
                    Payload = Payload .. "Dough"
				end
			end;
        end;

        local args = {
            [1] = "BuyDeathStep",
            [2] = true
        }

        DeathStep = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        if DeathStep == 1 then
            HasDeathStep = true
        else
            HasDeathStep = false
        end;
        wait(0.2)

        local args = {
            [1] = "BuySharkmanKarate",
            [2] = true
        }

        SharkmanKarate = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        if SharkmanKarate == 0 then
            HasSharkmanKarate = false
        else
            HasSharkmanKarate = true
        end;
        wait(0.2)

        local args = {
            [1] = "BuySuperhuman",
            [2] = true
        }

        Superhuman = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        if Superhuman == 1 then
            HasSuperhuman = true
        else
            HasSuperhuman = false
        end;
        wait(0.2)

        local args = {
            [1] = "BuyElectricClaw",
            [2] = true
        }

        ElectricClaw = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        if ElectricClaw == 1 then
            HasElectricClaw = true
        else
            HasElectricClaw = false
        end;

        local args = {
            [1] = "BuyDragonTalon",
            [2] = true
        }

        DragonTalon = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        if type(DragonTalon) == "number" then
            HasDragonTalon = DragonTalon == 1
        end;

        local args = {
            [1] = "BuyGodhuman",
            [2] = true
        }

        Godhuman = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        if type(Godhuman) == "number" then
            HasGodhuman = Godhuman == 1
        end;

        local SixMalee = false
        local CDKs = false
        local HallowScythe = false
        local TTKs = false
        local Gun = ""
        local Accesorry = ""

        if HasDragonTalon and HasElectricClaw and HasSuperhuman and HasSharkmanKarate and HasDeathStep and HasGodhuman then
            SixMalee = true
        end;

        RequestgetInventory = game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")
        for i, __ in pairs(RequestgetInventory) do
            if __["Type"] == "Sword" then
                if __["Name"] == "Cursed Dual Katana" then
                    CDKs = true
                end

                if __["Name"] == "Hallow Scythe" then
                    HallowScythe = true
                end

                if __["Name"] == "True Triple Katana" then
                    TTKs = true
                end

                
            end;

            if __["Type"] == "Wear" then
                if Accesorry == "" then
                    Accesorry = __["Name"] .. " "
                else
                    Accesorry = Accesorry .. __["Name"] .. " "
                end;
            end;

            if __["Type"] == "Gun" then
                if Gun == "" then
                    Gun = __["Name"] .. " "
                else
                    Gun = Gun .. __["Name"] .. " "
                end;
            end;
        end;

        if SixMalee then 
            Payload = Payload .. "&GodHuman"
        end;

        if CDKs then 
            Payload = Payload .. "&CDK"
        end;

        if HallowScythe then 
            Payload = Payload .. "&HallowScythe"
        end;

        if TTKs then 
            Payload = Payload .. "&TTK"
        end;

        if Accesorry ~= "" then
            Payload = Payload .. "&" .. Accesorry
        end;

        if Gun ~= "" then
            Payload = Payload .. "&" .. Gun
        end;

        if miracle_cfg.auto_alias then

            r = Request({
                Method = "POST",
                Url = "http://localhost:7963/SetAlias?Account=" .. Username,
                Body = Payload
            })

        end;

    end;
end)

function getUser()
    if not isfile("BlockUserList.txt") then
        writefile("BlockUserList.txt", "")
    end;
    if isfile("BlockUserList.txt") then
        local r = readfile("BlockUserList.txt")
        local q = {}
        for s in r:gmatch("[^\r\n]+") do
            table.insert(q, s)
        end
        return q;
    end;
end;

spawn(function()
    while true do
        wait(Delay)

        if miracle_cfg.hop_blacklist then
            local Username = game.Players.LocalPlayer.Name
            for i, v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer then
                    q = getUser()
                    for x, e in pairs(q) do
                        if string.find(string.lower(v.Name), string.lower(e)) then

                            Request({
                                Method = "GET",
                                Url = "http://localhost:7963/BlockUser?Account=" .. Username .. "&UserId=" .. v.UserId
                            })
                            wait(2)

                        end;
                    end;
                end;
            end;
        end;

    end;
end)

-- task.spawn(function() 
--     local cu = 0;
--     local mx = miracle_cfg.TimeAFK;
--     local q = nil;
--     local u = 0;
--     spawn(function() 
-- 	    while true do wait(60) 
-- 		    if u == 0 then 
-- 			    pcall(function() 
-- 				    q = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
-- 				    u = u + 1;
-- 			    end)
-- 		    end;

-- 		    if u ~= 0 then 
-- 			    if type(q) ~= "nil" then 
-- 				    if(q.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
-- 					    q = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
-- 					    u = u + 1;
-- 				    end;
-- 				    if(q.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10 then
-- 					    q = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
-- 					    u = 0;
-- 				    end;
-- 			    end;
-- 		        if u >= (mx + 1) then 
-- 				    _G.ScriptWhenNoMove()
-- 			    end
-- 		    end;
-- 	    end;
--     end)
--     -- print('Anti AFK (No Move) Is Load')	
-- end)
