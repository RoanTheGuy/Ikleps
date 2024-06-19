

key_up = keyboard_check(ord("W"))
key_right = keyboard_check(ord("D"))
key_down = keyboard_check(ord("S"))
key_left = keyboard_check(ord("A"))

xspd = (key_right - key_left) * walkspeed;
yspd = (key_down - key_up) * walkspeed;

if key_up { diry = -30 }
if key_right { dirx = 30 }
if key_down { diry = 30 }
if key_left { dirx = -30 }

if gamepad_is_connected(0) {
	gamepad_set_axis_deadzone(0,0.2);

	lhaxis = gamepad_axis_value(0, gp_axislh);

	lvaxis = gamepad_axis_value(0, gp_axislv);
	
	rhaxis = gamepad_axis_value(0, gp_axisrh);

	rvaxis = gamepad_axis_value(0, gp_axisrv);
	
}


if place_meeting(x + xspd, y, oWall) == true {
	xspd = 0;
}
if place_meeting(x, y + yspd, oWall) == true {
	yspd = 0;
}
if gamepad_is_connected(0) {
	direction = point_direction(0, 0, lhaxis, lvaxis);
	if oGame.dash == false {
		speed = point_distance(0 ,0, lhaxis, lvaxis) * walkspeed;	
	}
	else {
		speed = 30
	}
}





x += xspd;
y += yspd;
