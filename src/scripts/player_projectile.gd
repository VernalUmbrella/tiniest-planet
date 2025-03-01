extends RigidBody2D

const SPEED = 200

func _ready() -> void:
	linear_velocity = Vector2.UP.rotated(rotation) * SPEED

func _process(delta: float) -> void:
	if global_position.distance_to(Vector2(0,0)) > 512: queue_free() #temp - make sure bullets unload after leaving the screen

func _on_hitbox_area_entered(area: Area2D) -> void: #use this when an enemy is hit
	pass
