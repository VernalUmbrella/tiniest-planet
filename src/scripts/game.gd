class_name Game
extends Node2D

const WINDOW_WIDTH := 256
const WINDOW_HEIGHT := 256
const SCREEN_CENTER := Vector2(WINDOW_WIDTH, WINDOW_HEIGHT) / 2

@onready var music_player: AudioStreamPlayer = $MusicPlayer

func _ready() -> void:
	start_round()


func start_round() -> void:
	music_player.play()


func _on_playable_area_area_exited(area: Area2D) -> void:
	print("DELETING:" + str(area))
	area.queue_free()
