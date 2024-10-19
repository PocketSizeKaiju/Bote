class_name ContenedorTabConfiguracion
extends Control

@onready var tab_container: TabContainer = $TabContainer as TabContainer

signal Salir_Menu_Opciones

func _process(delta: float) -> void:
	input_menu_opciones()

func cambiar_tab(tab : int) -> void:
	tab_container.set_current_tab(tab)

func input_menu_opciones() -> void:
	if Input.is_action_just_pressed("d") or Input.is_action_just_pressed("ui_right"):
		if tab_container.current_tab >= tab_container.get_tab_count() - 1:
			cambiar_tab(0)
			return
		
		var proxima_tab = tab_container.current_tab + 1
		cambiar_tab(proxima_tab)
	if Input.is_action_just_pressed("a") or Input.is_action_just_pressed("ui_left"):
		if tab_container.current_tab == 0:
			cambiar_tab(tab_container.get_tab_count() - 1)
			return
		
		var tab_anterior = tab_container.current_tab - 1
		cambiar_tab(tab_anterior)
	
	if Input.is_action_just_pressed("ui_cancel"):
		Salir_Menu_Opciones.emit()
