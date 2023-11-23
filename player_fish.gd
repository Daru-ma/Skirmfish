extends Fish

@onready var motion = $CircularMotion

func _ready() -> void:
    super()
    Globals.player=self
    Globals.player_speed=motion.speed
    Globals.battle_radius=motion.radius

