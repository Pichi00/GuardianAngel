extends KinematicBody2D

var motion = Vector2(-1,0)
var speed = 64
var h_direction = -1
var v_direction = -1

func _physics_process(delta):
	translate(motion.normalized() * speed * delta)


func _on_Timer_timeout():
	motion.x *= -1
