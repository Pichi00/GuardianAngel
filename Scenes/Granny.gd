extends KinematicBody2D

var motion = Vector2.ZERO
var gravity = 10
var speed = 50
var heartrate_level = 0

func _physics_process(_delta):
	motion.y += global.gravity
	motion.x = speed
	motion = move_and_slide(motion, Vector2(0,-1))

func _on_ScareArea_body_entered(body):
	if body.is_in_group("Enemy"):
		body.queue_free()
		heartrate_level += 1
		$CanvasLayer/HR.scale.y = 2 * heartrate_level 
		$CanvasLayer/Heart.speed_scale = heartrate_level + 0.5 
