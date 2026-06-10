extends Control
## Level picker. Intentionally bare -- no menus beyond this until the vertical
## slice is fun on the founder's phone (CLAUDE.md, principle 1). UI is built in
## code so the art stays in palette.gd and text files.

func _ready() -> void:
	RenderingServer.set_default_clear_color(Palette.SKY)

	var box := VBoxContainer.new()
	box.add_theme_constant_override("separation", 24)

	var title := Label.new()
	title.text = "CLIMBIN' SIMON"
	title.add_theme_color_override("font_color", Palette.ACCENT)
	title.add_theme_font_size_override("font_size", 72)
	box.add_child(title)

	for level in GameState.levels:
		var button := Button.new()
		button.text = "%s  --  %s" % [level["name"], level["skill"]]
		button.add_theme_font_size_override("font_size", 32)
		button.pressed.connect(GameState.start_level.bind(level))
		box.add_child(button)

	add_child(box)
	box.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
