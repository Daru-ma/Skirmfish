extends Area2D

var _force
var _direction
var _parent_area

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	translate(_direction*delta*_force)
	pass

func send(direction,force,parent_area):
	_direction=direction.normalized()
	_force=force
	_parent_area=parent_area
	print(_direction,_force)
	
	
func die():
	queue_free()


func _on_life_time_timeout() -> void:
	die()


func _on_area_entered(area: Area2D) -> void:
	if area == _parent_area or get_parent():
		print("Hit self")
		pass
	else:
		print("HIT "+area.name)
		die()
	pass # Replace with function body.
