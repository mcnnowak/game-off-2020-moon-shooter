extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	point_to_cursor()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	point_to_cursor()

func point_to_cursor():
	self.look_at(get_global_mouse_position())
