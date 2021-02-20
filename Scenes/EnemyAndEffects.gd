extends Node2D


func _ready():
	pass # Replace with function body.

func _on_Enemy_die():
	$Particles2D.global_position = $Enemy.global_position
	$Enemy.queue_free()
	$Particles2D.emitting = true
	print($Particles2D.global_position)
