class_name Bullet

extends Area2D


const SPEED = 650

func _process(delta: float) -> void:
	position.y -= SPEED * delta
	pass

func _on_area_entered(area: Area2D) -> void:
	print ("ded")
	queue_free()
	pass # Replace with function body.
