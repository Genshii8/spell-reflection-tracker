--- Event(s) ---

UNIT_SPELLCAST_START,UNIT_SPELLCAST_SUCCEEDED,UNIT_SPELLCAST_STOP,UNIT_SPELLCAST_DELAYED,COMBAT_LOG_EVENT_UNFILTERED

--- Custom Trigger ---

function(allstates, e, unit, castID, spellID)
    
    local refreshColorReflectedSpell = false

    local clearCast = function(localCastID)
        
        if aura_env.castTable[localCastID] then
            aura_env.castTable[localCastID] = nil
            allstates[localCastID].show = false
        end
    end

    -- only evaluate for nameplate units
    if unit then
        if not aura_env.strStartsWith(unit, "nameplate") then
            unit = nil
        end
    end

    if e == "UNIT_SPELLCAST_START" and unit then
        
        if aura_env.reflectableSpells[spellID] then
            
            if UnitIsUnit(unit.."target", "player") and UnitIsEnemy("player", unit) then
                
                local name,_,icon,startTime,endTime = UnitCastingInfo(unit)
                
                aura_env.castTable[castID] = {
                    name = name,
                    icon = icon,
                    startTime = startTime/1000,
                    endTime = endTime/1000,
                    sortCount = aura_env.sortCount
                }

                aura_env.sortCount = aura_env.sortCount + 1
                refreshColorReflectedSpell = true
            end
        end
    end

    if e == "UNIT_SPELLCAST_SUCCEEDED" then
        
        if castID == aura_env.firstClone.key then
            aura_env.dontRun = true
        end
        
        clearCast(castID)
        
    elseif e == "UNIT_SPELLCAST_STOP" then
        
        clearCast(castID)
        
        refreshColorReflectedSpell = true
    end
    
    if e == "UNIT_SPELLCAST_DELAYED" then
        
        if aura_env.castTable[castID] then
            
            local _,_,_,startTime,endTime = UnitCastingInfo(unit)
            
            aura_env.castTable[castID].startTime = startTime/1000
            aura_env.castTable[castID].endTime = endTime/1000
        end

        refreshColorReflectedSpell = true
    end
    
    if e == "COMBAT_LOG_EVENT_UNFILTERED" then
        
        local _,subevent,_,sourceGUID,_,_,_,destGUID,
        _,_,_,subSpellID = CombatLogGetCurrentEventInfo()
        
        local selfSpellReflection = sourceGUID == UnitGUID("player")
        and destGUID == UnitGUID("player") and subSpellID == 23920
        
        if subevent == "SPELL_AURA_APPLIED" and selfSpellReflection then
            
            aura_env.spellReflection = aura_env.getBuffInfo(23920)
            refreshColorReflectedSpell = true
            aura_env.dontRun = false
            
        elseif subevent == "SPELL_AURA_REMOVED" and selfSpellReflection then
            
            aura_env.spellReflection = aura_env.getBuffInfo(23920)
            aura_env.dontRun = false
        end
    end
    
    local castTableNotEmpty = false
    for k, v in pairs(aura_env.castTable) do
        
        if v then
            if GetTime() >= v.endTime then
                v = nil
                clearCast(k)
            end
        end
        
        if v ~= nil then
            
            castTableNotEmpty = true
        end
    end

    if castTableNotEmpty then
        
        local startTime, duration = GetSpellCooldown(23920)
        local spellReflectionStart = startTime + duration
        local nextReflectableCastFound = false
        local firstCloneSet = false

        local i = 0
        for k, v in aura_env.spairs(aura_env.castTable) do
            
            i = i + 1

            if i <= aura_env.config.maxBars then

                allstates[k] = {
                    show = true,
                    changed = true,
                    progressType = "timed",
                    duration = v.endTime - v.startTime,
                    expirationTime = v.endTime,
                    name = v.name,
                    icon = v.icon,
                    index = i,
                    stacks = i
                }

            end
            
            if not nextReflectableCastFound then
                
                if spellReflectionStart < (v.endTime - 0.25) then
                    aura_env.highlightCast = k
                end
                nextReflectableCastFound = true
            end

            if not firstCloneSet then
                aura_env.firstClone.key = k
                aura_env.firstClone.endTime = v.endTime
                firstCloneSet = true
            end
        end
        
        aura_env.highlight()
        
        if refreshColorReflectedSpell then
            aura_env.colorReflectedSpell()
            refreshColorReflectedSpell = false
        end
    else
        aura_env.sortCount = 1
    end
    return true
end