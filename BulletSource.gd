extends Node2D

var target:Node2D
@export var rate:float
@export var strength:float
var shootTimer
var bullet = load("res://bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shootTimer=get_node("ShootTimer")
	shootTimer.wait_time=1/rate
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_shoot_timer_timeout() -> void:
	var bullet_shot = bullet.instantiate()
	get_tree().root.add_child(bullet_shot)
	bullet_shot.global_position=global_position
	bullet_shot.send(-global_position,strength,get_parent())
	pass # Replace with function body.
