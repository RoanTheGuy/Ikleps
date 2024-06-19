prev = boss_attack
while boss_attack == prev {
	boss_attack = irandom_range(1, 3)
}
boss_immunity = false

alarm[0] = 30