extends Node3D

signal cold_signal

var cold_minus: float = 0.3
var global_timer: Timer
var global_cold: float = -80
var global_worm: float = 30

func _ready() -> void:
	global_timer = Timer.new()
	get_tree().root.add_child.call_deferred(global_timer)
	global_timer.wait_time = 0.5
	global_timer.autostart = true
	global_timer.connect("timeout", cold_update)
	global_timer.start()

func cold_update():
	cold_signal.emit()
