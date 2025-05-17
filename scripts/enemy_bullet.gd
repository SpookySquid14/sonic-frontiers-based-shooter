extends Area2D

const SPEED = 200

func _process(delta: float) -> void:
	position.y += SPEED * delta

func _on_area_entered(area: Area2D) -> void:
	print ("HIT" + String(area.name))
	queue_free()
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	body.lose_a_life()
	pass # Replace with function body.
