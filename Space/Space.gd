extends Node

var bodies = []
onready var gravitationalConstant = 0.0001
onready var physicsTimeStep = 0.01

export var environment:Environment

func _ready():
	for child in get_children():
		if child.is_in_group("celestial_bodies"):
			bodies.append(child)
	print(bodies)
	
func _physics_process(delta): 
	for body in bodies:
		body.update_velocity(bodies,delta)
		body.update_position(delta)

