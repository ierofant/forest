places =
{
    "Место1",
    "Место2",
    "Место3",
    "Место4"
}

function get_coords(pos)
    local y = math.floor(current_position / forest.size);
    local x = current_position - y * forest.size;
    return x, y
end

function combine_position(x, y)
    return y * forest.size + x;
end

forest = room
{
    nam = 'Лес',
    dsc = function() return descriptions[current_position] end,
    way = 
    {
	vroom('Север', 'north'),
	vroom('Юг', 'south'),
	vroom('Запад', 'west'),
	vroom('Восток', 'east')
    },
    size = 10
}

north = room
{
    nam = 'На север',
    enter = function()
	local x, y = get_coords(current_position);
	y = y - 1;
	if y < 0 then y = forest.size - 1; end
	current_position = combine_position(x, y);
	walk('forest');
    end
}

south = room
{
    nam = 'На юг',
    enter = function()
	local x, y = get_coords(current_position);
	y = y + 1;
	if y > forest.size - 1 then y = 0; end
	current_position = combine_position(x, y);
	walk('forest');
    end
}

west = room
{
    nam = 'На запад',
    enter = function()
	local x, y = get_coords(current_position);
	x = x - 1;
	if x < 0 then x = forest.size - 1; end
	current_position = combine_position(x, y);
	walk('forest');
    end
}

east = room
{
    nam = 'На восток',
    enter = function()
	local x, y = get_coords(current_position);
	x = x + 1;
	if x > forest.size - 1 then x = 0; end
	current_position = combine_position(x, y);
	walk('forest');
    end
}
