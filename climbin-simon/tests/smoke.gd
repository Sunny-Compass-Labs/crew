extends SceneTree
## Headless smoke test: every script compiles, the level registry is valid,
## every registered scene loads, the main scene loads.
## Run:  godot --headless --path . --script tests/smoke.gd
## CI also does a real boot (autoloads + main scene) via --quit-after.

const REQUIRED_LEVEL_KEYS := ["id", "name", "scene", "skill", "par_time", "twist"]

func _initialize() -> void:
	var failures: PackedStringArray = []

	for script_path in _gd_files("res://src"):
		var script: GDScript = load(script_path)
		if script == null or not script.can_instantiate():
			failures.append("script failed to load/compile: " + script_path)

	var file := FileAccess.open("res://src/levels/levels.json", FileAccess.READ)
	if file == null:
		failures.append("levels.json missing")
	else:
		var data: Variant = JSON.parse_string(file.get_as_text())
		if not (data is Dictionary and data.get("levels") is Array and data["levels"].size() > 0):
			failures.append("levels.json malformed or empty")
		else:
			for level in data["levels"]:
				for key in REQUIRED_LEVEL_KEYS:
					if not level.has(key):
						failures.append("level missing key '%s': %s" % [key, str(level)])
				if not (load(str(level.get("scene", ""))) is PackedScene):
					failures.append("level scene failed to load: " + str(level.get("scene")))

	if not (load("res://src/main.tscn") is PackedScene):
		failures.append("main.tscn failed to load")

	if failures.is_empty():
		print("SMOKE OK")
		quit(0)
	else:
		for failure in failures:
			printerr("SMOKE FAIL: " + failure)
		quit(1)

func _gd_files(dir_path: String) -> PackedStringArray:
	var result: PackedStringArray = []
	var dir := DirAccess.open(dir_path)
	if dir == null:
		return result
	dir.list_dir_begin()
	var entry := dir.get_next()
	while entry != "":
		var path := dir_path + "/" + entry
		if dir.current_is_dir():
			result.append_array(_gd_files(path))
		elif entry.ends_with(".gd"):
			result.append(path)
		entry = dir.get_next()
	dir.list_dir_end()
	return result
