extends KinematicBody2D

var direction = Vector2(-1,0)
var motion = Vector2(1,0)
var speed = 20
var jump_force = -800
signal die

func _ready():
	randomize()
	global_position.x = get_tree().get_nodes_in_group("Granny")[0].global_position.x + 500

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
	jump_force = rand_range(-830, -600)


func die():
	emit_signal("die")
