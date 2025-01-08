extends "res://trees/levels/1/Script/indoor.gd"

func _ready() -> void:
	set_bus([r1test1, r1test2])

func _process(delta: float) -> void:
	$"../Label3D".text = "temp " + str(round(cold))
	$"../fuel".text = "fuel " + str(round(fuel))

func r1test1():
	print("astolfo sx")
func r1test2():
	print("GOIDA")
