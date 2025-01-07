extends Camera3D

var rotation_speed = 0.05   # Velocidad de rotación
var move_speed = 5.0        # Velocidad de movimiento

func _physics_process(delta: float):
	# Rotación con las teclas de dirección
	if Input.is_action_pressed("ui_left"):
		rotate_y(-rotation_speed)
	if Input.is_action_pressed("ui_right"):
		rotate_y(rotation_speed)
	if Input.is_action_pressed("ui_up"):
		rotate_x(rotation_speed)
	if Input.is_action_pressed("ui_down"):
		rotate_x(-rotation_speed)

	# Movimiento en el espacio 3D
	var direction = Vector3.ZERO
	if Input.is_action_pressed("move_forward"):  # Avanzar
		direction -= transform.basis.z
	if Input.is_action_pressed("move_backward"): # Retroceder
		direction += transform.basis.z
	if Input.is_action_pressed("move_left"):     # Mover a la izquierda
		direction -= transform.basis.x
	if Input.is_action_pressed("move_right"):    # Mover a la derecha
		direction += transform.basis.x
	if Input.is_action_pressed("move_up"):       # Mover hacia arriba
		direction += transform.basis.y
	if Input.is_action_pressed("move_down"):     # Mover hacia abajo
		direction -= transform.basis.y

	# Normalizar la dirección y aplicar movimiento
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		global_transform.origin += direction * move_speed * delta
