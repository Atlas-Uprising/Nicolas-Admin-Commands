if SAM_LOADED then return end
if not istable(RDV.RANK) then return end

local sam, command = sam, sam.command

command.set_category("Atlas Uprising")
command.new("ranksset")
	:SetPermission("ranksset", "superadmin")

    :AddArg("player", {single_target = true})
    :AddArg("number", {optional = false, default = 1})

    :GetRestArgs()
	:Help("Change a Players Rank.")

	:OnExecute(function(ply, target, rank)
        target = target[1]
        RDV.RANK.SetRank(target, rank, ply)
		if sam.is_command_silent then return end
		sam.player.send_message(nil, "{A} set {V}'s rank to {V_2}.", {
			A = ply, V = target:Nick(), V_2 = level
		})
	end)
:End()