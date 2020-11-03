extends Node2D

onready var cannon : KinematicBody2D
onready var cannon_rotator : Node2D
onready var moon : KinematicBody2D
onready var moon_rotator : Node2D
onready var planet : KinematicBody2D

var direction : float

# Called when the node enters the scene tree for the first time.
func _ready():
	cannon = get_node("MoonRotator/Moon/CannonRotator/Cannon")
	cannon_rotator = get_node("MoonRotator/Moon/CannonRotator")
	moon = get_node("MoonRotator/Moon")
	moon_rotator = get_node("MoonRotator")
	planet = get_node("Planet")
	
	moon.position = planet.position + Vector2.UP * moon.distance
	cannon.position = moon.position + Vector2.UP * cannon.distance

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
	moon_rotator.rotate(moon.speed * delta)
	cannon_rotator.rotate(cannon.speed * direction * delta)
	
func get_input():
	var speed = 0
	if Input.is_action_pressed("cannon_left"):
		speed = -1 * cannon.speed
	elif Input.is_action_pressed("cannon_right"):
		speed = 1 * cannon.speed
	direction = speed
