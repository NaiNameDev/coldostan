extends "res://trees/levels/1/Script/indoor.gd"

func _ready() -> void:
	set_bus([r2test1, r2test2])

func r2test1():
	print("rm2")
func r2test2():
	print("kill me")
