class_name BotonHotKeyRebind
extends Control

@onready var label: Label = $HBoxContainer/Label as Label
@onready var button: Button = $HBoxContainer/Button as Button

@export var nombre_accion : String = "w"


func _ready():
	set_process_unhandled_key_input(false)
	asignar_nombre_accion()
	asignar_texto_para_boton()
	cargar_keybinds()

func cargar_keybinds() -> void:
	reescribir_accion_boton(ContenedorConfiguracion.obtener_keybind(nombre_accion))

func asignar_nombre_accion() -> void:
	label.text = "No asignado"
	
	match nombre_accion:
		"w":
			label.text = "Mover arriba"
		"s":
			label.text = "Mover abajo"
		"a":
			label.text = "Mover izquierda"
		"d":
			label.text = "Mover derecha"
		"espacio":
			label.text = "Salto"
		"control":
			label.text = "Ataque"

func asignar_texto_para_boton() -> void:
	var eventos_accion = InputMap.action_get_events(nombre_accion)
	var evento_accion = eventos_accion[0]
	var accion_codigo_boton = OS.get_keycode_string(evento_accion.physical_keycode)
	
	button.text = "%s" % accion_codigo_boton

func _cuando_boton_alternado(apretado: bool) -> void:
	if apretado:
		button.text = "Presione cualquier tecla..."
		set_process_unhandled_key_input(apretado)
		
		for i in get_tree().get_nodes_in_group("boton_tecla"):
			if i.nombre_accion != self.nombre_accion:
				i.button.toggle_mode = false
				i.set_process_unhandled_key_input(false)
	else:
		for i in get_tree().get_nodes_in_group("boton_tecla"):
			if i.nombre_accion != self.nombre_accion:
				i.button.toggle_mode = true
				i.set_process_unhandled_key_input(false)
		asignar_texto_para_boton()

func _unhandled_key_input(event: InputEvent) -> void:
	reescribir_accion_boton(event)
	button.button_pressed = false

func reescribir_accion_boton(event: InputEvent) -> void:
	InputMap.action_erase_events(nombre_accion)
	InputMap.action_add_event(nombre_accion, event)
	ContenedorConfiguracion.asignar_keybind(nombre_accion, event)
	
	set_process_unhandled_key_input(false)
	asignar_texto_para_boton()
	asignar_nombre_accion()
