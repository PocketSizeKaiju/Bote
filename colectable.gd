extends Area3D

const VELOCIDAD_ROTACION = 1.5
@export var file_path: String


func _process(delta):
	rotate_y(deg_to_rad(VELOCIDAD_ROTACION))

func _cuando_entra_un_cuerpo(body_rid, body, body_shape_index, local_shape_index):
	if(body.name == "Bote"):
		if(name.to_upper().contains("MONEDA")):
			body.actualizar_tesoro()
		else:
			body.actualizar_tripulacion(file_path.get_file())
		queue_free()


func _estoy_listo():
	var mesh_instance = $MeshInstance3D #.get_mesh()
	var material = StandardMaterial3D.new() #mesh_instance.surface_get_material(0)
	var texture = load(file_path) as Texture
	material.albedo_texture = texture
	mesh_instance.material_override = material  
