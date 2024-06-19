move_towards_point(oIkleos.x, oIkleos.y, 4)

var seperation = 60;
with(oEnemy) {
	if (id != other.id) {
		var distance = point_distance(x, y, other.x, other.y);
		if (distance < seperation) {
			var seperationForce = 2;
			var seperationDir = point_direction(other.x, other.y, x, y);
			hspeed += lengthdir_x(seperationForce, seperationDir);
			vspeed += lengthdir_y(seperationForce, seperationDir);
		}
	}
	
	if place_meeting(x, y, oSlash) {
		instance_destroy()	
	}
}