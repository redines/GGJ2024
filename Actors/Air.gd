# Air.gd
extends PlayerState

func enter(msg := {}) -> void:
	if msg.has("do_jump"):
		player.anim.play("Jump_Animation")
		player.velocity.y = -player.PlayerJump


func physics_update(delta: float) -> void:
	if !player.stunned:
		# Vertical movement.
		player.velocity.y += player.GRAVITY * delta
		player.move_and_slide()
		player.anim.play("Fall_Animation")
		
		# Landing.
		if player.is_on_floor():
			if is_equal_approx(player.velocity.x, 0.0):
				state_machine.transition_to("Idle")
				player.anim.play("Idle_Animation")
			else:
				state_machine.transition_to("Run")
				player.anim.play("Run_Animation")
