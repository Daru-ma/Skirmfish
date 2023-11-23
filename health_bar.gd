extends ProgressBar

@export var health : Health
func _ready() -> void:
	max_value=1.0
	min_value=0.0
	health.on_hurt.connect(update)
	health.on_reset.connect(update)

func update():
	value=health.ratio

