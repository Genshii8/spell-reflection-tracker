aura_env.reflectableSpells = {}

local addSpell = function(spellID)
    aura_env.reflectableSpells[spellID] = true
end

--- The Eternal Palace ---

addSpell(296673) -- Chain Lightning - Radiance of Azshara

addSpell(300395) -- Fervent Bolt - The Queen's Court

--- Battle of Dazar'alor ---

addSpell(283572) -- Sacred Blade - Champion of the Light
addSpell(284449) -- Reckoning - Champion of the Light
addSpell(283626) -- Divine Burst - Champion of the Light

addSpell(282036) -- Fireball - Jadefire Masters
addSpell(286988) -- Searing Embers - Jadefire Masters

addSpell(289292) -- Bestial Throw - Grong

addSpell(282182) -- Buster Cannon - High Tinker Mekkatorque

--- Uldir ---

addSpell(279669) -- Bacterial Outbreak - Mother
addSpell(279660) -- Endemic Virus - Mother
addSpell(274262) -- Explosive Corruption - G'huun

--- Mechagon ---

addSpell(298669) -- Taze - Trixie & Naeno
addSpell(291878) -- Pulse Blast - King Mechagon

-- Trash --

addSpell(293827) -- Giga-Wallop

--- Reaping ---

addSpell(288693) -- Grave Bolt

--- Atal'Dazar ---

addSpell(250096) -- Wracking Pain - Yazma

-- Trash --

addSpell(253562) -- Wildfire
addSpell(252923) -- Venom Blast

--- King's Rest ---

addSpell(267618) -- Drain Fluids - Mchimba the Embalmer
addSpell(267308) -- Lighting Bolt - Zanazal the Wise

-- Trash --

addSpell(270493) -- Spectral Bolt
addSpell(269973) -- Deathly Chill
addSpell(270923) -- Shadow Bolt

--- Freehold ---

-- Trash --

addSpell(259092) -- Lightning Bolt
addSpell(281420) -- Water Bolt

--- Siege of Boralus ---

-- Trash --

addSpell(272588) -- Rotting Wounds
addSpell(272581) -- Water Spray
addSpell(257063) -- Brackish Bolt
addSpell(272571) -- Choking Waters

--- Temple of Sethraliss ---

addSpell(263318) -- Jolt - Aspix
addSpell(263775) -- Gust - Aspix
addSpell(268061) -- Chain Lightning - Avatar of Sethraliss

-- Trash --

addSpell(272820) -- Shock
addSpell(268013) -- Flame Shock
addSpell(274642) -- Lava Burst
addSpell(268703) -- Lightning Bolt
addSpell(272699) -- Venomous Spit

--- Shrine of the Storm ---

addSpell(265001) -- Sea Blast - Aqu'sirr
addSpell(264560) -- Choking Brine - Aqu'sirr
addSpell(264144) -- Undertow - Aqu'sirr
addSpell(268347) -- Void Bolt - Lord Stormsong

-- Trash --

addSpell(267969) -- Water Blast
addSpell(268233) -- Electrifying Shock
addSpell(268315) -- Lash
addSpell(268177) -- Windblast
addSpell(268273) -- Deep Smash
addSpell(268317) -- Rip Mind
addSpell(265001) -- Sea Blast
addSpell(274703) -- Void Bolt
addSpell(268214) -- Carve Flesh

--- The Motherlode ---

addSpell(259856) -- Chemical Burn - Rixxa Fluxflame
addSpell(260318) -- Alpha Cannon - Mogul Razdunk

-- Trash --

addSpell(262794) -- Energy Lash
addSpell(263202) -- Rock Lance
addSpell(262268) -- Caustic Compound
addSpell(263262) -- Shale Spit
addSpell(263628) -- Charged Claw

--- The Underrot ---

addSpell(260879) -- Blood Bolt - Elder Leaxa

-- Trash --

addSpell(265084) -- Blood Bolt

--- Tol Dagor ---

addSpell(257777) -- Crippling Shiv - Jes Howlis
addSpell(257028) -- Fuselighter - Knight Captain Valyri

-- Trash --

addSpell(258150) -- Salt Blast
addSpell(258869) -- Blaze

--- Waycrest Manor ---

addSpell(260697) -- Bramble Bolt - Sister Briar
addSpell(260696) -- Ruinous Bolt - Sister Malady
addSpell(260698) -- Soul Bolt - Sister Solena
addSpell(268271) -- Wracking Chord - Lord and Lady Waycrest
addSpell(261438) -- Wasting Strike - Lord and Lady Waycrest
addSpell(261440) -- Virulent Pathogen - Lord and Lady Waycrest
addSpell(266225) -- Darkened Lightning - Gorak Tul

-- Trash --

addSpell(273653) -- Shadow Claw
addSpell(265881) -- Decaying Touch
addSpell(264153) -- Spit
addSpell(278444) -- Infest

-- Do not touch anything below this line. --

aura_env.castTable = {}
aura_env.sortCount = 1

aura_env.spairs = function(t)

    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    table.sort(keys, function(a,b)
        return (t[a].endTime == t[b].endTime and t[a].sortCount < t[b].sortCount) or t[a].endTime < t[b].endTime
    end)

    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
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
aura_env.shouldRun = false

local goingToReflect = nil

aura_env.colorReflectedSpell = function()
    
    if aura_env.config.colorReflectedSpell and aura_env.spellReflection.isUp
    and aura_env.spellReflection.expirationTime > aura_env.firstClone.endTime and aura_env.shouldRun then
        
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
        
        LCG.PixelGlow_Start(region.bar,{1,1,0,1},4,0.25,nil,1,nil,nil,false)
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