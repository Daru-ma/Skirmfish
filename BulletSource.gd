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
func _ready() -> void:
	shoot_bursts()


	
func shoot_bursts():
	for i in bursts.size():
		shoot_wave(bursts[i].wave)
		burstTimer.start()
		burstTimer.wait_time = bursts[i].cooldown
		await burstTimer.timeout
		
	
func shoot_wave(wave):
	var angle = global_position.angle_to_point(target_position)
	var delta = deg_to_rad(wave.angle_between_bullets)
	var offset = (delta*(wave.bullets_in_wave-1))/2
	angle-=offset
	for i in wave.bullets_in_wave:
		shoot_bullet(wave,angle)
		angle += delta
	
	waveTimer.wait_time=wave.delay
	waveTimer.start()
	await waveTimer.timeout

func shoot_bullet(wave,angle):
	var bullet_shot = bullet_scene.instantiate()
	bullet_shot.position=global_position
	bullet_shot.rotation=angle
	bullet_shot.send(wave,get_parent())
	get_tree().root.add_child(bullet_shot)

func _on_target_changed(new_target) -> void:
	target=new_target
