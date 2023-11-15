extends Node2D

@onready var player=$Player
@onready var spawner=$Spawner
@export var enemy_health:Health




func _on_spawner_on_spawn(unit) -> void:
	enemy_health.reset()
	unit.target=player
	unit.health=enemy_health
	enemy_health.on_death.connect(spawner.start)
	pass # Replace with function body.
