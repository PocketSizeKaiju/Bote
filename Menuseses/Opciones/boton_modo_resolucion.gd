extends Control


@onready var option_button: OptionButton = $HBoxContainer/OptionButton as OptionButton

const DICCIONARIO_RESOLUCION : Dictionary = {
	"1152 x 648": Vector2i(1152, 648),
	"1280 x 720": Vector2i(1280, 720),
	"1920 x 1080": Vector2i(1920, 1080),
	"2 x 4": Vector2i(2, 4)
}

func _ready():
	agregar_items_resolucion()
	option_button.item_selected.connect(cuando_resolucion_seleccionada)
	cargar_datos()

func cargar_datos() -> void:
	cuando_resolucion_seleccionada(ContenedorConfiguracion.obtener_indice_resolucion())
	option_button.select(ContenedorConfiguracion.obtener_indice_resolucion())

func agregar_items_resolucion() -> void:
	for texto_tamanio_resolucion in DICCIONARIO_RESOLUCION:
		option_button.add_item(texto_tamanio_resolucion)

func cuando_resolucion_seleccionada(indice : int) -> void:
	BusSenialConfiguracion.emitir_resolucion_seleccionada(indice)
	DisplayServer.window_set_size(DICCIONARIO_RESOLUCION.values()[indice])
