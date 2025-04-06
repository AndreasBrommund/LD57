view_width = 1280;
view_height = 720;

if zoom == 1 {
	zoom = 4
}else {
	zoom = 1
}
    
var cam = view_get_camera(0)
camera_set_view_size(cam, view_width * zoom, view_height * zoom);