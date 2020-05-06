extends KinematicBody2D

var motion = Vector2(0, 0)

const SPEED = 1000
const GRAVITY = 300
const UP = Vector2(0, -1)
const JUMP_SPEED = 3000

signal animate

func _physics_process(delta):
	move_and_slide(motion, UP)
	apply_gravity()
	jump()
	move()
	animate()


func apply_gravity():
	if !is_on_floor():
		motion.y += GRAVITY
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y = 0

func jump():
	if Input.is_action_pressed("jump") && is_on_floor():
		motion.y -= JUMP_SPEED

func move():
	if Input.is_action_pressed("left") && !Input.is_action_pressed("right"):
		motion.x = -SPEED

	elif Input.is_action_pressed("right") && !Input.is_action_pressed("left"):
		motion.x = SPEED
	else:
		motion.x = 0

func animate():
	emit_signal("animate", motion)
	
	
