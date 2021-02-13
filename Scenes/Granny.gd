extends KinematicBody2D

var motion = Vector2.ZERO
var gravity = 10
var speed = 50

func _ready():
	pass

func _physics_process(_delta):
	motion.y += global.gravity
	motion.x = speed
	motion = move_and_slide(motion, Vector2(0,-1))

