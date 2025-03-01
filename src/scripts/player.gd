extends Node2D

const BASE_ROTATE_SPEED = 60
const BOOST_MULTIPLIER = 3

@onready var muzzle = $Muzzle
@onready var gameNode = $".."

var rotateSpeed = BASE_ROTATE_SPEED
var projectile = "res://scenes/player_projectile.tscn"

func _input(event: InputEvent) -> void:
	var delta = get_process_delta_time()
	if Input.is_action_pressed("Boost"): rotateSpeed = BASE_ROTATE_SPEED * BOOST_MULTIPLIER
	else: rotateSpeed = BASE_ROTATE_SPEED
	if Input.is_action_just_pressed("Shoot"):
		_shoot()

func _process(delta: float) -> void:
	rotate(deg_to_rad(rotateSpeed) * delta)

func _shoot(): #create a projectile
	var newProjectile = load(projectile).instantiate()
	newProjectile.global_position = muzzle.global_position
	newProjectile.rotation = rotation
	gameNode.add_child(newProjectile)
	


func _on_hitbox_area_entered(area: Area2D) -> void: #hitbox
	pass # Replace with function body.
