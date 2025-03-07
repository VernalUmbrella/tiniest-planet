class_name Game
extends Node2D

const WINDOW_WIDTH := 256
const WINDOW_HEIGHT := 256
const SCREEN_CENTER := Vector2(WINDOW_WIDTH, WINDOW_HEIGHT) / 2

@onready var music_player: AudioStreamPlayer = $MusicPlayer
@onready var score_counter: Label = %ScoreCounter
@onready var lives_counter: Label = %LivesCounter

var score: int = 0:
	set(value):
		score = value
		while score > 127: # funny byte overflow simulation
			score -= 256
		score_counter.text = "%03d" % score
var lives: int = 5:
	set(value):
		lives = value
		lives_counter.text = str(lives)

func _ready() -> void:
	Events.enemy_died.connect(_on_enemy_died)
	Events.player_died.connect(_on_player_died)
	start_round()


func start_round() -> void:
	music_player.play()


func _on_playable_area_area_exited(area: Area2D) -> void:
	print("DELETING:" + str(area))
	area.queue_free()


func _on_player_died():
	lives -= 1


func _on_enemy_died():
	score += 1
