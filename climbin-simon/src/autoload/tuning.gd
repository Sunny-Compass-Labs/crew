extends Node
## All physics parameters live here -- the single source of truth.
## Gameplay code reads Tuning.params["x"]; the debug overlay writes via
## set_param(). Values dialed in on-device persist to user://tuning.json and
## export as text (export_text) to paste into docs/PLAYTEST.md so the
## physics-feel-tuner can adopt them as new defaults.

signal param_changed(param: String, value: float)

const SAVE_PATH := "user://tuning.json"

## Shipped values. physics-feel-tuner edits ONLY this table, and documents
## every change in docs/TUNING.md.
const DEFAULTS := {
	"gravity": 980.0,
	"engine_torque": 4000.0,
	"max_wheel_spin": 40.0,
	"brake_torque": 6000.0,
	"lean_torque": 9000.0,
	"wheel_friction": 1.2,
	"suspension_stiffness": 60.0,
	"suspension_damping": 2.5,
}

var params: Dictionary = DEFAULTS.duplicate()

func _ready() -> void:
	load_params()

func set_param(param: String, value: float) -> void:
	params[param] = value
	param_changed.emit(param, value)
	save_params()

func reset_to_defaults() -> void:
	params = DEFAULTS.duplicate()
	save_params()

func save_params() -> void:
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(params, "\t"))

func load_params() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		return
	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file == null:
		return
	var data: Variant = JSON.parse_string(file.get_as_text())
	if data is Dictionary:
		for key in DEFAULTS:
			if data.has(key):
				params[key] = float(data[key])

func export_text() -> String:
	return JSON.stringify(params, "\t")
