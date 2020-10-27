extends RigidBody

var path:Path
var points:Array

onready var index = 0

var move_speed = 1
var day_speed = 1

var r = 75
var theta = PI / 4;


func _physics_process(delta):
	###DAY
	rotate_y(day_speed*delta)
	###YEAR
#	if !path:
#		return
#	var target = points[index]
#	if translation.distance_to(target) < 1:
#		index = wrapi(index + 1, 0, points.size())
#		target = points[index]
#	var velocity = (target - translation).normalized() * move_speed
#	move_and_slide(velocity)

