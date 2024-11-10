extends RigidBody3D

var movimiento_cursor = Vector2()

@export var tesoroTotal: int = 0


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(evento):
	if evento is InputEventMouseMotion:
		movimiento_cursor += evento.relative

func _physics_process(_delta):
	if movimiento_cursor != Vector2():
		$H.rotation_degrees.y -= movimiento_cursor.x
		$H/V.rotation_degrees.x -= movimiento_cursor.y
		if $H/V.rotation_degrees.x <= -90:
			$H/V.rotation_degrees.x = -90
		if $H/V.rotation_degrees.x >= 0:
			$H/V.rotation_degrees.x = 0
		movimiento_cursor = Vector2()
	
	if global_transform.origin.y <= 0.1:
		if Input.is_action_just_pressed("espacio"):
			apply_central_force(global_transform.basis * Vector3.UP*500)
		if Input.is_action_pressed("w"):
			apply_central_force(global_transform.basis * Vector3.FORWARD*20)
			if Input.is_action_pressed("a"):
				apply_torque(Vector3(0,10,0))
			if Input.is_action_pressed("d"):
				apply_torque(Vector3(0,-10,0))
		elif Input.is_action_pressed("s"):
			apply_central_force(global_transform.basis * Vector3.BACK*10)
			if Input.is_action_pressed("a"):
				apply_torque(Vector3(0,10,0))
			if Input.is_action_pressed("d"):
				apply_torque(Vector3(0,-10,0))
	
	if $GrupoFloty/Floatadores.global_transform.origin.y <= 0:
		apply_force(Vector3.UP*20*-$GrupoFloty/Floatadores.global_transform.origin, $GrupoFloty/Floatadores.global_transform.origin-global_transform.origin)
	if $GrupoFloty/Floatadores2.global_transform.origin.y <= 0:
		apply_force(Vector3.UP*20*-$GrupoFloty/Floatadores2.global_transform.origin, $GrupoFloty/Floatadores2.global_transform.origin-global_transform.origin)
	if $GrupoFloty/Floatadores3.global_transform.origin.y <= 0:
		apply_force(Vector3.UP*20*-$GrupoFloty/Floatadores3.global_transform.origin, $GrupoFloty/Floatadores3.global_transform.origin-global_transform.origin)
	if $GrupoFloty/Floatadores4.global_transform.origin.y <= 0:
		apply_force(Vector3.UP*20*-$GrupoFloty/Floatadores4.global_transform.origin, $GrupoFloty/Floatadores4.global_transform.origin-global_transform.origin)


func actualizar_tesoro():
	tesoroTotal += 1
	$UI/Plata.text = "$$: " + str(tesoroTotal)

func actualizar_tripulacion(nombre):
	var tripulante = nombre.substr(0, nombre.length() - 4)
	if(tripulante.contains("perritos")):
		var nodoPerrito1 = get_node("Tripulacion/Perritos1")
		if(nodoPerrito1.visible):
			tripulante = "Perritos2"
		else:
			tripulante = "Perritos1"
	var nodoTripulante = get_node("Tripulacion/" + tripulante)
	nodoTripulante.visible = true
