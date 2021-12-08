if SAM_LOADED then return end
if not istable(RDV.LEVELS) then return end
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

local sam, command = sam, sam.command

command.set_category("Atlas Uprising")
command.new("setlevel")
	:SetPermission("setlevel", "superadmin")

    :AddArg("player", {single_target = true})
    :AddArg("number", {optional = false, default = 0})

    :GetRestArgs()
	:Help("Change a Players Level.")

	:OnExecute(function(ply, target, level)
        target = target[1]
        Controller.setlevel(target, level)
		if sam.is_command_silent then return end
		sam.player.send_message(nil, "{A} set {V} to level {V_2}.", {
			A = ply, V = target:Nick(), V_2 = level
		})
	end)
:End()

command.new("addxp")
	:SetPermission("addxp", "superadmin")

    :AddArg("player", {single_target = true})
    :AddArg("number", {optional = false, default = 0})

    :GetRestArgs()
	:Help("Add to a Players Experience.")

	:OnExecute(function(ply, target, exp)
        target = target[1]
        Controller.addxp(target, exp)
		if sam.is_command_silent then return end
		sam.player.send_message(nil, "{A} added {V_2} XP to {V}.", {
			A = ply, V = target:Nick(), V_2 = exp
		})
	end)
:End()

command.new("givepoints")
	:SetPermission("givepoints", "superadmin")

    :AddArg("player", {single_target = true})
    :AddArg("number", {optional = false, default = 0})

    :GetRestArgs()
	:Help("Give skills points to a Player.")

	:OnExecute(function(ply, target, points)
        target = target[1]
        Controller.givepoints(target, points)
		if sam.is_command_silent then return end
		sam.player.send_message(nil, "{A} added {V_2} skills point to {V}.", {
			A = ply, V = target:Nick(), V_2 = points
		})
	end)
:End()

command.new("resetpoints")
	:SetPermission("resetpoints", "superadmin")

    :AddArg("player", {single_target = true})

    :GetRestArgs()
	:Help("Reset a players skill points.")

	:OnExecute(function(ply, target, points)
        target = target[1]
        Controller.resetskills(target)
		if sam.is_command_silent then return end
		sam.player.send_message(nil, "{A} reset {V} skill points.", {
			A = ply, V = target:Nick()
		})
	end)
:End()