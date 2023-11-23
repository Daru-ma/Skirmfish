extends Resource

class_name Health

@export var max_health:int
@export var god_mode:bool=false

var health :int= max_health

var is_dead : bool: 
	get:
		return true if health <= 0 else false

var ratio:
	get:
		return (float(health)/max_health)

signal on_hurt
signal on_death
signal on_reset

func damage(value:int):
	if not god_mode:
		health-=value
		
	on_hurt.emit()
	
	if health>0: return
	
	health=0
	
	on_death.emit()
	
	
func reset(new_max_health:int=max_health):
	max_health=new_max_health
	health=max_health
	on_reset.emit()
