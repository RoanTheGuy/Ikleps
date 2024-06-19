if boss_attack == 1 {

	if extrarotation <= 90 {
		extrarotation += 10	
	}
	else {
		extrarotation = 20	
	}


	temp = instance_create_layer(oIkleps.x, oIkleps.y, "Projectiles", oLaser)
	temp.image_angle += 0 + extrarotation
	temp.speed = 5; temp.direction = temp.image_angle

	temp = instance_create_layer(oIkleps.x, oIkleps.y, "Projectiles", oLaser)
	temp.image_angle += 90 + extrarotation
	temp.speed = 5; temp.direction = temp.image_angle

	temp = instance_create_layer(oIkleps.x, oIkleps.y, "Projectiles", oLaser)
	temp.image_angle += 180 + extrarotation
	temp.speed = 5; temp.direction = temp.image_angle

	temp = instance_create_layer(oIkleps.x, oIkleps.y, "Projectiles", oLaser)
	temp.image_angle += 270 + extrarotation
	temp.speed = 5; temp.direction = temp.image_angle

	count2 +=1

	if count2 <= 10 { //shoot amount
		alarm[0] = 20
	}
	else {
		alarm[1] = 120	
		count3 = 0
		count2 = 0
		count = 0
	}

}




if boss_attack == 2 {
	
	if count2 == 1 {
		oIkleps.speed = 0
		oIkleps.image_angle = 0
		count2 += 1
	}
	
	if count2 == 0 {
		oIkleps.image_angle = point_direction(oIkleps.x, oIkleps.y, oIkleos.x, oIkleos.y) - 90
		oIkleps.direction = oIkleps.image_angle + 90
		oIkleps.speed = 5
		count2 += 1
	}

	
	if count2 == 2 {
		count += 1
		count2 = 0
	}
	
	if count >= 3 {
		alarm[1] = 120
		count3 = 0
		count2 = 0
		count = 0	
	}
	else {
		alarm[0] = 60	
	}

}


if boss_attack == 3 {
	boss_immunity = true
	if count2 == 0 {
		if count3 >= 20 {
			count2 += 1
			count3 = 0
		}
		else {
			oIkleps.image_xscale += 0.1
			oIkleps.image_yscale += 0.1
			oIkleps.image_alpha -= 0.05
			count3 += 1
			alarm[0] = 1
		}
	}
	
	if count2 == 1 {
		if count3 == 0 {
			temp = instance_create_layer(oIkleps.x, oIkleps.y, "Projectiles", oTarget)
			temp.speed = 7
		}
		
		if count3 >= 180 {
			count2 += 1
			count3 = 0
		}
		else {
			temp.direction = point_direction(oTarget.x, oTarget.y, oIkleos.x, oIkleos.y)
			count3 += 1
			alarm[0] = 1
		}
	}
	
	if count2 == 2 {
		if count3 == 0 {
			temp.speed = 0
			oIkleps.x = temp.x
			oIkleps.y = temp.y
		}
		
		if count3 == 20 {
			instance_destroy(temp)
		}
		
		if count3 > 20 and count3 < 40 {
			oIkleps.image_xscale -= 0.1
			oIkleps.image_yscale -= 0.1
			oIkleps.image_alpha += 0.05
		}
		
		if count3 >= 40 {
			oIkleps.image_xscale = 1
			oIkleps.image_yscale = 1
			oIkleps.image_alpha = 1
			count2 = 0
			count3 = 0
			alarm[1] = 60
		}
		else {
			
			count3 += 1
			alarm[0] = 1
		}
		
	}
	
}