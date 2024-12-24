extends Area3D

@export var cold: float = 20:
	set(v):
		print(cold)
		
		if cold < -50:
			pass
		else:
			cold = v

@export var minus_cold: float = 0.1

func _on_timer_timeout() -> void:
	cold -= minus_cold

func _on_body_entered(body: Node3D) -> void:
	body.indoor()
