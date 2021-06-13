/// @description Move the view

halfViewWidth = camera_get_view_width(view_camera[0]) / 2;
halfViewHeight= camera_get_view_height(view_camera[0]) / 2;
screenX = TileToScreenX(oTether.playerChar.charX, oTether.playerChar.charY);
screenY = TileToScreenY(oTether.playerChar.charX, oTether.playerChar.charY);
camera_set_view_pos(view_camera[0], screenX - halfViewWidth, screenY - halfViewHeight);
