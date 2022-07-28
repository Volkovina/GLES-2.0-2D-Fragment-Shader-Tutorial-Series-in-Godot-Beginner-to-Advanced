extends Sprite

var spriteRect = Vector2(texture.get_width(), texture.get_height())
var iMouseCoords: Vector2
#var iMouseClick: Vector2 # NOT İN USE IN SHADER
var leftClickCoords_Latest: Vector2

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		iMouseCoords = get_local_mouse_position()
		if iMouseCoords.x >= 0.0 - spriteRect.x/2 \
				and	iMouseCoords.x <= spriteRect.x - spriteRect.y/2\
				and iMouseCoords.y >= 0.0 - spriteRect.y/2 \
				and iMouseCoords.y <= spriteRect.y - spriteRect.y/2:
			iMouseCoords = Vector2(iMouseCoords.x + spriteRect.x/2
							, iMouseCoords.y +spriteRect.y/2)
			material.set_shader_param("iMouseCoords", iMouseCoords)
		if Input.is_action_pressed('LeftClick'):
			leftClickCoords_Latest = get_local_mouse_position() + spriteRect/2
			material.set_shader_param("leftClickCoords_Latest",leftClickCoords_Latest)

#	var getExist = material.get_shader_param("iMouseClick")
	if Input.is_action_pressed('LeftClick'):
#		iMouseClick = Vector2(1.0, getExist.y)
#		material.set_shader_param("iMouseClick",iMouseClick)
		leftClickCoords_Latest = get_local_mouse_position() + spriteRect/2
		material.set_shader_param("leftClickCoords_Latest",leftClickCoords_Latest)
	if Input.is_action_just_released('LeftClick'):
#		iMouseClick = Vector2(0.0, getExist.y)
#		material.set_shader_param("iMouseClick",iMouseClick)
		leftClickCoords_Latest = get_local_mouse_position() + spriteRect/2
		material.set_shader_param("leftClickCoords_Latest",leftClickCoords_Latest)
#	material.set_shader_param("iMouseClick",iMouseClick)
