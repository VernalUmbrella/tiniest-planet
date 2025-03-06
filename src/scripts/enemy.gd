class_name Enemy
extends Area2D


func die() -> void:
	# TODO: sound effect
	print("AAAAA MY BONES")
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	# TODO: differentiate between crashing into the planet and getting hit by a bullet
	die()


