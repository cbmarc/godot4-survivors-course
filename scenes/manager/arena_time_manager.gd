extends Node

signal arena_dificulty_increased(arena_dificulty: int)

const DIFICULTY_INTERVAL = 5

@export var end_screen_scene: PackedScene

@onready var timer = $Timer

var arena_dificulty = 0


func _ready():
	timer.timeout.connect(on_timer_timeout)


func _process(delta):
	var next_time_target = timer.wait_time - ((arena_dificulty + 1) * DIFICULTY_INTERVAL)
	
	if timer.time_left <= next_time_target:
		arena_dificulty += 1
		arena_dificulty_increased.emit(arena_dificulty)
		
	
	
func get_time_elapsed():
	return timer.wait_time - timer.time_left


func on_timer_timeout():
	var end_screen_instance = end_screen_scene.instantiate()
	add_child(end_screen_instance)
