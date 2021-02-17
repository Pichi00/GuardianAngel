extends Control


func _ready():
	$FinalScoreLabel.text = "Your score: " + str(global.points)


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")
