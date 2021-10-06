scr_collision(objPlayer);
scr_collision(objPlayer2);
scr_collision(objPushPull);
scr_collision(objSolid);
scr_collision(objWall);
scr_collision(objPopup);

x += horizontal_movement;
y += vertical_movement;

// check to see if the player is inside our radius
var collision = noone;

switch(string_lower(collision_type)) {
	case "circle":
		collision = collision_circle(x, y, interaction_radius, objPlayers, false, true)
	break;
	case "rectangle":
		collision = collision_rectangle(x - interaction_radius, y - interaction_radius, x + interaction_radius, y + interaction_radius, objPlayers, false, true);
	break;
}

if(collision == noone) {
	horizontal_movement = 0;
	vertical_movement = 0;
}
