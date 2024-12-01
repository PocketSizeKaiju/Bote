extends Area3D

func _cuando_entra_un_cuerpo(_body_rid: RID, _body: Node, _body_shape_index: int, _local_shape_index: int) -> void:
	if _body.name == "Bote":
		HudJugador.visible = true
		get_tree().change_scene_to_file("res://ActionAdventure/playground.tscn")
