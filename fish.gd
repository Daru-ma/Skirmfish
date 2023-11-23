extends Area2D

class_name Fish

signal target_changed(new_target:Node2D)

@export var health:Health:
	get:
		return health
	set(value):
		health=value
		health.on_hurt.connect(hurt)
		health.on_death.connect(die)

@export var target : Node2D:
	set=set_target
		

func set_target(new_target):
	target=new_target
	target_changed.emit(new_target)
		


func _ready() -> void:
	if not health: 
		return
	health.reset()


func hurt():
	pass
	
func die():
	queue_free()
	

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		var bullet = area
		
		if bullet.sender == self : return
		
		if not health: return
		
		health.damage(bullet.wave.damage)
		
		bullet.die()
