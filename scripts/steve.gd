extends CharacterBody3D

var playerName = "Kerby"
# put consts in ALL CAPS
const SPEED = 14
const ROTATION_SPEED = deg_to_rad(8.0)
# var characterVelocity = Vector3(0,0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	print(playerName)
	# pass

# Called 60 times a second (once per frame)
func _physics_process(_delta):
	if Input.is_action_pressed("ui_right") && Input.is_action_pressed("ui_left"):
		velocity.x = 0
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		rotate_z(-ROTATION_SPEED)
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		rotate_z(ROTATION_SPEED)
	else:
		# lerp() throws errors when not all arguments are the same
		# lerpf() somehow converts all to floats I believe
		velocity.x = lerpf(velocity.x,0,0.1)
	
	if Input.is_action_pressed("ui_up") && Input.is_action_pressed("ui_down"):
		velocity.z = 0
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -SPEED
		rotate_x(-ROTATION_SPEED)
	elif Input.is_action_pressed("ui_down"):
		velocity.z = SPEED
		rotate_x(ROTATION_SPEED)
	else:
		velocity.z = lerpf(velocity.z,0,0.1)
	move_and_slide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
# 	pass
