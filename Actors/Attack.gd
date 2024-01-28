extends PlayerState

var input_direction: Vector2

func enter(msg := {}) -> void:
	if msg.has("do_attack"):
		player.anim.play("Attack_Animation")
		player.attacksound.play()

func physics_update(_delta) -> void:
	if !player.stunned:

		var input_direction_x: float = (
			Input.get_action_strength("move_right")
			- Input.get_action_strength("move_left")
		)
			
		player.velocity.x = player.PlayerAttack * input_direction_x
		player.set_velocity(player.velocity)
		player.set_up_direction(Vector2.UP)
		player.move_and_slide()
		
	if not player.is_on_floor():
		state_machine.transition_to("Air")
	elif player.is_on_floor() && Vector2.ZERO:
		player.DashAmount = 1
		state_machine.transition_to("Idle")
		
	if player.is_on_floor() && Input.is_action_just_pressed("jump"):
		state_machine.transition_to("Air", {do_jump = true})
		player.jumpSound.play()
	elif Vector2.ZERO:
		state_machine.transition_to("Idle")
	elif Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		state_machine.transition_to("Run")
