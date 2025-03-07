class_name Player
extends Node2D

const BASE_ROTATE_SPEED = 120
const BOOST_MULTIPLIER = 3
const ProjectileScene = preload("res://scenes/player_projectile.tscn")

@export var shoot_sound: AudioStream

@onready var muzzle: Node2D = %Muzzle
@onready var game_node: Node = $".."

var speed_multiplier: float = 1

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("boost"):
		speed_multiplier = BOOST_MULTIPLIER
	if event.is_action_released("boost"):
		speed_multiplier = 1
	if event.is_action_pressed("shoot"):
		shoot()


func _process(delta: float) -> void:
	rotate(deg_to_rad(BASE_ROTATE_SPEED) * speed_multiplier * delta)


func shoot(): #create a projectile
	var new_projectile = ProjectileScene.instantiate()
	new_projectile.global_position = muzzle.global_position
	new_projectile.rotation = rotation
	game_node.add_child(new_projectile)
	SFXPlayer.play(shoot_sound)
	


func _on_orbit_area_entered(_area: Area2D) -> void: #hitbox
	print("ACK I'VE BEEN HIT")
