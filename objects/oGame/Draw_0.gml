if dash == true {
	dashframe += 1
	if dashframe == 1 {
		dashimagex = oIkleos.x
		dashimagey = oIkleos.y
	}
	draw_sprite_ext(sIkleos, -1, dashimagex, dashimagey, 1, 1, 0, c_white, 0.2)
	if dashframe == 4 {
		dashimagex2 = oIkleos.x
		dashimagey2 = oIkleos.y
	}
	if dashframe >= 4 {
		draw_sprite_ext(sIkleos, -1, dashimagex2, dashimagey2, 1, 1, 0, c_white, 0.3)
	}
	if dashframe == 8 {
		dashimagex3 = oIkleos.x
		dashimagey3 = oIkleos.y
	}
	if dashframe >= 8 {
		draw_sprite_ext(sIkleos, -1, dashimagex3, dashimagey3, 1, 1, 0, c_white, 0.5)
	}
	
}
else {
	dashframe = 0	
}

if boss_attack == 3 {
	if oIkleps.image_alpha == 1 {
		draw_sprite(sImmunityShield, -1, oIkleps.x, oIkleps.y)
	}
}

//if weapon == 1 { draw_set_color(c_red); draw_line(oWeapon.x, oWeapon.y, mouse_x, mouse_y) }