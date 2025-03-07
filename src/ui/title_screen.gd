class_name TitleScreen
extends Control


func _on_timer_timeout() -> void:
	$StartText.visible = not $StartText.visible


func _process(_delta: float) -> void:
	$Enemy.look_at($OrbitingPlanet.position)
	$Enemy.rotation -= TAU/4

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		GlobalStats.reset()
		get_tree().change_scene_to_file("res://ui/interstitial.tscn")
