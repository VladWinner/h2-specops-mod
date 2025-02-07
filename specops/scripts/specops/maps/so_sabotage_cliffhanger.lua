local map = {}

map.premain = function()
    game:visionsetnaked("cliffhanger", 0)
end

map.main = function()
    game:scriptcall("maps/_compass", "setupminimap", "compass_map_cliffhanger")
    setloadout("aa12_silencer_hb", "usp_silencer", "fraggrenade", "flash_grenade", "viewhands_arctic", "american")

    game:precacheshader("overlay_frozen")
    game:precacheitem("c4")
    game:precacheitem("aa12_silencer_hb")
    game:precacheitem("ak47_silencer")

    deletenonspecialops({
        isspawntrigger,
        isspecialspawner,
        isspecialvehicle
    })

    mainhook.invoke(level)

    setcompassdist()
    setplayerpos()
    enableallportalgroups()
    intro()
end

return map
