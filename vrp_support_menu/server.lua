-----------------------------------------------------------
--[[### vrp_support_menu ### Script by Cuza]]--
-----------------------------------------------------------

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_support_menu")

local function support_menu(player, choice)
	vRP.buildMenu({"Suppport", {player = player}, function(menu)
		
		menu.name = "Suppport"
		menu.css={top="75px",header_color="rgba(255,233,0,0.75)"}
		menu.onclose = function(player) vRP.openMainMenu({player}) end
		local user_id = vRP.getUserId({player})

		menu["Discord"] = {Support , "<font color = 'red'>Server Discord</font>"}

		menu["Owner"] = {Support , "<font color = 'red'>Owner</font>"}

		vRP.openMenu({player,menu})

	end})
end


vRP.registerMenuBuilder({"main", function(add, data)
	local user_id = vRP.getUserId({data.player})
	if user_id ~= nil then
		local choices = {}
			choices["Support"] = {support_menu, "Support Menu"}
		add(choices)
	end
end})