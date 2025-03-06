class_name Enemy
extends Node2D

@export var fall_speed: float = 8.0
@export_range(0, 360, 0.1, "radians_as_degrees") var angular_speed: float = 0.1

@onready var orbit: Area2D = $Orbit


func _process(delta: float) -> void:
	orbit.position.y += fall_speed * delta
	rotation += angular_speed * delta
	

func die() -> void:
	# TODO: sound effect
	print("AAAAA MY BONES")
	queue_free()


func _on_orbit_area_entered(area:Area2D) -> void:
	# TODO: differentiate between crashing into the planet and getting hit by a bullet
	die()

