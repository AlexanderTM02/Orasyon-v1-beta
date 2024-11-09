extends BaseCardEffect
class_name ShieldEffect

func execute(caster, target):
	target.add_shield(stats.shield)
