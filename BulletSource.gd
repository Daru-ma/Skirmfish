extends Node2D
@export var bursts:Array[BulletBurst]

var target:Node2D
var target_position:
	get:
		return Vector2.ZERO if not target else target.position
@export var rate:float
@onready var burstTimer:Timer=$BurstTimer
@onready var waveTimer:Timer=$WaveTimer
var bullet_scene = load("res://bullet.tscn")


# Called when the node enters the scene tree for the first time.


	
func start_shooting():
	while target!=null:
		await shoot_bursts()


func shoot_bursts():
	for i in bursts.size():
		shoot_wave(bursts[i].wave)
		burstTimer.wait_time = bursts[i].cooldown
		burstTimer.start()
		await burstTimer.timeout
		
	
func shoot_wave(wave):
	var angle = global_position.angle_to_point(target_position)
	if wave.predict:
		angle+=predict_target_offset(wave.force)
	var delta = deg_to_rad(wave.angle_between_bullets)
	var offset = (delta*(wave.bullets_in_wave-1))/2
	angle-=offset
	for i in wave.bullets_in_wave:
		shoot_bullet(wave,angle)
		angle += delta
	
func predict_target_offset(bullet_speed) ->float:
	var r=Globals.battle_radius
	var w1=Globals.player_speed
	var v2=bullet_speed
	
	var t=r*v2

	var angle=t*w1
	return angle




func shoot_bullet(wave,angle):
	var bullet_shot = bullet_scene.instantiate()
	bullet_shot.position=global_position
	bullet_shot.rotation=angle
	bullet_shot.send(wave,get_parent(),target)
	get_tree().root.add_child(bullet_shot)

func _on_target_changed(new_target) -> void:
	target=new_target
	start_shooting()
