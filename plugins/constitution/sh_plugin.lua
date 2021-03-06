PLUGIN.name = "Constitution "
PLUGIN.author = "Zadkiel"
PLUGIN.desc = "Adds a toughness attribute."

if (SERVER) then
	function PLUGIN:EntityTakeDamage(client, dmg)

		if (client:IsPlayer()) then
		
			if (dmg:IsDamageType(DMG_FALL)) then 
				return
			end
		
			if (IsValid(client)) then
				client:getChar():updateAttrib("con", 0.001)
			end
		end		
	end

	function PLUGIN:PostPlayerLoadout(client)
		timer.Simple(1, function()
			client:SetMaxHealth(client:GetMaxHealth() + (client:getChar():getAttrib("con", 0) * 2.5) )
			client:SetHealth(client:Health() + (client:getChar():getAttrib("con", 0) * 2.5) )
		end)
	end
end
