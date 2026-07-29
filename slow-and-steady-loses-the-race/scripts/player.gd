extends CharacterBody2D


const SPEED = 280.0
const JUMP_VELOCITY = -350.0
var current_jumps = 0
const GRAVITY = 1000
var play_anim = true
@onready var coyote_timer: Timer = $CoyoteTimer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:\
	if global.failure == false:
		var was_on_floor = is_on_floor()
		_play_animations()
		# Add the gravity.
		if !is_on_floor() and coyote_timer.is_stopped():
			velocity += get_gravity() * delta
			animated_sprite_2d.play("jumping")
		# Handle jump(s).
		if Input.is_action_just_released("ui_accept") and current_jumps < 1 and !is_on_floor():
			animated_sprite_2d.play("jumping")
			velocity.y = JUMP_VELOCITY / 4
			play_anim = true
		
		if Input.is_action_just_pressed("ui_accept"):
			if is_on_floor() or current_jumps < 1:
				animated_sprite_2d.play("jumping")
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
				animated_sprite_2d.flip_h = true
			else:
				animated_sprite_2d.flip_h = false
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
	
		if was_on_floor and !is_on_floor():
			coyote_timer.start()
			if was_on_floor and !Input.is_action_just_pressed("ui_accept"):
				current_jumps = -1
				
func _play_animations() -> void:
	if velocity.x != 0 and velocity.y == 0:
		if animated_sprite_2d.animation != "running":
			animated_sprite_2d.play("running")
	elif velocity.y == 0:
		animated_sprite_2d.play("default")
