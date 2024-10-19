extends Area3D

const VELOCIDAD_ROTACION = 1.5
@export var file_path: String

@onready var audio_moneda: AudioStreamPlayer2D = $AudioMoneda as AudioStreamPlayer2D
@onready var audio_tripulante: AudioStreamPlayer2D = $AudioTripulante as AudioStreamPlayer2D
@onready var collision_shape_3d: CollisionShape3D = $CollisionShape3D as CollisionShape3D

func _ready():
	if(audio_moneda): audio_moneda.finished.connect(cuando_termina_sfx)
	if(audio_tripulante): audio_tripulante.finished.connect(cuando_termina_sfx)

func cuando_termina_sfx() -> void:
	queue_free()

func _process(delta):
	rotate_y(deg_to_rad(VELOCIDAD_ROTACION))

func _cuando_entra_un_cuerpo(body_rid, body, body_shape_index, local_shape_index):
	if(body.name == "Bote"):
		if(name.to_upper().contains("MONEDA")):
			body.actualizar_tesoro()
			audio_moneda.play()
		else:
			body.actualizar_tripulacion(file_path.get_file())
			audio_tripulante.play()
		hide()
		collision_shape_3d.set_deferred("disabled", true)


func _estoy_listo():
	var mesh_instance = $MeshInstance3D #.get_mesh()
	var material = StandardMaterial3D.new() #mesh_instance.surface_get_material(0)
	var texture = load(file_path) as Texture
	material.albedo_texture = texture
	mesh_instance.material_override = material  
