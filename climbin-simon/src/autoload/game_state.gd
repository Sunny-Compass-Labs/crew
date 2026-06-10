extends Node
## Level flow: which level is loaded, the run timer, instant restart.
## The timer starts on first throttle input (begin_riding), not on scene load,
## so staring at the start gate never costs time.

enum State { MENU, READY, RIDING, FINISHED, CRASHED }

const LEVELS_PATH := "res://src/levels/levels.json"
const MENU_SCENE := "res://src/main.tscn"

var state: State = State.MENU
var current_level: Dictionary = {}
var elapsed: float = 0.0
var levels: Array = []

func _ready() -> void:
	levels = _load_registry()
	set_process(false)

func start_level(level: Dictionary) -> void:
	current_level = level
	_reset_run()
	get_tree().change_scene_to_file(level["scene"])

func restart() -> void:
	_reset_run()
	get_tree().reload_current_scene()

func begin_riding() -> void:
	if state == State.READY:
		state = State.RIDING
		set_process(true)

func finish() -> void:
	state = State.FINISHED
	set_process(false)

func crash() -> void:
	state = State.CRASHED
	set_process(false)

func back_to_menu() -> void:
	state = State.MENU
	set_process(false)
	get_tree().change_scene_to_file(MENU_SCENE)

func _process(delta: float) -> void:
	if state == State.RIDING:
		elapsed += delta

func _reset_run() -> void:
	elapsed = 0.0
	state = State.READY

func _load_registry() -> Array:
	var file := FileAccess.open(LEVELS_PATH, FileAccess.READ)
	if file == null:
		push_error("levels.json missing at " + LEVELS_PATH)
		return []
	var data: Variant = JSON.parse_string(file.get_as_text())
	if data is Dictionary and data.get("levels") is Array:
		return data["levels"]
	push_error("levels.json malformed")
	return []
