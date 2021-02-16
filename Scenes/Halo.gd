extends Area2D

var speed = 10
var direction = Vector2.ZERO
var shot_direction = Vector2(1,0)
enum {SHOT, BACK, STAY}
var state = STAY
onready var player_pos = get_tree().get_nodes_in_group("Player")[0].global_position
signal attack
signal idle

func _on_Halo_body_entered(body):
	body.queue_free()
	global.points += 15

func _physics_process(_delta):
	match state:
		STAY:
			player_pos = get_tree().get_nodes_in_group("Player")[0].global_position
			global_position.x = player_pos.x
			global_position.y = player_pos.y - 22
			if Input.is_action_just_pressed("attack"):
				$ChangeDir.start()
				emit_signal("attack")
				state = SHOT
		SHOT:
			translate(shot_direction * speed)
			
		BACK:
			move_toward_player()


func move_toward_player():
	player_pos = get_tree().get_nodes_in_group("Player")[0].global_position
	player_pos.y = player_pos.y - 22
	var my_pos = global_position
	
	if abs(global_position.x - player_pos.x) < 15 && abs(global_position.y - player_pos.y) < 15:
		emit_signal("idle")
		state = STAY
	
	var direction_vector = Vector2.ZERO
	direction_vector.x = player_pos.x - my_pos.x
	direction_vector.y = player_pos.y - my_pos.y
	
	direction = direction_vector.normalized()
	translate(direction * speed)

func _on_ChangeDir_timeout():
	state = BACK
	$ChangeDir.stop()
