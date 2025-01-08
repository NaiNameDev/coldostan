extends Node

var bus: Array[Callable] = [test, testt]
var def_bus: Array[Callable] = [test, testt]
var min_time: float = 1
var max_time: float = 3

func _ready() -> void:
	start_event_bus()

func start_event_bus():
	while true:
		await get_tree().create_timer(randf_range(min_time, max_time)).timeout
		#bus.pick_random().call()

func set_def_bus():
	bus = def_bus

func set_bus(variant: Array[Callable]):
	bus = variant

func test():
	print("dropped test1")

func testt():
	print("dropped test2")
