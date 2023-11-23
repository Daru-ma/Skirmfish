extends Resource

class_name BulletWave
@export var force : float = 200
@export var color : Color
@export var damage : int = 1
@export var bullets_in_wave : int = 1
@export var angle_between_bullets : float = 10

@export var predict : bool = false
@export var behaviour : behaviour_type=behaviour_type.current_position
@export var custom_angle : float
# @export var home : bool = false
# @export var home_force : float = 100

enum behaviour_type{current_position,predict,custom}
