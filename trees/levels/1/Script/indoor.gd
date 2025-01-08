extends Area3D

var bus: Array[Callable]

@export var light: bool = true
@export var light_cold_plus: bool = true:
	set(v):
		if v == true:
			min_cold = GlobalCold.global_worm
		else:
			min_cold = GlobalCold.global_cold

@export var fuel: float = 100:
	set(v):
		if fuel < 0:
			fuel = 0
		else:
			fuel = v
@export var fuel_minus:float = 0.5
@export var min_cold: float = 30
@export var cold: float = 30

func _enter_tree() -> void:
	GlobalCold.connect("cold_signal", cold_mns)

func cold_mns():
	fuel -= fuel_minus
	
	if cold > min_cold:
		cold -= abs(min_cold * 0.01)
	else:
		cold += abs(min_cold * 0.01)

func get_bus():
	return bus

func set_bus(variant: Array[Callable]):
	bus = variant

func on_timer() -> void:
	cold -= GlobalCold.global_cold

func _on_body_entered(body: Node3D) -> void:
	GlobalEvents.set_bus(bus)
	body.indoor(cold)

func _on_body_exited(body: Node3D) -> void:
	GlobalEvents.set_def_bus()
	body.outdoor(GlobalCold.global_cold)
