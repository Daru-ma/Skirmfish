extends Node
@export var body: Node2D
@export var target: Node2D
@export var speed:float
var target_position:Vector2:
	get:
		if target:
			return target.positon
		else:
			return Vector2.ZERO
@export var face_target: bool=false

@export var radius = 200

var direction : int=1
var angle=0.0

func _ready() -> void:
	
	pass
	
func _process(delta: float) -> void:
	angle+=delta*direction*speed
	if abs(angle)>=2*PI:
		angle=0
	var new_position = target_position + Vector2(cos(angle), sin(angle)) * radius
	body.position=new_position
	
func flip():
	direction*=-1
