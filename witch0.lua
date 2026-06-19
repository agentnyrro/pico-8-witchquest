pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

left,right,up,down = 0,1,2,3

next_tile_x = 63
next_tile_y = 63
next_tile_sp = mget(63, 63)

witch = {
	k = 64, --64 --1 --face left
	flip_x = false,
	x = 63, 
	y = 63,
	dx = 0,
	dy = 0,
	w = 2,
	h = 2,
	fric = 0.4
}

function print_status() 
 print('dx:'..witch.dx,15)
 print('dy:'..witch.dy,0,10,15)
 print('x:'..witch.x,0,20,15)
 print('y:'..witch.y,0,30,15)
end


-- [[ checks if the area after moving sprite
-- positioned at x, y pixels
-- with w width and h height
-- for dx, dy 
-- has colision
-- ]] 
function is_solid_area(x, y, dx, dy, w, h) 
	x1 = flr((x + dx) / 8) -- left edge
 x2 = flr((x + dx + w * 8 - 1) / 8) -- right edge
 y1 = flr((y + dy) / 8) -- top edge
 y2 = flr((y + dy + h * 8 - 1) / 8) -- bottom edge

 for i=x1, x2 do
  for j=y1, y2 do
   if fget(mget(i, j), 0) then
    return true
   end
  end
 end
 return false
end

function move_witch() 
 if not is_solid_area(witch.x, witch.y, witch.dx, witch.dy, witch.w, witch.h) then
  witch.x += witch.dx
  witch.y += witch.dy
 end
  witch.dx -= witch.fric*witch.dx
  witch.dy -= witch.fric*witch.dy
end

function draw_witch() 
 spr(witch.k,witch.x,witch.y,
  	witch.w, witch.h, witch.flip_x)
end

function _init()
	
end

function _update()
  -- player movement
 
	if (btn(left)) then
		witch.dx += -0.8
  witch.flip_x = false
  witch.k = 64 --64 --1
	end

  if (btn(right)) then
   witch.dx += 0.8
	  witch.flip_x = true
	  witch.k = 64 --64 --1
  end

  if (btn(up)) then
   witch.dy += -0.8
  	witch.flip_x = false
  	witch.k = 66 --66 --2
		end
  
  if (btn(down)) then
		 witch.dy += 0.8
  	witch.flip_x = false
  	witch.k = 68 --68 --3
		end
end


function _draw()
  cls(7)
  map()
  print_status()
  move_witch()
  draw_witch()
end