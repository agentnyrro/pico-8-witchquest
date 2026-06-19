local function has_value (tab, val)
 for index, value in ipairs(tab) do
  if value == val then
			return true
  end
 end

 return false
end

function torch_at(x,y)
	for t in all(torches) do
		if t.x == x and t.y == y then
			return true
		end
	end
	
	return false
end

function spawn_torches(n)
	torches = {}
	for i = 1, n do
		local t = {
			k = 5,
			x = (flr(rnd(14))+1)*8,
			y = (flr(rnd(14))+1)*8
		}
		if has_value(torches, t) then
			i -= 1
		else
			
			add(torches, t)
		end		 
		
	end
end

function draw_torches()
	for torch in all(torches) do
		spr(torch.k, torch.x, torch.y)
	end
end

