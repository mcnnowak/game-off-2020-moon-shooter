extends Area2D


export(Array, PackedScene) var hazards
onready var spawnerShape : CollisionShape2D = get_node("SpawnerShape")
onready var hazardCollection = get_node("Hazards")

# Called when the node enters the scene tree for the first time.
func _ready():
	var shape : CircleShape2D = spawnerShape.shape
	shape.radius = get_viewport().get_visible_rect().size.length()

func _process(delta):
	if Input.is_action_just_pressed("spawn"):
		var point = get_spawn_point()
		print("Spawning at <%d, %d>" % [point.x, point.y])
		spawn(point)

func spawn(position: Vector2):
	var hazard = hazards[0].instance()
	hazard.position = position
	hazardCollection.add_child(hazard)
	
func get_spawn_point():
	var randomRotation = randf() * 2 * PI
	var randomOffset = spawnerShape.shape.radius * sqrt(randf())
	return Vector2(randomOffset * cos(randomRotation), randomOffset * sin(randomRotation))
