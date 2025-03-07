class_name EnemySpawner
extends Node2D


const EnemyScene := preload("res://scenes/combatants/enemy.tscn")

@export_category("Spawn Interval")
@export var average_spawn_time: float = 1.0
@export var spawn_time_deviation: float = 0.7
@export_category("Enemy Stats")
@export var speed_deviation: float = 0.2
@export var angular_speed_deviation: float = 0.2

var timer: Timer


func _ready() -> void:
	timer = Timer.new()
	assert(average_spawn_time > spawn_time_deviation, "Deviation should be smaller than average spawn time")
	timer.timeout.connect(_on_timer_timeout)
	add_child(timer)
	_on_timer_timeout()


func spawn_enemy() -> void:
	var new_enemy: Enemy = EnemyScene.instantiate()
	new_enemy.rotation = randf_range(0, TAU)
	new_enemy.fall_speed *= randf_range(1-speed_deviation, 1+speed_deviation)
	new_enemy.angular_speed *= randf_range(1-angular_speed_deviation, 1+angular_speed_deviation)
	if randf() < 0.5:
		new_enemy.angular_speed *= -1
	add_child(new_enemy)


func _on_timer_timeout() -> void:
	timer.wait_time = randf_range(average_spawn_time - spawn_time_deviation, average_spawn_time + spawn_time_deviation)
	timer.start()
	spawn_enemy()
