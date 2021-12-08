local Controller = {}
if istable(RDV.LEVELS) then
	-- Old Version
	Controller = {
		setlevel = function(client, level)
			RDV.LEVELS.INFO.SetLevel(client, level)
		end,
		addxp = function(client, xp)
			RDV.LEVELS.INFO.AddExperience(client, xp)
		end,
		givepoints = function(client, points)
			RDV.LEVELS.SKILLS.GivePoints(client, points)
		end,
		resetskills = function(client)
			RDV.LEVELS.SKILLS.ResetSkills(client)
		end,
	}
elseif istable(RDV.SAL) then
	-- New Version
	Controller = {
		setlevel = function(client, level)
			RDV.SAL.SetLevel(client, level)
		end,
		addxp = function(client, xp)
			RDV.SAL.AddExperience(client, xp)
		end,
		givepoints = function(client, points)
			RDV.SAL.GivePoints(client, points)
		end,
		resetskills = function(client)
			RDV.SAL.ResetSkills(client)
		end,
	}
else
	return
end
local CATEGORY_NAME = "Atlas Uprising"
function ulx.setlevel( calling_ply, target_ply, level )
    Controller.setlevel(target_ply, level)
end
local setlevel = ulx.command( CATEGORY_NAME, "ulx setlevel", ulx.setlevel, "!setlevel" )
setlevel:addParam{ type=ULib.cmds.PlayerArg }
setlevel:addParam{ type=ULib.cmds.NumArg, hint = "level" }
setlevel:defaultAccess( ULib.ACCESS_ADMIN )
setlevel:help( "Set a players level." )

function ulx.addxp( calling_ply, target_ply, exp )
	Controller.addxp(target_ply, exp)
end
local addxp = ulx.command( CATEGORY_NAME, "ulx addxp", ulx.addxp, "!addxp" )
addxp:addParam{ type=ULib.cmds.PlayerArg }
addxp:addParam{ type=ULib.cmds.NumArg, hint = "xp" }
addxp:defaultAccess( ULib.ACCESS_ADMIN )
addxp:help( "Add XP to a player." )

function ulx.givepoints( calling_ply, target_ply, points )
	Controller.givepoints(target_ply, points)
end
local givepoints = ulx.command( CATEGORY_NAME, "ulx givepoints", ulx.givepoints, "!givepoints" )
givepoints:addParam{ type=ULib.cmds.PlayerArg }
givepoints:addParam{ type=ULib.cmds.NumArg, hint = "skill points" }
givepoints:defaultAccess( ULib.ACCESS_ADMIN )
givepoints:help( "Give a player skill points." )

function ulx.resetpoints( calling_ply, target_ply )
	Controller.resetskills(target_ply)
end
local resetpoints = ulx.command( CATEGORY_NAME, "ulx resetpoints", ulx.resetpoints, "!resetpoints" )
resetpoints:addParam{ type=ULib.cmds.PlayerArg }
resetpoints:defaultAccess( ULib.ACCESS_ADMIN )
resetpoints:help( "Reset a players skills." )