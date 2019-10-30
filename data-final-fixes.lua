local itemStackSizeMultiplier = settings.startup["Noxys_StackSizeMultiplier-multiplier"].value
local max = math.max

local ignore = {
	["blueprint"]           = true,
	["blueprint-book"]      = true,
	["deconstruction-item"] = true,
	["selection-tool"]      = true,
	["item-with-inventory"] = true,
	["upgrade-item"]        = true,
	["armor"]               = true,
}

for _, dat in pairs(data.raw) do
	for _,item in pairs(dat) do
		if item.stack_size and type(item.stack_size) == "number" then
			if not ignore[item.type] and (item.stackable == nil or item.stackable) then
				item.stack_size = max(1, item.stack_size * itemStackSizeMultiplier)
			end
		end
	end
end

if settings.startup["Noxys_StackSizeMultiplier-tweakbots"].value then
	for _,v in pairs(data.raw["construction-robot"]) do
		v.max_payload_size = max(1, v.max_payload_size * itemStackSizeMultiplier)
	end
end

if settings.startup["Noxys_StackSizeMultiplier-tweaklogibots"].value then
	for _,v in pairs(data.raw["logistic-robot"]) do
		v.max_payload_size = max(1, v.max_payload_size * itemStackSizeMultiplier)
	end
end
