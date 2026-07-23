extends CharacterBody2D


const SPEED = 280.0
const JUMP_VELOCITY = -350.0
var current_jumps = 0
const GRAVITY = 1000
@onready var coyote_timer: Timer = $CoyoteTimer


func _physics_process(delta: float) -> void:
	var was_on_floor = is_on_floor()
	# Add the gravity.
	if not is_on_floor() and coyote_timer.is_stopped():
		velocity += get_gravity() * delta
	# Handle jump(s).
	if Input.is_action_just_released("ui_accept") and current_jumps < 1 and !is_on_floor():
		velocity.y = JUMP_VELOCITY / 4
	
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor() or current_jumps < 1:
			velocity.y = JUMP_VELOCITY
			current_jumps += 1
			coyote_timer.stop()
			
	if is_on_floor():
		current_jumps = 0
	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if direction < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if was_on_floor and !is_on_floor():
		coyote_timer.start()
		if was_on_floor and !Input.is_action_just_pressed("ui_accept"):
			current_jumps = -1
