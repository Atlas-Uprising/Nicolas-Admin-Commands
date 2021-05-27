if SAM_LOADED then return end
if not istable(RDV.LEVELS) then return end

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
        RDV.LEVELS.INFO.SetLevel(target, level)
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
        RDV.LEVELS.INFO.AddExperience(target, exp)
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
        RDV.LEVELS.SKILLS.GivePoints(target, points)
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
        RDV.LEVELS.SKILLS.ResetSkills(target)
		if sam.is_command_silent then return end
		sam.player.send_message(nil, "{A} reset {V} skill points.", {
			A = ply, V = target:Nick()
		})
	end)
:End()