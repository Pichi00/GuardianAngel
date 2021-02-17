extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_TwitterButton_pressed():
	OS.shell_open("https://twitter.com/PeterKoloDev")


func _on_TextureButton_pressed():
	OS.shell_open("https://peterkolo.itch.io")


func _on_PlayButton_pressed():
	get_tree().change_scene("res://Scenes/Level.tscn")
