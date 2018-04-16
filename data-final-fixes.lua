local itemStackSizeMultiplier = settings.startup["Noxys_StackSizeMultiplier-multiplier"].value

local ignore = {
	["blueprint"]           = true,
	["blueprint-book"]      = true,
	["deconstruction-item"] = true,
	["selection-tool"]      = true,
	["item-with-inventory"] = true,
	["armor"]               = true,
}

for _, dat in pairs(data.raw) do
	for _,item in pairs(dat) do
		if item.stack_size and type(item.stack_size) == "number" then
			if not ignore[item.type] then
				item.stack_size = item.stack_size * itemStackSizeMultiplier
			end
		end
	end
end

local tweakbots = settings.startup["Noxys_StackSizeMultiplier-tweakbots"].value
if tweakbots then
	for _,v in pairs(data.raw["construction-robot"]) do
		v.max_payload_size = v.max_payload_size * itemStackSizeMultiplier
	end
end
