/// @description Camera Data
playerList[0] = objPlayer;
playerList[1] = objPlayer2;

view_enabled = true;

global.scrWidth = 960;
global.scrHeight = 540;
var width = global.scrWidth, height = global.scrHeight , scale = 1;

global.Cameras = undefined;
for(var i = 0; i < array_length_1d(playerList); ++i) {
	view_visible[i] = true;
	
	//Create Camera
	var cameraWidth = width / array_length_1d(playerList);
	global.Cameras[i] = camera_create_view(0, 0, cameraWidth, height, 0, playerList[i], -1, -1, cameraWidth, height);
	view_set_camera(i, global.Cameras[i]);
	
	//Viewport
	view_xport[i] = cameraWidth * i;
	view_wport[i] = cameraWidth;
}

window_set_size(width * scale, height * scale);
surface_resize(application_surface, width * scale, height * scale);