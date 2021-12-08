if SAM_LOADED then return end
if not istable(RDV.DEFCON) then return end

local sam, command = sam, sam.command

command.set_category("Atlas Uprising")
command.new("setdefcon")
	:SetPermission("setdefcon", "superadmin")

    :AddArg("number", {optional = false, default = 0})

    :GetRestArgs()
	:Help("Change Defcon Level.")

	:OnExecute(function(ply, defcon)
        local CFG = RDV.DEFCON.LIST
        local DEFCON_LVL = tonumber(number)

        if !CFG[DEFCON_LVL] then
            local LANG = RDV.DEFCON.GetLanguage("DefconLevelInvalid")

            SendNotification(ply, LANG)

            return ""
        end

        RDV.DEFCON.CURRENT = DEFCON_LVL

        net.Start("RDV.DEFCON.CHANGE")
            net.WriteUInt(DEFCON_LVL, 8)
            net.WriteUInt(ply:EntIndex(), 8)
        net.Broadcast()

        hook.Run("RDV.DEFCON.PlayerChangedDefcon", DEFCON_LVL, ply)
        
		if sam.is_command_silent then return end
		sam.player.send_message(nil, "{A} set the defcon to {V}", {
			A = ply, V = defcon
		})
	end)
:End()