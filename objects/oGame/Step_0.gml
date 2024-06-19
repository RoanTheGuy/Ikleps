if keyboard_check_pressed(ord("R")) { game_restart() }


if gamepad_is_connected(0) {
	if instance_exists(oWeapon) {
		oWeapon.x = oIkleos.x
		oWeapon.y = oIkleos.y
		oWeapon.image_angle = point_direction(0, 0, oIkleos.rhaxis, oIkleos.rvaxis);

	
		if oWeapon.image_angle > 90 and oWeapon.image_angle < 270 {
			oWeapon.image_yscale = -1 * weaponsizey
		}
		else {
			oWeapon.image_yscale = 1 * weaponsizey
		}
	}
	
}
else {
	if instance_exists(oWeapon) {
		oWeapon.x = oIkleos.x
		oWeapon.y = oIkleos.y
		oWeapon.image_angle = point_direction(oWeapon.x, oWeapon.y, mouse_x, mouse_y)
	
		if oWeapon.image_angle > 90 and oWeapon.image_angle < 270 {
			oWeapon.image_yscale = -1 * weaponsizey
		}
		else {
			oWeapon.image_yscale = 1 * weaponsizey 
		}
	}	
}



//////////////////////////////// WEAPON SWITCHING

if keyboard_check_pressed(ord("E")) { 
	if weapon == 0 { weapon = 1 }
	else if weapon == 1 { weapon = 0 }
	oWeapon.image_alpha = 1
}







//////////////////////////////// SWORD
if weapon == 0 {
	oWeapon.sprite_index = sWeaponSword
	oWeapon.image_xscale = 1
	weaponsizey = 1

	if mouse_check_button_pressed(mb_left) and slash_active == false {
		instance_create_layer(oIkleos.x, oIkleos.y, "Projectiles", oSlash)
		oSlash.image_angle = point_direction(oSlash.x, oSlash.y, mouse_x, mouse_y)
		alarm[2] = (5 / 12) * 60 / 2
		audio_play_sound(Slash, 0, false)
		slash_active = true
	}
	if gamepad_is_connected(0) {
		if gamepad_button_check_pressed(0, gp_shoulderrb) and slash_active == false {
			instance_create_layer(oIkleos.x, oIkleos.y, "Projectiles", oSlash)
			oSlash.image_angle = point_direction(0, 0, oIkleos.rhaxis, oIkleos.rvaxis);
			alarm[2] = (5 / 12) * 60 / 2
			slash_active = true
		}
	}

	if slash_active == true and instance_exists(oSlash){
		oSlash.x = oIkleos.x
		oSlash.y = oIkleos.y	
		oWeapon.image_alpha = 0
		oIkleos.walkspeed = 6 //slowdown on slash
	}
	else {
		oIkleos.walkspeed = 8
		oWeapon.image_alpha = 1
	}	



	if instance_exists(oSlash) and boss_immunity == false {
		with oSlash {
			if place_meeting(x, y, oIkleps) {
				oGame.boss_hp = oGame.boss_hp - 1
				oGame.boss_immunity = true
				oGame.alarm[3] = 12
				oIkleps.image_blend = #FF8888
				part_particles_create(global.p_sys, oIkleps.x, oIkleps.y, 0, 5)
			
			}	
		}
	}
}

////////////////////////////// BOW

if weapon == 1 {
	oWeapon.sprite_index = sWeaponBow
	oWeapon.image_xscale = 1.5
	weaponsizey = 1.5
	
	if mouse_check_button_pressed(mb_left) and slash_active == false {
		temparrow = instance_create_layer(oIkleos.x, oIkleos.y, "Projectiles", oArrow)
		temparrow.image_angle = point_direction(temparrow.x, temparrow.y, mouse_x, mouse_y)
		temparrow.direction = temparrow.image_angle
		temparrow.speed = 15
		alarm[2] = (5 / 12) * 60 / 2
		slash_active = true
	}

	if instance_exists(oArrow) and boss_immunity == false {
		with oArrow {
			if place_meeting(x, y, oIkleps) {
				oGame.boss_hp = oGame.boss_hp - 1
				oGame.boss_immunity = true
				oGame.alarm[3] = 12
				oIkleps.image_blend = #FF8888
				part_particles_create(global.p_sys, oIkleps.x, oIkleps.y, 0, 5)
				instance_destroy()
			}
		}
	}
	
}
/////////// DASH
key_dash = keyboard_check_pressed(vk_shift) or keyboard_check_pressed(ord("F")) or keyboard_check_pressed(vk_space)
if key_dash and dash_amount != 0 {
	if keyboard_check(ord("D")) { ////////// D+S+Dash not working
		if keyboard_check(ord("S")) {
			oIkleos.direction = 315
		}
		else {
			oIkleos.direction = 0
		}
	}
	else if keyboard_check(ord("S")) {
		if keyboard_check(ord("A")) {
			oIkleos.direction = 225
		}
		else {
			oIkleos.direction = 270
		}
	}
	else if keyboard_check(ord("A")) {
		if keyboard_check(ord("W")) {
			oIkleos.direction = 135
		}
		else {
			oIkleos.direction = 180
		}
	}
	else if keyboard_check(ord("W")) {
		if keyboard_check(ord("D")) {
			oIkleos.direction = 45
		}
		else {
			oIkleos.direction = 90
		}
	}
	audio_play_sound(Dash, 0, false)
	dash_amount -= 1
	dash = true
	alarm[4] = 10
	
}

if dash_amount < 3 and dashcd = false{
	alarm[5] = 60	
	dashcd = true
}

if dash == true {
	immunity = true	
	with oIkleos {
		if !place_meeting(x + dirx, y + diry, oWall) {
			speed = 20
		}
		else {
			speed = 0	
		}
	}
}
else if hit_state == false {
	immunity = false	
}




if gamepad_is_connected(0) {
	if gamepad_button_check_pressed(0, gp_shoulderlb) and dash_amount != 0 {
		dash_amount -= 1
		dash = true
		alarm[4] = 10
	}
}
//////////////

with oIkleos {
	if instance_exists(oIkleps) {
		if place_meeting(x, y, oIkleps) and oIkleps.image_alpha = 1 {
			if oGame.immunity == false {
				oGame.hp = oGame.hp - oGame.boss_damage
				oGame.alarm[6] = 30
				oGame.hit_state = true
				oGame.immunity = true
				oIkleos.image_blend = #FF8888
			}
		}
	}
	
	if place_meeting(x, y, oLaser) or place_meeting(x, y, oEnemy) {
		if oGame.immunity == false {
			oGame.hp = oGame.hp - oGame.boss_damage
			oGame.alarm[6] = 30
			oGame.hit_state = true
			oGame.immunity = true
			oIkleos.image_blend = #FF8888
		}
	}
}










