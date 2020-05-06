extends KinematicBody2D

var motion = Vector2(0, 0)

const SPEED = 1000
const GRAVITY = 300
const UP = Vector2(0, -1)
const JUMP_SPEED = 3000
const WORLD_LIMIT = 3000


func _physics_process(delta):
	move_and_slide(motion, UP)
	apply_gravity()
	jump()
	move()


func apply_gravity():
	if position.y > WORLD_LIMIT:
		end_game()
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

func end_game():
	get_tree().change_scene("res://Scenes/Levels/EndGame.tscn")
	
