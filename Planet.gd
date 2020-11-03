extends KinematicBody2D

signal game_over
export var health = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_damaged(damage):
	health -= damage
	if health <= 0:
		emit_signal("game_over")
