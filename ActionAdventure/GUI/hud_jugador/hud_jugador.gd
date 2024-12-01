extends CanvasLayer

var corazones: Array[CorazonGUI] = []

func _ready() -> void:
	if get_tree().get_current_scene().name != "playground":
		visible = false
	for corazon in $Control/HFlowContainer.get_children():
		if corazon is CorazonGUI:
			corazones.append(corazon)
			corazon.visible = false

func actualizar_hp(_hp: int, _max_hp: int) -> void:
	actualizar_hp_max(_max_hp)
	for i in _max_hp:
		actualizar_corazon(i, _hp)

func actualizar_corazon(_indice: int, _hp:int) -> void:
	var _valor: int = clampi(_hp-(_indice*2), 0, 1)
	corazones[_indice].valor = _valor

func actualizar_hp_max(_max_hp: int) -> void:
	var _cant_corazones: int = roundi(_max_hp*0.5)
	for i in corazones.size():
		corazones[i].visible = (i < _cant_corazones)
