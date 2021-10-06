event_inherited();
var right1 = keyboard_check(ord("D"));
var left1 = keyboard_check(ord("A"));
var up1 = keyboard_check(ord("W"));
var down1 = keyboard_check(ord("S"));

#region MOVEMENT
	#region HORIZONTAL
		var horizontal_input = keyboard_check(right1) - keyboard_check(left1);
	
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
		var vertical_input = keyboard_check(down1) - keyboard_check(up1);
		
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
		if(keyboard_check(ord("T"))) {
		
			var instance = instance_place(x + horizontal_movement,y,objPushPull);
			if(instance != noone) {
				instance.horizontal_movement = horizontal_movement + sign(horizontal_movement);
			}
		 
			instance = instance_place(x,y + vertical_movement,objPushPull);
			if(instance != noone ) {
				instance.vertical_movement = vertical_movement + sign(vertical_movement);
			 }
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
	
	scr_collision(objPushPull);

	x += horizontal_movement;
	y += vertical_movement; 
#endregion 


#region ANIMATION STATES
	switch(state) {
		case PLAYERSTATE.idle:
			image_speed = 0;
		break;
		case PLAYERSTATE.walking_up:
			sprite_index = sprKnightUp;
			image_speed = 1;
		break;
		case PLAYERSTATE.walking_down:
			sprite_index = sprKnightDown;
			image_speed = 1;
		break;
		case PLAYERSTATE.walking_left:
			sprite_index = sprKnightLeft;
			image_speed = 1;
		break;
		case PLAYERSTATE.walking_right:
			sprite_index = sprKnightRight;
			image_speed = 1;	
		break;
	}
#endregion
