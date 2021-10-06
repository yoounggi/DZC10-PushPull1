event_inherited();
var right = keyboard_check(vk_right);
var left = keyboard_check(vk_left);
var up = keyboard_check(vk_up);
var down = keyboard_check(vk_down);

#region MOVEMENT
	#region HORIZONTAL
		var horizontal_input = keyboard_check(right) - keyboard_check(left);
	
		if(horizontal_input != 0) {
			horizontal_movement = moveSpeed * horizontal_input;
			// animation
			if(horizontal_input > 0) {
				state = PLAYERSTATE.walking_right;
			} else {
				state = PLAYERSTATE.walking_left;
			}
		} else {
			horizontal_movement = 0;
		}
	#endregion
	#region VERTICAL
		var vertical_input = keyboard_check(down) - keyboard_check(up);
		
		if(vertical_input != 0) {
			vertical_movement = moveSpeed * vertical_input;
			// animation
			if(vertical_input > 0) {
				state = PLAYERSTATE.walking_down;
			} else {
				state = PLAYERSTATE.walking_up;
			}
		} else {
			vertical_movement = 0;
		}
	#endregion
	
	// only go to idle if not pressing anything
	if(horizontal_input == 0 && vertical_input == 0) {
		state = PLAYERSTATE.idle;
	}

#endregion


#region COLLISION
	
	scr_collision(objPopup);
	scr_collision(objWall);
	
	#region PUSH OBJECTS
		 var instance = instance_place(x + horizontal_movement,y,objPushPull);
		 if(instance != noone) {
			instance.horizontal_movement = horizontal_movement + sign(horizontal_movement);
		 }
		 
		 instance = instance_place(x,y + vertical_movement,objPushPull);
		 if(instance != noone ) {
			instance.vertical_movement = vertical_movement + sign(vertical_movement);
		 }
		 
		 
	#endregion
	
	#region PULL OBJECT
		if(keyboard_check(key_use)) {
			instance = collision_circle(x,y, interaction_radius, objPushPull,false, true);
			if(instance != noone) {
				instance.horizontal_movement = horizontal_movement;
				instance.vertical_movement = vertical_movement;
			}
		}
	#endregion
	
	scr_collision(objPushPull)

	x += horizontal_movement;
	y += vertical_movement; 
#endregion 


#region ANIMATION STATES
	switch(state) {
		case PLAYERSTATE.idle:
			image_speed = 0;
		break;
		case PLAYERSTATE.walking_up:
			sprite_index = sprOfficeManUp;
			image_speed = 1;
		break;
		case PLAYERSTATE.walking_down:
			sprite_index = sprOfficeManDown;
			image_speed = 1;
		break;
		case PLAYERSTATE.walking_left:
			sprite_index = sprOfficeManLeft;
			image_speed = 1;
			
		break;
		case PLAYERSTATE.walking_right:
			sprite_index = sprOfficeManRight;
			image_speed = 1;
		break;
	}
#endregion
