extends Area2D

var wave : BulletWave

var sender



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move(delta)
	pass

func send(wave,sender:Area2D):
	self.sender=sender
	self.wave=wave
	
	get_node("Sprite2D").modulate = wave.color
	
func move(delta):
	var angle_degrees = rotation
	var direction = Vector2(cos(angle_degrees), sin(angle_degrees))
	translate(direction*delta*wave.force)
	
func die():
	queue_free()


func _on_life_time_timeout() -> void:
	die()

