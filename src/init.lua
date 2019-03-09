aura_env.reflectableSpells = {}

local addSpell = function(spellID)
    aura_env.reflectableSpells[spellID] = true
end

--- Battle of Dazar'alor ---

addSpell(283572) -- Sacred Blade - Champion of the Light
addSpell(284449) -- Reckoning - Champion of the Light
addSpell(283626) -- Divine Burst - Champion of the Light

addSpell(282036) -- Fireball - Jadefire Masters
addSpell(286988) -- Searing Embers - Jadefire Masters

addSpell(286646) -- Gigavolt Charge - High Tinker Mekkatorque
addSpell(282182) -- Buster Cannon - High Tinker Mekkatorque

--- Uldir ---

addSpell(279669) -- Bacterial Outbreak - Mother
addSpell(279660) -- Endemic Virus - Mother
addSpell(274262) -- Explosive Corruption - G'huun

--- Atal'Dazar ---

addSpell(250096) -- Wracking Pain - Yazma

--- King's Rest ---

addSpell(267618) -- Drain Fluids - Mchimba the Embalmer
addSpell(267308) -- Lighting Bolt - Zanazal the Wise

--- Temple of Sethraliss ---

addSpell(263318) -- Jolt - Aspix
addSpell(263775) -- Gust - Aspix
addSpell(268061) -- Chain Lightning - Avatar of Sethraliss

--- Shrine of the Storm ---

addSpell(265001) -- Sea Blast - Aqu'sirr
addSpell(264560) -- Choking Brine - Aqu'sirr
addSpell(264144) -- Undertow - Aqu'sirr
addSpell(268347) -- Void Bolt - Lord Stormsong

--- The Motherlode ---

addSpell(259856) -- Chemical Burn - Rixxa Fluxflame
addSpell(260318) -- Alpha Cannon - Mogul Razdunk

--- The Underrot ---

addSpell(260879) -- Blood Bolt - Elder Leaxa

--- Tol Dagor ---

addSpell(257777) -- Crippling Shiv - Jes Howlis
addSpell(257033) -- Fuselighter - Knight Captain Valyri

--- Waycrest Manor ---

addSpell(260701) -- Bramble Bolt - Sister Briar
addSpell(260700) -- Ruinous Bolt - Sister Malady
addSpell(260699) -- Soul Bolt - Sister Solena
addSpell(268271) -- Wracking Chord - Lord and Lady Waycrest
addSpell(261438) -- Wasting Strike - Lord and Lady Waycrest
addSpell(261440) -- Virulent Pathogen - Lord and Lady Waycrest
addSpell(266225) -- Darkened Lightning - Gorak Tul

-- Do not touch anything below this line. --

aura_env.castTable = {}
aura_env.orderCount = 1

aura_env.orderCasts = function(tbl)
    
    local orderedCasts = {}
    
    for k, v in pairs(tbl) do
        
        if v ~= nil then
            table.insert(orderedCasts, {k, v})
        end
    end
    
    table.sort(orderedCasts, function(a, b)
            return (a[2].endTime == b[2].endTime) and (a[2].order < b[2].order) or (a[2].endTime < b[2].endTime)
    end)
    
    return orderedCasts
end

aura_env.getBuffInfo = function(spellID)
    
    local _, _, _, _, buffDuration, buffExpirationTime, _, _, _, buffSpellID = WA_GetUnitBuff("player", spellID)
    
    -- build info table
    local infoTable = {
        isUp = buffSpellID == spellID,
        duration = not buffDuration and 0 or buffDuration,
        expirationTime = not buffExpirationTime and 0 or buffExpirationTime
    }
    
    return infoTable
end

aura_env.firstClone = {}
aura_env.spellReflection = aura_env.getBuffInfo(23920)
aura_env.dontRun = true

local goingToReflect = nil

aura_env.colorReflectedSpell = function()
    
    if aura_env.config.colorReflectedSpell and aura_env.spellReflection.isUp
    and aura_env.spellReflection.expirationTime > aura_env.firstClone.endTime and not aura_env.dontRun then
        
        local region = WeakAuras.GetRegion(aura_env.id, aura_env.firstClone.key)
        region.bar.fg:SetVertexColor(aura_env.config.reflectedSpellBarColor[1],aura_env.config.reflectedSpellBarColor[2],
            aura_env.config.reflectedSpellBarColor[3],aura_env.config.reflectedSpellBarColor[4])
        
        goingToReflect = aura_env.firstClone.key
    end
end

local LCG = LibStub("LibCustomGlow-1.0")
local previousHighlightCast = nil

aura_env.highlight = function()
    
    local region = WeakAuras.GetRegion(aura_env.id, aura_env.highlightCast)
    
    if previousHighlightCast ~= aura_env.highlightCast then
        
        if previousHighlightCast then
            local previousRegion = WeakAuras.GetRegion(aura_env.id, previousHighlightCast)
            LCG.PixelGlow_Stop(previousRegion.bar)
        end
        
        LCG.PixelGlow_Start(region.bar,{1,1,0,1},4,0.25,_,1,_,_,false)
        previousHighlightCast = aura_env.highlightCast
    end
    
    if goingToReflect then
        local gtrRegion = WeakAuras.GetRegion(aura_env.id, goingToReflect)
        LCG.PixelGlow_Stop(gtrRegion.bar)
    end
    goingToReflect = false
end

aura_env.strStartsWith = function(str, start)
    return string.sub(str,1,string.len(start)) == start
end

