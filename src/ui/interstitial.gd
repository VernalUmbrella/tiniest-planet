class_name Interstitial
extends Control


@onready var music_player: AudioStreamPlayer = $MusicPlayer
@onready var sprite: Sprite2D = $Sprite2D


func _ready() -> void:
	music_player.play()


func _process(delta: float) -> void:
	sprite.rotation += 8 * delta


func _on_music_player_finished() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
