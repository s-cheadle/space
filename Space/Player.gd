extends KinematicBody

###EXPORTS
export var speed:float
export var rotation_speed:float

##ONREADYS
onready var velocity = Vector3.ZERO
onready var speed_label = $UI/Panel/ItemList/SpeedLabel
onready var orientation_label = $UI/Panel/ItemList/XYZLabel
onready var first_person_camera = $"1stPerson"
onready var third_person_camera = $"3rdPerson"
onready var active_camera = third_person_camera
onready var rotation_y = 0
onready var rotation_x = 0
onready var camera_anglev = 0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
	speed_label.text = str(velocity)
	orientation_label.text = str(translation)
	
func _physics_process(delta):
	if Input.is_action_pressed("accelerate"):
		velocity += -transform.basis.z * speed
	elif Input.is_action_pressed("decelerate"):
		velocity += transform.basis.z * speed
	else:
		velocity.z *= 0.9	
	
	if Input.is_action_pressed("forward"):
		velocity += transform.basis.y * speed
	elif Input.is_action_pressed("backward"):
		velocity += -transform.basis.y * speed
	else:
		velocity.y *= 0.9	
	
	if Input.is_action_pressed("right"):
		rotate_y(-rotation_speed * delta)
	elif Input.is_action_pressed("left"):
		rotate_y(rotation_speed * delta)
		
	move_and_collide(velocity * delta)
	
func _on_Camera_pressed():
	if	active_camera == first_person_camera:
		third_person_camera.make_current()
		active_camera = third_person_camera
	else:
		first_person_camera.make_current()		
		active_camera = first_person_camera
