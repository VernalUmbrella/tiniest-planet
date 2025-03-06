class_name PlayerProjectile
extends Area2D

const SPEED = 200


func _process(delta: float) -> void:
	position += SPEED * delta * Vector2.UP.rotated(rotation)


func _on_area_entered(_area:Area2D) -> void:
	print("BULLET OUTTT")
	queue_free()

