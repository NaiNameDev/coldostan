extends CharacterBody3D

@export var cold: float = 38
var min_cold: float = -51
var in_door: bool = true

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

func _ready() -> void:
	GlobalCold.connect("cold_signal", cold_update)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	move()
	
	move_and_slide()

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("DBG_reload"): # DEBUG
		death()

func move():
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	var input_dir := Input.get_vector("left", "right", "forward", "backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

func cold_update():
	if cold > min_cold:
		cold -= abs(min_cold * 0.01)
	else:
		cold += abs(min_cold * 0.01)

func indoor(flw: float):
	in_door = true
	min_cold = flw

func outdoor(flw: float):
	in_door = false
	min_cold = flw

func death():
	get_tree().reload_current_scene()
