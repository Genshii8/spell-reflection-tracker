--- Event(s) ---

PLAYER_REGEN_DISABLED

--- Custom Trigger ---

function(e)
    if e == "PLAYER_REGEN_DISABLED" then
        if not aura_env.nameplateWarningSent and aura_env.config.nameplateWarning then
            aura_env.nameplateWarning()
            aura_env.nameplateWarningSent = true
        end
    end
    return false
end

--- Custom Untrigger ---

function()
    return true
end
