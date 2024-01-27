# Run.gd
extends PlayerState

func physics_update(delta: float) -> void:

	var input_direction_x: float = (
		Input.get_action_strength("move_right")
		- Input.get_action_strength("move_left")
	)
	
	player.velocity.x = player.PlayerSpeed * input_direction_x
	player.velocity.y += player.GRAVITY * delta
	player.move_and_slide()
	
	if Input.is_action_just_pressed("jump"):
		state_machine.transition_to("Air", {do_jump = true})
		#player.JumpSound.play()
	elif is_equal_approx(input_direction_x, 0.0):
		state_machine.transition_to("Idle")
