class_name CelestialBody
extends RigidBody

export var radius:float
export var initialVelocity:Vector3
export var day_speed:float
var currentVelocity

func _ready():
	$CollisionShape.shape.radius = radius
	$CollisionShape/MeshInstance.mesh.radius = radius
	$CollisionShape/MeshInstance.mesh.height = radius * 2
	
	currentVelocity = initialVelocity
	
func update_velocity(allBodies,timeStep):
	for otherBody in allBodies:
		if otherBody != self:
			var sqrDst = (otherBody.translation - translation).length_squared()
			var forceDir = (otherBody.translation - translation).normalized()
			var force = forceDir * gravity_scale * mass * otherBody.mass / sqrDst
			var acceleration = force/mass
			currentVelocity += acceleration * timeStep
	
func update_position(delta):
	currentVelocity *= delta
	
func _integrate_forces(_state):
	add_torque(Vector3(0,day_speed,0))
	apply_central_impulse(currentVelocity)
	#angular_velocity = Vector3(0,day_speed,0)
