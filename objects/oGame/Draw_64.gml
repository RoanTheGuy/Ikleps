draw_self(); draw_set_font(Font2); draw_set_color(c_lime)

//player hp
draw_healthbar(50, 974, 462, 999, hp, c_black, c_lime, c_lime, 0, false, false)
draw_rectangle(50, 974, 462, 999, true)
draw_rectangle(49, 973, 463, 1000, true)
draw_text(50, 920, string(hp) + "/100")

//boss hp
if instance_exists(oIkleps) {
	draw_set_font(Font1); draw_set_color(c_black)
	draw_rectangle(50, 25, 974, 50, true)
	draw_healthbar(50, 25, 974, 50, boss_hp, c_black, c_red, c_red, 0, false, false)

	draw_set_color(#990000)

	draw_rectangle(271, 15, 291, 60, false) // phase 4 enter
	draw_rectangle(502, 15, 522, 60, false) // phase 3 enter
	draw_rectangle(733, 15, 753, 60, false) // phase 2 enter
	//draw_text(100, 100, string(boss_hp))
}

if dash_amount == 0 { draw_sprite_ext(sDashMeter, 3, 928, 160, 2, 2, 0, c_white, 1) }
if dash_amount == 1 { draw_sprite_ext(sDashMeter, 2, 928, 160, 2, 2, 0, c_white, 1) }
if dash_amount == 2 { draw_sprite_ext(sDashMeter, 1, 928, 160, 2, 2, 0, c_white, 1) }
if dash_amount == 3 { draw_sprite_ext(sDashMeter, 0, 928, 160, 2, 2, 0, c_white, 1) }