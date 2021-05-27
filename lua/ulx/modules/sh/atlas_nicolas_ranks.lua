if not istable(RDV.RANK) then return end
local CATEGORY_NAME = "Atlas Uprising"
function ulx.rankset( calling_ply, target_ply, rank)
	RDV.RANK.SetRank(target_ply, rank, calling_ply)
end
local rankset = ulx.command( CATEGORY_NAME, "ulx rankset", ulx.rankset, "!rankset" )
rankset:addParam{ type=ULib.cmds.PlayerArg }
rankset:addParam{ type=ULib.cmds.NumArg, hint = "rank number" }
rankset:defaultAccess( ULib.ACCESS_ADMIN )
rankset:help( "Set a players level." )