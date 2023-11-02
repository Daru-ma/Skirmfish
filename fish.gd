extends Area2D

@onready var circular_motion=$CircularMotion
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass


func _on_player_controls_flip_pressed() -> void:
	circular_motion.flip()
	pass # Replace with function body.
