extends Control

var sentence_id = 0
var sentence 
func _ready():
	randomize()
	$FinalScoreLabel.text = "Your score: " + str(global.points)
	$BestComboLabel.text = "Best combo: " + str(global.best_combo)
	sentence_id = randi()%6
	print(sentence_id)
	match sentence_id:
		0:
			sentence = "Don't worry son. You did everything you could."
		1:
			sentence = "Don't be sad. You did your best!"
		2:
			sentence = "It was a pleasure to have you as my guardian angel."
		3:
			sentence = "I don't know why are you so sad. You were amazing!"
		4:
			sentence = "I bet you're the best guardian angel in heaven."
		5:
			sentence = "I'm glad that such a talented angel protected me all the time."
	
	$GrannyLabel.text = sentence

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")

func _on_PlayAgainButton_pressed():
	get_tree().change_scene("res://Scenes/Level.tscn")
	#global.points = 0
