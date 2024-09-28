extends RigidBody3D

func _physics_process(delta):
	if $CollisionShape3D.global_transform.origin.y <= 0:
		apply_force(Vector3.UP*20*-$CollisionShape3D.global_transform.origin, $CollisionShape3D.global_transform.origin-global_transform.origin)

func _ready():
	apply_force(Vector3(randf_range(-200,200),randf_range(-200,200),randf_range(-200,200)))
	apply_torque(Vector3(randf_range(-1,2),randf_range(-20,20),randf_range(-2,2)))
