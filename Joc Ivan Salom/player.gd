extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const MAXFALLSPEED = 300
const MAXSPEED = 200
const JUMPFORCE = 700
const ACCELERATION = 50


var motion = Vector2()

func _ready():
	pass

func _physics_process(delta):
	
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	motion.x = clamp(motion.x,-MAXSPEED,MAXSPEED)
	
	if Input.is_action_pressed("right"):
		motion.x += ACCELERATION
	elif Input.is_action_pressed("left"):
		motion.x -= ACCELERATION
	else:
		motion.x = lerp(motion.x,0,0.2)
		
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMPFORCE

	motion = move_and_slide(motion, UP)
