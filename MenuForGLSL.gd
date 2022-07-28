extends Node2D

signal itemSelected(index, text)

onready var itemList = $PanelContainer/VBoxContainer/ItemList

func _on_ItemList_item_selected(index: int) -> void:
	var text = $PanelContainer/VBoxContainer/ItemList.get_item_text(index)
	emit_signal('itemSelected', index, text)

