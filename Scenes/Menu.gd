extends Control

func _ready():
	update_labels()

func _on_TwitterButton_pressed():
	OS.shell_open("https://twitter.com/PeterKoloDev")


func _on_TextureButton_pressed():
	OS.shell_open("https://peterkolo.itch.io")


func _on_PlayButton_pressed():
	get_tree().change_scene("res://Scenes/Level.tscn")
	global.points = 0


func _on_CreditsButton_pressed():
	get_tree().change_scene("res://Scenes/Credits.tscn")


func _on_HowToPlayButton_pressed():
	get_tree().change_scene("res://Scenes/HowToPlay.tscn")


func _on_SFX_pressed():
	if(global.sfx >-80):
		global.sfx -= 10
		update_labels()
	$SFX_Sample.volume_db = global.sfx
	$SFX_Sample.play()


func _on_SFXp_pressed():
	if(global.sfx <=-0):
		global.sfx += 10
		update_labels()
	$SFX_Sample.volume_db = global.sfx
	$SFX_Sample.play()

func update_labels():
	$SFXLevel.text = str((global.sfx + 80)/10 )
	$MusicLevel.text = str((global.music + 80)/10 )


func _on_MUSIC_pressed():
	if(global.music >-80):
		global.music -= 10
		update_labels()
	$Music_Sample.volume_db = global.music
	$Music_Sample.play()


func _on_MUSICp_pressed():
	if(global.music <=-0):
		global.music += 10
		update_labels()
	$Music_Sample.volume_db = global.music
	$Music_Sample.play()
