extends KinematicBody2D

var motion = Vector2.ZERO
const MAX_SPEED = 120
const ACCELERATION = 58
const FRICTION = 32
const JUMP_FORCE = -480

func _ready():
	pass

func _physics_process(_delta):	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(MAX_SPEED, motion.x + ACCELERATION)
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(-MAX_SPEED, motion.x - ACCELERATION)
		$Sprite.flip_h = true
	else:
		motion.x = move_toward(motion.x, 0, FRICTION)
	
	if Input.is_action_pressed("ui_up") && self.is_on_floor():
		motion.y += JUMP_FORCE
		
	
	motion.y += global.gravity
	motion = move_and_slide(motion, Vector2(0,-1))

