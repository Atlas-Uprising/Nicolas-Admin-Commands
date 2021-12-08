if not istable(RD_DEFCON_SYSTEM) then return end
local CATEGORY_NAME = "Atlas Uprising"
function ulx.setdefcon( calling_ply, defcon )
	local CFG = RDV.DEFCON.LIST
        local DEFCON_LVL = tonumber(number)

        if !CFG[DEFCON_LVL] then
            local LANG = RDV.DEFCON.GetLanguage("DefconLevelInvalid")

            SendNotification(ply, LANG)

            return ""
        end

        RDV.DEFCON.CURRENT = DEFCON_LVL

        net.Start("RDV.DEFCON.CHANGE")
            net.WriteUInt(DEFCON_LVL, 8)
            net.WriteUInt(ply:EntIndex(), 8)
        net.Broadcast()

        hook.Run("RDV.DEFCON.PlayerChangedDefcon", DEFCON_LVL, ply)
end
local setdefcon = ulx.command( CATEGORY_NAME, "ulx setdefcon", ulx.setdefcon, "!setdefcon" )
setdefcon:addParam{ type=ULib.cmds.NumArg, hint = "Ex: 1"}
setdefcon:defaultAccess( ULib.ACCESS_ADMIN )
setdefcon:help( "Set defcon level." )