class_name Game
extends Node2D

const WINDOW_WIDTH := 256
const WINDOW_HEIGHT := 256
const SCREEN_CENTER := Vector2(WINDOW_WIDTH, WINDOW_HEIGHT) / 2

@onready var player: Player = $Player
@onready var score_counter: Label = %ScoreCounter
@onready var lives_counter: Label = %LivesCounter


func _ready() -> void:
	Events.enemy_died.connect(_on_enemy_died)
	Events.player_died.connect(_on_player_died)
	score_counter.text = "%03d" % GlobalStats.score
	lives_counter.text = str(GlobalStats.lives)


func _on_playable_area_area_exited(area: Area2D) -> void:
	print("DELETING:" + str(area))
	area.queue_free()


func _on_player_died():
	GlobalStats.lives -= 1
	lives_counter.text = str(GlobalStats.lives)
	remove_child.call_deferred(player)
	await get_tree().create_timer(2.0).timeout
	if GlobalStats.lives > 0:
		get_tree().change_scene_to_file("res://ui/interstitial.tscn")
	else:
		get_tree().change_scene_to_file("res://ui/title_screen.tscn")


func _on_enemy_died():
	GlobalStats.score += 1
	while GlobalStats.score > 127: # funny byte overflow simulation
		GlobalStats.score -= 256
	score_counter.text = "%03d" % GlobalStats.score
