extends BaseCardEffect
class_name FireballEffect

func execute(caster, target):
	# Deal initial damage using stats
	target.take_damage(stats.damage)
	
