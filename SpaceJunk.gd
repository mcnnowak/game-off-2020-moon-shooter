extends KinematicBody2D


export var randomRotationSpeedMax : float = 2.0
var randomRotation : float


# Called when the node enters the scene tree for the first time.
func _ready():
	randomRotation = get_random_rotation()

func _process(delta):
	rotate(randomRotation * delta)

func get_random_rotation():
	return rand_range(0.5, randomRotationSpeedMax)
