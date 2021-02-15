extends KinematicBody2D

var motion = Vector2(-1,0)
var speed = 88
var direction
var granny_detected = false

func _physics_process(delta):
	if !granny_detected:
		translate(motion.normalized() * speed * delta)
	else:
		move_toward_granny()


func _on_Timer_timeout():
	if !granny_detected:
		motion.x *= -1
		$Sprite.flip_h = !$Sprite.flip_h

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
#	var pos_diff_x = max(granny_pos.x, my_pos.x) - min(granny_pos.x, my_pos.x)
#	if granny_pos.x > my_pos.x && pos_diff_x > 5:
#		direction_vector.x = 1
#
#	elif granny_pos.x < my_pos.x && pos_diff_x > 5: 
#		direction_vector.x = -1
#	else:
#		direction_vector.x = 0
#
#	var pos_diff_y = max(granny_pos.y, my_pos.y) - min(granny_pos.y, my_pos.y)
#	if granny_pos.y > my_pos.y && pos_diff_y > 5:
#		direction_vector.y = 1
#	elif granny_pos.y < my_pos.y && pos_diff_y > 5:
#		direction_vector.y = -1
#	else:
#		direction_vector.y = 0
	direction_vector.x = (granny_pos.x - my_pos.x)
	direction_vector.y = (granny_pos.y - my_pos.y)
	
	direction = direction_vector.normalized()
	motion = direction * speed
	motion = move_and_slide(motion)

