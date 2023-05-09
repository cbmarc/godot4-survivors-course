class_name HurtboxComponent extends Area2D

@export var health_component: Node


func _ready():
	area_entered.connect(on_area_entered)
	

func on_area_entered(other_area: Area2D):
	if not other_area is HitboxComponent:
		return
	
	if health_component == null:
		return
		
	var hitbox_component = other_area as HitboxComponent
	(health_component as HealthComponent).damage(hitbox_component.damage)
