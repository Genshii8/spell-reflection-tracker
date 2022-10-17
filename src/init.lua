aura_env.reflectableSpells = {}

local addSpell = function(spellID)
    aura_env.reflectableSpells[spellID] = true
end

--- Sepulcher of the First Ones ---

addSpell(361001) -- Wave of Disintegration - Vigilant Guardian
addSpell(360162) -- Split Resolution - Vigilant Guardian

addSpell(359778) -- Ephemera Dust - Skolex, the Insatiable Ravener

addSpell(364030) -- Debilitating Ray - Artificer Xy'mox

addSpell(363607) -- Domination Bolt - Dausegne, the Fallen Oracle
addSpell(361513) -- Obliteration Arc - Dausegne, the Fallen Oracle
addSpell(360959) -- Staggering Barrage - Dausegne, the Fallen Oracle

addSpell(364865) -- Sinful Projection - Prototype Pantheon

addSpell(360006) -- Cloud of Carrion - Lords of Dread

--- Castle Nathria ---

addSpell(334852) -- Petrifying Howl - Huntsman Altimor
addSpell(335114) -- Sinseeker - Huntsman Altimor

addSpell(328885) -- Greater Castigation - Sun King's Salvation

addSpell(331573) -- Unconscionable Guilt - Lady Inerva Darkvein
addSpell(342321) -- Concentrated Anima - Lady Inerva Darkvein
addSpell(342320) -- Lightly Concentrated Anima - Lady Inerva Darkvein

addSpell(330968) -- Throw Food - The Council of Blood
addSpell(346800) -- Waltz of Blood - The Council of Blood
addSpell(346654) -- Drain Essence - The Council of Blood
addSpell(331634) -- Dark Recital - The Council of Blood

addSpell(326005) -- Indignation - Sire Denathrius
addSpell(326994) -- Blood Price - Sire Denathrius
addSpell(326851) -- Blood Price - Sire Denathrius

--- De Other Side ---

addSpell(322736) -- Piercing Barb - Hakkar the Soulflayer
addSpell(323166) -- Corrupted Blood - Hakkar the Soulflayer

addSpell(320008) -- Frostbolt - The Manastorms

addSpell(320230) -- Explosive Contrivance - Dealer Xy'exa
addSpell(323687) -- Arcane Lightning - Dealer Xy'exa

addSpell(325258) -- Master of Death - Mueh'zala
addSpell(327646) -- Soulcrusher - Mueh'zala

-- Trash --

addSpell(332705) -- Smite
addSpell(332707) -- Shadow Word: Pain
addSpell(332605) -- Hex
addSpell(334076) -- Shadowcore
addSpell(332196) -- Discharge
addSpell(328707) -- Scribe
addSpell(333641) -- Reaver
addSpell(332234) -- Essential Oil
addSpell(333711) -- Decript Bite
addSpell(323544) -- Blood Nova

--- Halls of Atonement ---

addSpell(322977) -- Sinlight Visions - Halkias

addSpell(328322) -- Villainous Bolt - Ecehlon

addSpell(323538) -- Bolt of Power - High Adjucator Aleez

addSpell(328791) -- Ritual of Woe - Lord Chamberlain

-- Trash --

addSpell(338003) -- Wicked Bolt
addSpell(325700) -- Collect Sins
addSpell(326829) -- Wicked Bolt

--- Mists of Tirna Scithe ---

addSpell(323057) -- Spirit Bolt - Ingra Maloch

-- Trash --

addSpell(324923) -- Bramble Burst
addSpell(326319) -- Spirit Bolt
addSpell(322767) -- Spirit Bolt
addSpell(322557) -- Soul Split
addSpell(331718) -- Spear Flurry
addSpell(325223) -- Anima Injection
addSpell(325418) -- Volatile Acid
addSpell(322486) -- Overgrowth

--- Plaguefall ---

addSpell(324527) -- Plaguestomp - Globrog

addSpell(329110) -- Slime Injection - Doctor Ickus

-- Trash --

addSpell(328475) -- Enveloping Webbing
addSpell(327995) -- Doom Shroom
addSpell(327552) -- Doom Shroom
addSpell(328002) -- Hurl Spores
addSpell(328180) -- Gripping Infection
addSpell(328094) -- Pestilence Bolt
addSpell(334926) -- Wretched Phlegm
addSpell(320512) -- Corroded Claws

--- Sanguine Depths ---

addSpell(322554) -- Castigate - Executor Tarvold

-- Trash --

addSpell(326712) -- Dark Bolt
addSpell(321249) -- Shadow Claws
addSpell(326827) -- Dread Bindings
addSpell(326837) -- Gloom Burst
addSpell(326952) -- Fiery Cantrip
addSpell(322169) -- Growing Mistrust
addSpell(321038) -- Wrack Soul

--- Spires of Ascension ---

addSpell(324368) -- Attenuated Barrage - Kin-Tara

addSpell(324608) -- Charged Stomp - Oryphrion
addSpell(334053) -- Purifying Blast - Oryphrion

-- Trash --

addSpell(317661) -- Insidious Venom
addSpell(323804) -- Dark Seeker

--- Necrotic Wake ---

addSpell(320637) -- Fetid Gas - Blightbone
addSpell(328146) -- Fetid Gas - Blightbone

addSpell(328667) -- Frostbolt Volley - Amarth, the Harvester

addSpell(320788) -- Frozen Binds - Nalthor the Rimebinder
addSpell(322274) -- Enfeeble - Nalthor the Rimebinder

-- Trash --

addSpell(334748) -- Drain Fluids
addSpell(320462) -- Necrotic Bolt
addSpell(320170) -- Necrotic Bolt
addSpell(320171) -- Necrotic Bolt
addSpell(333479) -- Spew Disease
addSpell(323347) -- Clinging Darkness

--- Theater of Pain ---

addSpell(320120) -- Plague Bolt - An Affront of Challengers
addSpell(320300) -- Necromantic Bolt - An Affront of Challengers

addSpell(319669) -- Spectral Reach - Kul'tharok

addSpell(324079) -- Reaping Scythe - Mordretha, the Endless Empress
addSpell(324589) -- Death Bolt - Mordretha, the Endless Empress
addSpell(323608) -- Dark Devastation - Mordretha, the Endless Empress

-- Trash --

addSpell(330784) -- Necrotic Bolt
addSpell(330703) -- Decaying Filth
addSpell(333299) -- Curse of Desolation
addSpell(330875) -- Spirit Frost
addSpell(330810) -- Bind Soul
addSpell(332550) -- Soul Touch

-- Do not touch anything below this line. --

local header = "======== |T132361:20|t Spell Reflection Tracker |T132361:20|t ========"
aura_env.nameplateWarning = function()
    if C_CVar.GetCVar("nameplateShowEnemies") ~= "1" then
        print(header)
        print("\124cFFFF0000Enemy Nameplates are NOT enabled.\124r")
        print("\124cFFFF0000This WeakAura will not function without Enemy Nameplates enabled.\124r")
        print("This warning can be disabled in Custom Options.")
        print(header)
    end
end
if aura_env.config.nameplateWarning then
    aura_env.nameplateWarning()
end
aura_env.nameplateWarningSent = false

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
