/// @Draws the UI content
// You can write your code in this editor

for (var i = 0; i <slots;i++){
	//draws empty boxes, only works
	var xCor = global.scrWidth/2 + ((-slots/2) + (i+0.5))*100
	draw_sprite(sprInventoryPanel,0,xCor,50);
	//draws items
	if(invContent[i]!=0){
		var sprItem =object_get_sprite ( global.items[invContent[i]]);
		draw_sprite(sprItem,0,xCor,50);
	}
}