extends MarginContainer
class_name Minimapa

#@export var player: Player
@export var zoom = 1.5:
	set = set_zoom

@onready var grilla = $ContenedorMapa/Grilla
@onready var marcador_jugador = $ContenedorMapa/Grilla/Botecito
@onready var marcador_malo = $ContenedorMapa/Grilla/Malo
@onready var marcador_alerta = $ContenedorMapa/Grilla/Cosas
@onready var player = $"../../Bote"

@onready var iconos = {
	"mob": marcador_malo,
	"alert": marcador_alerta
}

var escala_grilla
var marcadores = {}

func _ready():
	await get_tree().process_frame
	marcador_jugador.position = grilla.size / 2
	escala_grilla = grilla.size / (get_viewport_rect().size * zoom)
	var objetos_mapa = get_tree().get_nodes_in_group("miniobjetos_mapa")
	for objeto in objetos_mapa:
		var nuevo_marcador = iconos[objeto.minimap_icon].duplicate()
		grilla.add_child(nuevo_marcador)
		nuevo_marcador.show()
		marcadores[objeto] = nuevo_marcador

func _process(delta):
	if !player:
		return
	marcador_jugador.rotation = player.rotation + PI / 2
	for objeto in marcadores:
		var obj_pos = (objeto.position - player.position) * escala_grilla + grilla.size / 2
		if grilla.get_rect().has_point(obj_pos + grilla.position):
			marcadores[objeto].scale = Vector2(1, 1)
		else:
			marcadores[objeto].scale = Vector2(0.75, 0.75)
		obj_pos = obj_pos.clamp(Vector2.ZERO, grilla.size)
		marcadores[objeto].position = obj_pos
		
func _on_object_removed(object):
	if object in marcadores:
		marcadores[object].queue_free()
		marcadores.erase(object)

func set_zoom(value):
	zoom = clamp(value, 0.5, 5)
	escala_grilla = grilla.size / (get_viewport_rect().size * zoom)


func _on_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom += 0.1
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom -= 0.1
