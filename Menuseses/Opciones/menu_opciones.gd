class_name MenuOpciones
extends Control

@onready var boton_salir = $MarginContainer/VBoxContainer/BotonSalir as Button

signal salir_menu_opciones

func _ready():
	boton_salir.button_down.connect(cuando_salir_apretado)
	set_process(false)

func cuando_salir_apretado() -> void:
	salir_menu_opciones.emit()
	set_process(false)
