if SAM_LOADED then return end
if not istable(RD_DEFCON_SYSTEM) then return end

local sam, command = sam, sam.command

command.set_category("Atlas Uprising")
command.new("setdefcon")
	:SetPermission("setdefcon", "superadmin")

    :AddArg("number", {optional = false, default = 0})

    :GetRestArgs()
	:Help("Change Defcon Level.")

	:OnExecute(function(ply, defcon)
        RD_DEFCON_CURRENT = defcon

        net.Start("RD_DEFCON_UPDATE")
            net.WriteUInt(defcon, 6)
            net.WriteEntity(ply)
        net.Broadcast()

        hook.Run("RD_DEFCON_SYSTEM:PlayerChangedDefcon", defcon, ply)
        
		if sam.is_command_silent then return end
		sam.player.send_message(nil, "{A} set the defcon to {V}", {
			A = ply, V = defcon
		})
	end)
:End()

print("Loaded Rank Give")