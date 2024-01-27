# Air.gd
extends PlayerState

func enter(msg := {}) -> void:
	if msg.has("do_jump"):
		player.velocity.y = -player.PlayerJump


func physics_update(delta: float) -> void:
	if !player.stunned:
		# Vertical movement.
		player.velocity.y += player.GRAVITY * delta
		player.move_and_slide()

		if player.velocity.y > 0:
			player.anim.play("Fall_Animation")
		
		if not player.is_on_floor() && Input.is_action_pressed("attack"):
			state_machine.transition_to("Attack", {do_attack = true})
		
		# Landing.
		if player.is_on_floor():
			if is_equal_approx(player.velocity.x, 0.0):
				state_machine.transition_to("Idle")
				player.anim.play("Idle_Animation")
			else:
				state_machine.transition_to("Run")
				player.anim.play("Run_Animation")
