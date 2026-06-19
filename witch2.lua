
function spawn_torches(n)
	--torches = {}
	clear_obj('torch')
	for i = 1, n do
		local t = {
			k = 5,
			x = (flr(rnd(14))+1)*8,
			y = (flr(rnd(14))+1)*8,
			dx = 0,
			dy = 0,
			h=1,
			w=1,
			kind = 'torch'
		}
		if collide(t, 0, 0, '*') then
			i -= 1
		else
			add(objects, t)
		end		 
		
	end
end

function upd_torches()
	if btnp(🅾️) then
		for o in all(objects) do
			if o.kind == 'torch' then
				-- up
				if witch().k == 66 and collide_objonly(o, 0, 1, 'witch') then
					o.k = 6
					
				--down
				elseif witch().k == 68 and collide_objonly(o, 0, -1, 'witch') then
					o.k = 6
					
				--left
				elseif witch().k == 64 and not witch().flip_x and collide_objonly(o, 1, 0, 'witch') then
					o.k = 6
					
				--right
				elseif witch().k == 64 and witch().flip_x and collide_objonly(o, -1, 0, 'witch') then
					o.k = 6
				end
			end
		end
	end

end

function draw_torches()
	for o in all(objects) do
		if o.kind == 'torch' then
			spr(o.k, o.x, o.y)
		end
	end
end
