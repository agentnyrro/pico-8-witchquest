local function has_value (tab, val)
 for index, value in ipairs(tab) do
  if value == val then
			return true
  end
 end

 return false
end

function obj_at(self, x, y, o_kind)
	for o in all(objects) do
		if o.x == x and o.y == y then
			if o_kind == 'diff' and o.kind ~= self.kind then
				return true
			elseif (o_kind == 'same' and o.kind == self.kind) then
				return true
			elseif o.kind == o_kind then
				return true
			elseif o_kind == '*' then
				return true
			end
		end
	end
end

function clear_obj(obj_kind)
	for o in all(objects) do
		if o.kind == obj_kind or (obj_kind == '*' and o.kind != 'witch') then
			del(objects, o)
		end
	end
end


