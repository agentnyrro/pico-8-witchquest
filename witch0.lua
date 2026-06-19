
function _init()
	left,right,up,down = 0,1,2,3
	
	objects = {}
	
	level = 1
	
	--torches = {}
	
	--info abt levels
	waves = {
		3, 5, 8
	}
	
	local witch = {
		k = 64, --64 --1 --face left
		flip_x = false,
		x = 63, 
		y = 63,
		dx = 0,
		dy = 0,
		speed = 2, 
		w = 2,
		h = 2,
		kind = 'witch'
	}
	
	add(objects, witch)
end

function print_status() 
 print('dx:'..witch().dx,12)
 print('dy:'..witch().dy,0,10,12)
 print('x:'..witch().x,0,20,12)
 print('y:'..witch().y,0,30,12)
end

function move_witch()
	--move x
	if not collide(witch(), witch().dx, 0, 'diff') then
  witch().x = flr(witch().x+witch().dx)
	elseif abs(witch().dx) == witch().speed then
 	witch().dx /= witch().speed
 	move_witch()
 end
 
	--move y
 if not collide(witch(), 0,witch().dy, 'diff') then
   witch().y = flr(witch().y+witch().dy)
 elseif abs(witch().dy) == witch().speed then
 	witch().dy /= witch().speed
 	move_witch()
 end
 
 witch().dx = 0
 witch().dy = 0
end

function draw_witch() 
 spr(witch().k,witch().x,witch().y,
  	witch().w, witch().h, witch().flip_x)
end

function _update()
 -- player movement
	if (btn(left)) then
		witch().dx = -witch().speed
  witch().flip_x = false
  witch().k = 64 --64 --1
 end
  
 if (btn(right)) then
  witch().dx = witch().speed
  witch().flip_x = true
  witch().k = 64 --64 --1
 end
 
 if (btn(up)) then
  witch().dy = -witch().speed
 	witch().flip_x = false
 	witch().k = 66 --66 --2
 end
 
 if (btn(down)) then
	 witch().dy = witch().speed
 	witch().flip_x = false
 	witch().k = 68 --68 --3
 end
		
	-- spawn torches
	if (btnp(❎)) then
	 spawn_torches(5)
	end
	
	upd_torches()
end


function _draw()
  cls(7)
  map()
  --print_status()
  draw_torches()
  move_witch()
  draw_witch()
  camera(flr(witch().x/128)*128,
  							flr(witch().y/128)*128)
end