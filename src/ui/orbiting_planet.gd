class_name OrbitingPlanet
extends Sprite2D

const ORBITAL_PERIOD := 5.0

const VERTICAL_RADIUS = 50.0
const HORIZONTAL_RADIUS = 100.0

@onready var origin: Vector2 = position

@export var progress: float = 0:
	set(value):
		progress = value
		var x_offset: float = cos(progress) * HORIZONTAL_RADIUS
		var y_offset: float = sin(progress) * VERTICAL_RADIUS
		position = origin + Vector2(x_offset, y_offset)


func _process(delta: float) -> void:
	progress += TAU*delta/ORBITAL_PERIOD
	progress = fmod(progress, TAU)
