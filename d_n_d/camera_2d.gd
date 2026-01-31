extends Camera2D

@export var move_speed: float = 400.0
@export var zoom_speed: float = 0.05
@export var min_zoom: float = 0.5
@export var max_zoom: float = 2.0

func _process(delta):
	var direction = Vector2.ZERO

	# Movement (WASD)
	if Input.is_key_pressed(KEY_W):
		direction.y -= 1
	if Input.is_key_pressed(KEY_S):
		direction.y += 1
	if Input.is_key_pressed(KEY_A):
		direction.x -= 1
	if Input.is_key_pressed(KEY_D):
		direction.x += 1

	if direction != Vector2.ZERO:
		position += direction.normalized() * move_speed * delta

	# Zoom (Q / E)
	if Input.is_key_pressed(KEY_Q):
		zoom -= Vector2.ONE * zoom_speed
	if Input.is_key_pressed(KEY_E):
		zoom += Vector2.ONE * zoom_speed

	# Clamp zoom
	zoom.x = clamp(zoom.x, min_zoom, max_zoom)
	zoom.y = clamp(zoom.y, min_zoom, max_zoom)
