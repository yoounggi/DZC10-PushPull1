if(!has_been_interacted) {
	if((collision_circle(x, y, radius, objPlayer,false,true)||collision_circle(x, y, radius, objPlayer2,false,true))) {
		popup_id.visible=true
	} else { 
		popup_id.visible = false;
	}
}  