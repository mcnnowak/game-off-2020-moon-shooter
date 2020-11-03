extends Node2D


var can_shoot : bool = true
var shoot_delay : float = 2.0
onready var shootTimer : Timer = get_node("ShootTimer")

# Called when the node enters the scene tree for the first time.
func _ready():
	shootTimer.wait_time = shoot_delay
	shootTimer.one_shot = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_shoot:
		shoot()

func shoot():
	print("Shooting!")
	can_shoot = false
	shootTimer.start()


func _on_ShootTimer_timeout():
	can_shoot = true
