class_name MenuPrincipal
extends Control

@onready var boton_inicio = $MarginContainer/HBoxContainer/VBoxContainer/BotonInicio as Button
@onready var boton_salir = $MarginContainer/HBoxContainer/VBoxContainer/BotonSalir as Button
@onready var boton_opciones = $MarginContainer/HBoxContainer/VBoxContainer/BotonOpciones as Button
@onready var menu_opciones = $menu_opciones as MenuOpciones
@onready var margin_container = $MarginContainer as MarginContainer


@onready var nivelInical = preload("res://mundo.tscn") as PackedScene

func _ready():
	manejar_coneccion_senales()


func cuando_inicio_apretado() -> void:
	get_tree().change_scene_to_packed(nivelInical)

func cuando_opciones_apretado() -> void:
	margin_container.visible = false
	menu_opciones.set_process(true)
	menu_opciones.visible = true

func cuando_salir_apretado() -> void:
	get_tree().quit()

func cuando_salir_menu_opciones() -> void:
	margin_container.visible = true
	menu_opciones.visible = false

func manejar_coneccion_senales() ->void:
	boton_inicio.button_up.connect(cuando_inicio_apretado)
	boton_opciones.button_up.connect(cuando_opciones_apretado)
	boton_salir.button_up.connect(cuando_salir_apretado) 
	menu_opciones.salir_menu_opciones.connect(cuando_salir_menu_opciones)
