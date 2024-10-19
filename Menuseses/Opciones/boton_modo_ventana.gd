extends Control


@onready var option_button: OptionButton = $HBoxContainer/OptionButton as OptionButton

const ARRAY_MODO_VENTANA : Array[String] = [
	"Modo Ventana",
	"Ventana Completa",
	"Ventana sin Bordes",
	"Ventana Completa sin Bordes"
]

func _ready():
	agregar_items_modo_ventana()
	option_button.item_selected.connect(cuando_modo_ventana_selecctionado)
	cargar_datos()

func cargar_datos() -> void:
	cuando_modo_ventana_selecctionado(ContenedorConfiguracion.obtener_indice_modo_ventana())
	option_button.select(ContenedorConfiguracion.obtener_indice_modo_ventana())

func agregar_items_modo_ventana() -> void:
	for modoVentana in ARRAY_MODO_VENTANA:
		option_button.add_item(modoVentana)

func cuando_modo_ventana_selecctionado(indice : int) -> void:
	BusSenialConfiguracion.emitir_modo_ventana_seleccionado(indice)
	match indice:
		0:  #Modo Ventana
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		1: #Ventana completa
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		2: #Ventana sin Bordes
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		3: #Ventana Completa sin Bordes
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
