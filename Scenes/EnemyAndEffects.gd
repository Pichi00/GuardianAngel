extends Node2D


func _ready():
	$ComboLabel.hide()

func _on_Enemy_die():
	$Particles2D.global_position = $Enemy.global_position
	$ComboLabel.global_position = $Enemy.global_position
	$Enemy.queue_free()
	$Particles2D.emitting = true
	$ComboLabel/Label.text = str(global.combo)
	if global.combo > 1:
		$ComboLabel.show()
	$ComboLabel/AnimationPlayer.play("Vanish")
