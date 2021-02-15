extends KinematicBody2D

var motion = Vector2.ZERO
var gravity = 10
var speed = 40
var heartbeat_level = 1

func _ready():
	pass

func _physics_process(_delta):
	motion.y += global.gravity
	motion.x = speed
	motion = move_and_slide(motion, Vector2(0,-1))



func _on_ScareArea_body_entered(body):
	if body.is_in_group("Enemy"):
		print("SCARED")
		body.queue_free()
