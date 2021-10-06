
function scr_collision (argument0){
	var obj = argument0;
	
	if(place_meeting(x + horizontal_movement, y, obj)) {
		while(!place_meeting(x + sign(horizontal_movement),y,obj)) {
			x+= sign(horizontal_movement);
		}
		horizontal_movement = 0;
	}

	if(place_meeting(x, y+ vertical_movement, obj)) {
		while(!place_meeting(x,y + sign(vertical_movement),obj)) {
			y += sign(vertical_movement);
		}
		vertical_movement = 0;
	}
}