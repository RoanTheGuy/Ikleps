randomize()
// v0.1.2
boss_attack = 0
prev = 0

boss_hp = 100
boss_damage = 5

extrarotation = 0
count3 = 0
count2 = 0
count = 0
if instance_exists(oIkleps) {
	alarm[1] = 20
}


instance_create_layer(oIkleos.x, oIkleos.y, "Projectiles", oWeapon)

slash_active = false
boss_immunity = false
weapon = 0
weaponsizey = 1

dash_amount = 3
dashcd = false
dash = false
dashframe = 0	

dashimagex = oIkleos.x
dashimagey = oIkleos.y
dashimagex2 = oIkleos.x
dashimagey2 = oIkleos.y
dashimagex3 = oIkleos.x
dashimagey3 = oIkleos.y


global.p_sys = part_system_create_layer("Particles", true) 

hp = 100
immunity = false
hit_state = false

audio_play_sound(ThemeSong, 0, true)