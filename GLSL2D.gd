extends Node2D

onready var selection = get_node('MenuForGLSL')
onready var textItem = \
			selection.get_node('PanelContainer/VBoxContainer/ItemList')
onready var camera = $Magnifier

var rectStandard: Vector2 = Vector2(200, 113)
var zoomArray: Array
var zoomIndexText: String
var rectArray: Array
var escape: bool = false
var cameraZoomFactor: Vector2 = Vector2(.158, .158)

func _ready() -> void:
	OS.window_maximized = true
	selection.connect("itemSelected", self, "goToSelected")
#	creating sprite centers array
	generateZoomArray(6, 113.0 / 2.0 + 3.5, 113 + 7, 5
								, 200.0 / 2.0 + 4.0, 200 + 7)
	generateRectArray()
	loopZoomArray()

func generateZoomArray(rowNo, rowStart, rowSpace
						, columnNo, columnStart, columnSpace) -> void:
	var location: Vector2
	for i in rowNo:
		for j in columnNo:
			location = Vector2(columnStart + columnSpace * j
									,rowStart + rowSpace * i)
			zoomArray.append(location)
#	coord of last member of itemlist is first coord member
	zoomArray[-1] = zoomArray[0]

func generateRectArray() -> void:
	for i in zoomArray.size() - 1:
		rectArray.append(Rect2(zoomArray[i] 
				- rectStandard / 2.0, rectStandard))

func loopZoomArray():
	camera.get_child(0).visible = true
	camera.get_child(1).visible = true
	for i in zoomArray.size():
		camera.position = zoomArray[i]
		camera.get_child(1).text = textItem.get_item_text(i)
		yield(get_tree().create_timer(1.0),"timeout")
		if escape:
			break
	zoomMainScreen()

func goToSelected(index, _text) -> void:
	camera.zoom = cameraZoomFactor
	camera.position = zoomArray[index]
	camera.get_child(1).text = textItem.get_item_text(index)
	camera.get_child(1).visible = true
	camera.get_child(0).visible = true
	camera.get_child(0).modulate.a = 1.0

func zoomMainScreen() -> void:
	camera.zoom = Vector2.ONE 
	camera.position = get_viewport_rect().size / 2.0 # screen center
	camera.get_child(0).visible = false # invisible escape notification
	camera.get_child(1).visible = false

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed('ui_cancel'):
		escape = true
		zoomMainScreen()
	if Input.is_action_just_pressed('LeftClick') \
			and camera.zoom == Vector2.ONE:
		# define a random value larger than the member qty of zoom array
		var windowRange: int = 1000 
		for i in rectArray.size():
			if rectArray[i].has_point(get_global_mouse_position()):
				windowRange = i
		if windowRange < zoomArray.size():
			goToSelected(windowRange,"dummy")
			pass
	if Input.is_action_just_pressed('ui_quit'):
		get_tree().quit()

func _process(delta: float) -> void:
#	soft disappearance of escape notification with delta
	if camera.get_child(0).visible:
		camera.get_child(0).modulate.a -=delta /6.0
