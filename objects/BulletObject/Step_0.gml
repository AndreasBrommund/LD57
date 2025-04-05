image_angle = direction;
image_yscale = direction > 90 && direction < 270 ? -1 : 1;


if (x < -roomMargin || x > room_width + roomMargin || y < -roomMargin || y > room_height + roomMargin) {
    instance_destroy();
}