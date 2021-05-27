if not istable(RDV.COMPANIONS) then return end
local CATEGORY_NAME = "Atlas Uprising"
function ulx.givepet( calling_ply, target_ply, pet )
	target_ply:PlayerAddPet(PET)
end
local givepet = ulx.command( CATEGORY_NAME, "ulx givepet", ulx.givepet, "!givepet" )
givepet:addParam{ type=ULib.cmds.PlayerArg }
givepet:addParam{ type=ULib.cmds.StringArg, hint = "pet name" }
givepet:defaultAccess( ULib.ACCESS_ADMIN )
givepet:help( "Give target a pet." )