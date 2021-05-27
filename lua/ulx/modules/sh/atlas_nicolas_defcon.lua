if not istable(RD_DEFCON_SYSTEM) then return end
local CATEGORY_NAME = "Atlas Uprising"
function ulx.setdefcon( calling_ply, defcon )
	RD_DEFCON_CURRENT = defcon

    net.Start("RD_DEFCON_UPDATE")
        net.WriteUInt(defcon, 6)
        net.WriteEntity(ply)
    net.Broadcast()

    hook.Run("RD_DEFCON_SYSTEM:PlayerChangedDefcon", defcon, ply)
end
local setdefcon = ulx.command( CATEGORY_NAME, "ulx setdefcon", ulx.setdefcon, "!setdefcon" )
setdefcon:addParam{ type=ULib.cmds.NumArg, hint = "Ex: 1"}
setdefcon:defaultAccess( ULib.ACCESS_ADMIN )
setdefcon:help( "Set defcon level." )