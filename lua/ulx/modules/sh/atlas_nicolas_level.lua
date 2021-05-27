if not istable(RDV.LEVELS) then return end
local CATEGORY_NAME = "Atlas Uprising"
function ulx.setlevel( calling_ply, target_ply, level )
    RDV.LEVELS.INFO.SetLevel(target_ply, level)
end
local setlevel = ulx.command( CATEGORY_NAME, "ulx setlevel", ulx.setlevel, "!setlevel" )
setlevel:addParam{ type=ULib.cmds.PlayerArg }
setlevel:addParam{ type=ULib.cmds.NumArg, hint = "level" }
setlevel:defaultAccess( ULib.ACCESS_ADMIN )
setlevel:help( "Set a players level." )

function ulx.addxp( calling_ply, target_ply, exp )
	RDV.LEVELS.INFO.AddExperience(target_ply, exp)
end
local addxp = ulx.command( CATEGORY_NAME, "ulx addxp", ulx.addxp, "!addxp" )
addxp:addParam{ type=ULib.cmds.PlayerArg }
addxp:addParam{ type=ULib.cmds.NumArg, hint = "xp" }
addxp:defaultAccess( ULib.ACCESS_ADMIN )
addxp:help( "Add XP to a player." )

function ulx.givepoints( calling_ply, target_ply, points )
	RDV.LEVELS.SKILLS.GivePoints(target_ply, points)
end
local givepoints = ulx.command( CATEGORY_NAME, "ulx givepoints", ulx.givepoints, "!givepoints" )
givepoints:addParam{ type=ULib.cmds.PlayerArg }
givepoints:addParam{ type=ULib.cmds.NumArg, hint = "skill points" }
givepoints:defaultAccess( ULib.ACCESS_ADMIN )
givepoints:help( "Give a player skill points." )

function ulx.resetpoints( calling_ply, target_ply )
	RDV.LEVELS.SKILLS.ResetSkills(target_ply)
end
local resetpoints = ulx.command( CATEGORY_NAME, "ulx resetpoints", ulx.resetpoints, "!resetpoints" )
resetpoints:addParam{ type=ULib.cmds.PlayerArg }
resetpoints:defaultAccess( ULib.ACCESS_ADMIN )
resetpoints:help( "Set a players level." )