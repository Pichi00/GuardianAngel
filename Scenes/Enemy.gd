extends KinematicBody2D

var motion = Vector2(-1,0)
var speed = 65
var direction
var granny_detected = false

func _physics_process(delta):
	if !granny_detected:
		translate(motion.normalized() * speed * delta)
	else:
		move_toward_granny()

func _on_Area2D_body_entered(body):
	if body.is_in_group("Granny"):
		granny_detected = true

func _on_Area2D_body_exited(body):
	if body.is_in_group("Granny"):
		granny_detected = false

func move_toward_granny():
	$Sprite.flip_h = false
	var granny_pos = get_tree().get_nodes_in_group("Granny")[0].global_position
	var my_pos = global_position
	var direction_vector = Vector2.ZERO
	direction_vector.x = (granny_pos.x - my_pos.x)
	direction_vector.y = (granny_pos.y - my_pos.y)
	
	direction = direction_vector.normalized()
	motion = direction * speed
	motion = move_and_slide(motion)

