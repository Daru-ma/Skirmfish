extends Area2D

var wave : BulletWave

var sender
var target : Node2D
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move(delta)
	pass

func send(wave_data,sender_area:Area2D,target_node:Node2D):
	sender = sender_area
	wave = wave_data
	target = target_node
	
	get_node("Sprite2D").modulate = wave.color
	
func move(delta):
	var angle_degrees = rotation
	var direction = Vector2(cos(angle_degrees), sin(angle_degrees))
	translate(direction*delta*wave.force)
	# if wave.home:
	# 	home_in(delta)

# func home_in(delta):
# 	translate((target.global_position-global_position).normalized()*wave.home_force*delta)
	
func die():
	queue_free()


func _on_life_time_timeout() -> void:
	die()

