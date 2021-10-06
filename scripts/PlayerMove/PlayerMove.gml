/// @description Move the player around
/// @arg Right The movement for the right
/// @arg Up the movement for up
/// @arg Left The movement for the left
/// @arg Down the movement for down
function PlayerMove(argument0, argument1, argument2, argument3) {

	var right = argument0;
	var up = argument1;
	var left = argument2;
	var down = argument3;

	if(keyboard_check(left)) 
		x -= 5;
	if(keyboard_check(right)) 
		x += 5;
	if(keyboard_check(up))
		y -= 5;
	if(keyboard_check(down))
		y += 5;


}
