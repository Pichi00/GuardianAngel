extends Node2D

export (PackedScene) var Enemy1
export (PackedScene) var Enemy2
export (PackedScene) var ComboLabel

var E1_MIN = 0.7
var E1_MAX = 3.0

var E2_MIN = 0.7
var E2_MAX = 3.0

func _ready():
	randomize()
	$E1Spawner.wait_time = rand_range(E1_MIN, E1_MAX)
	$E2Spawner.wait_time = rand_range(E2_MIN, E2_MAX)
	$AudioStreamPlayer.volume_db = global.music
	global.combo = 0
	global.best_combo = 0
	global.points = 0

func _physics_process(_delta):
	$Floor.position.x = $Granny.position.x

func _on_E1Spawner_timeout():
	add_child(Enemy1.instance())
	$E1Spawner.wait_time = rand_range(E1_MIN, E1_MAX)


func _on_E2Spawner_timeout():
	add_child(Enemy2.instance())
	$E2Spawner.wait_time = rand_range(E2_MIN, E2_MAX)


func _on_PointsTimer_timeout():
	global.points += 10


func _on_Halo_enemy_hit(body):
	add_child(ComboLabel.instance())
