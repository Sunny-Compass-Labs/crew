extends Node2D
## Generic level root. Level scenes stay colorless -- the palette is applied
## here at runtime so art direction lives in exactly one file
## (src/autoload/palette.gd).

func _ready() -> void:
	RenderingServer.set_default_clear_color(Palette.SKY)
	for node in $Terrain.get_children():
		if node is Polygon2D:
			node.color = Palette.TERRAIN

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		GameState.restart()
	elif event.is_action_pressed("back"):
		GameState.back_to_menu()
