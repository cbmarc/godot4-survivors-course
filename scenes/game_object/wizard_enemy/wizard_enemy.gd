extends CharacterBody2D

@onready var velocity_component = $VelocityComponent
@onready var visuals = $Visuals

func _process(delta):
	velocity_component.accelerate_to_player()
	velocity_component.move(self)
	
	var move_sign = sign(velocity)
	if move_sign.x != 0:
		visuals.scale = Vector2(-move_sign.x, 1)
	
