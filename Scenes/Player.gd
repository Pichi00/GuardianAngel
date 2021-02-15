extends KinematicBody2D

var motion = Vector2.ZERO
const MAX_SPEED = 4
const ACCELERATION = 58
const FRICTION = 32

func _ready():
	pass

func _physics_process(_delta):
	if Input.is_action_pressed("ui_down"):
		motion.y = min(MAX_SPEED, motion.y + ACCELERATION)
	elif Input.is_action_pressed("ui_up"):
		motion.y = max(-MAX_SPEED, motion.y - ACCELERATION)
	else:
		motion.y = move_toward(motion.y, 0, FRICTION)
	
	translate(motion)
	position.y = clamp(position.y, -256, 16)
