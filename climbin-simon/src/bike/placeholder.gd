extends RigidBody2D
## M0 placeholder so the skeleton is interactive end-to-end: a rolling ball
## driven by the throttle/brake actions, drawn in code from the palette.
## Replaced by the real bike rig in M1 (docs/BACKLOG.md task 2).

const RADIUS := 20.0

func _draw() -> void:
	draw_circle(Vector2.ZERO, RADIUS, Palette.BIKE)

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("throttle"):
		GameState.begin_riding()
		apply_torque(Tuning.params["engine_torque"])
	elif Input.is_action_pressed("brake"):
		apply_torque(-Tuning.params["brake_torque"])
