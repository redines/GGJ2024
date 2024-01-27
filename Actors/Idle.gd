extends PlayerState

func physics_update(delta: float) -> void:
	if !player.stunned:
		if not player.is_on_floor():
			state_machine.transition_to("Air")
			return

		var input_direction_x: float = (
			Input.get_action_strength("move_right")
			- Input.get_action_strength("move_left")
		)
		player.velocity.x = player.PlayerSpeed * input_direction_x
		player.velocity.y += player.GRAVITY * delta
		player.move_and_slide()

		if Input.is_action_just_pressed("jump"):
			state_machine.transition_to("Air", {do_jump = true})
		elif is_equal_approx(input_direction_x, 0.0):
			state_machine.transition_to("Idle")
