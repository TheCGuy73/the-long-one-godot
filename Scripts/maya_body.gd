extends CharacterBody3D
@onready var head = $Camera3D
func _physics_process(delta: float) -> void:
	var direction = Vector3.ZERO
	if Input.is_action_pressed("forward_control"):
		direction += -transform.basis.z
	if Input.is_action_pressed("backward_control"):
		direction += transform.basis.z
	if Input.is_action_pressed("left_control"):
		direction += -transform.basis.x
	if Input.is_action_pressed("right_control"):
		direction += transform.basis.x
	velocity.y -= Global.gravity * delta
	
	
	if direction.length() > 0:
		velocity.x = direction.x * Global.speed
		velocity.z = direction.z * Global.speed
	else:
		velocity.x = move_toward(velocity.x, 0, Global.speed)
		velocity.z = move_toward(velocity.z, 0, Global.speed)
	
	move_and_slide()
	
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		head.rotate_x(deg_to_rad(-event.relative.y * Global.sensivity))
		rotate_y(deg_to_rad(-event.relative.x * Global.sensivity))
		
