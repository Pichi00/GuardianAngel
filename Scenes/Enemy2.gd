extends KinematicBody2D

var direction = Vector2(-1,0)
var motion = Vector2(1,0)
var speed = 20
var jump_force = -800

func _ready():
	randomize()

func _physics_process(_delta):
	motion.y += global.gravity
	motion.x = -speed
	motion = move_and_slide(motion, Vector2(0,-1))
	if is_on_floor():
		$AnimatedSprite.animation = "Idle"

func jump():
	motion.y += jump_force
	$AnimatedSprite.animation = "Jump"


func _on_Timer_timeout():
	jump()
	$Timer.wait_time = rand_range(1.5, 2.5)
	jump_force = rand_range(-850, -600)
