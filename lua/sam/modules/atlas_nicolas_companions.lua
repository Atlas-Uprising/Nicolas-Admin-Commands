if SAM_LOADED then return end
if not istable(RDV.COMPANIONS) then return end

local sam, command = sam, sam.command

command.set_category("Atlas Uprising")
command.new("givepet")
	:SetPermission("givepet", "superadmin")

    :AddArg("player", {single_target = true})
    :AddArg("text", {optional = false, check = function(input, ply)
			if not RDV.COMPANIONS.GetCompanion(PET) then
				return false
			end
		end,
	})

    :GetRestArgs()
	:Help("Give a pet to a player.")

	:OnExecute(function(ply, target, pet)
        target = target[1]
        target:PlayerAddPet(PET)
		if sam.is_command_silent then return end
		sam.player.send_message(nil, "{A} gave {V} a {V_2}.", {
			A = ply, V = target:Nick(), V_2 = pet
		})
	end)
:End()
print("Loaded Pet Give")