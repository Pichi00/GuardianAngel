extends KinematicBody2D

var motion = Vector2.ZERO
var gravity = 10
var speed = 20
var heartrate_level = 1
signal game_over

enum {WALK, SCARED}
var state = WALK

func _physics_process(_delta):
	match state:
		WALK:
			motion.y += global.gravity
			motion.x = speed
			motion = move_and_slide(motion, Vector2(0,-1))
		SCARED:
			$AnimationPlayer.play("Scared")
			motion = Vector2(0,0)

func _on_ScareArea_body_entered(body):
	if body.is_in_group("Enemy"):
		body.queue_free()
		heartrate_level += 1
		$CanvasLayer/HR.scale.y = 2 * heartrate_level 
		$CanvasLayer/Heart.speed_scale = heartrate_level + 0.5 
		if heartrate_level == 4:
			emit_signal("game_over")
		state = SCARED

func back_to_walk():
	state = WALK

func _on_Halo_idle():
	$Player.idle()

func _on_Halo_attack():
	$Player.attack()
