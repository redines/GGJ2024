# Air.gd
extends PlayerState

func enter(msg := {}) -> void:
	if msg.has("do_attack"):
		player.velocity.y = -player.PlayerJump

func physics_update(delta: float) -> void:

	var input_direction_x: float = (
		Input.get_action_strength("move_right")
		- Input.get_action_strength("move_left")
	)
	player.velocity.x = player.PlayerSpeed * input_direction_x
	player.velocity.y += player.GRAVITY * delta
	player.move_and_slide()

	# Landing.
	if player.is_on_floor():
		if is_equal_approx(player.velocity.x, 0.0):
			state_machine.transition_to("Idle")
		else:
			state_machine.transition_to("Run")
