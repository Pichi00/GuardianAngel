extends KinematicBody2D

var motion = Vector2.ZERO
var gravity = 10
var speed = 20
var heartrate = 80.0
signal game_over

enum {WALK, SCARED}
var state = WALK

func _ready():
	update_heart()
	update_points()

func _physics_process(_delta):
	update_points()
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
		heartrate += 25.0
		$CalmDownTimer.start()
		update_heart()
		if heartrate >= 180:
			emit_signal("game_over")
		state = SCARED

func back_to_walk():
	state = WALK

func _on_Halo_idle():
	$Player.idle()

func _on_Halo_attack():
	$Player.attack()


func _on_CalmDownTimer_timeout():
	if heartrate > 80:
		heartrate -= 5
		update_heart()
	else:
		$CalmDownTimer.stop()

func update_heart():
	$CanvasLayer/HR.scale.y = (heartrate / 90.0)
	$CanvasLayer/Heart.speed_scale = (heartrate / 45.0)
	$CanvasLayer/BPM_Label.text = str(heartrate) + " BPM"

func update_points():
	$CanvasLayer/Points_Label.text = str(global.points)
