extends Node


func play(stream: AudioStream):
	for channel: AudioStreamPlayer in get_children():
		if channel.playing:
			continue
		channel.stream = stream
		channel.play()
		return
	# all channels full - override channel 0
	var channel: AudioStreamPlayer = get_child(0)
	channel.stream = stream
	channel.play()


func clear():
	for channel: AudioStreamPlayer in get_children():
		channel.stop()
