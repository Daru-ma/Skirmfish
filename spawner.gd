extends Timer
@export_file var scene_path
@onready var unit = load(scene_path)

signal on_spawn(unit:Node)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn():
	var instance = unit.instantiate()
	add_sibling(instance)
	on_spawn.emit(instance)
	pass
	


func _on_timeout() -> void:
	spawn()
	pass # Replace with function body.
