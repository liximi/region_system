local memory_before = collectgarbage("count")
local RegionSytem = require "region_system2"

RegionSytem:Generation(64, 64, 16, 16)


local walls = {}
local doors = {}
for i = 1, 20 do
	table.insert(walls, {9, i})
end
for i = 1, 20 do
	table.insert(walls, {12, i})
end
for i = 1, 10 do
	table.insert(walls, {i, 21})
end
for i = 13, 22 do
	table.insert(walls, {i, 21})
end
for i = 1, 13 do
	table.insert(walls, {i, 15})
end
table.insert(doors, {11, 21})
table.insert(doors, {12, 21})

RegionSytem:AddWalls(walls)
RegionSytem:AddDoors(doors)



RegionSytem:Print(REGION_SYS_TILE_KEYS.REGION)

-- local region_id = RegionSytem:GetRegionId(11, 19)
-- local edges = RegionSytem:GetRegionPassableEdges(region_id)
-- if edges then
-- 	for region, _edges in pairs(edges) do
-- 		for i, edge_code in ipairs(_edges) do
-- 			local edge = RegionSytem:DeCodeEdge(edge_code)
-- 			print(region_id, "->", region, ":", edge_code, ":", edge.x, edge.y, RegionSytem.DIR_REVERSE[edge.dir], edge.length)
-- 		end
-- 	end
-- end

-- print("----------")
-- for region_id, data in pairs(RegionSytem.regions) do
-- 	print(string.format("region: %d, room: %d", region_id, data.room))
-- end

print("----------")
-- for room_id, data in pairs(RegionSytem.rooms) do
-- 	print(string.format("room: %d, regions: %s", room_id, table.concat(data.regions, ",")))
-- end

local memory_after = collectgarbage("count")
local memory_used = memory_after - memory_before
print(string.format("Memory Delta: %.4f Mb", memory_used/1024))