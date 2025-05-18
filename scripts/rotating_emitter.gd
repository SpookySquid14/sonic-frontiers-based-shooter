extends Node2D

@export var bullet: PackedScene
@onready var timer: Timer = $Timer
var color:= 0
const ROT_SPEED = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate(deg_to_rad(ROT_SPEED*delta))
	pass


func _on_timer_timeout() -> void:
	shoot_bullet(color)
	pass # Replace with function body.

func shoot_bullet(col: int):
	var bullet_shot = bullet.instantiate()
	if col == 0:
		bullet_shot.collision_layer = 0b10
		bullet_shot.collision_mask = 0b11
		bullet_shot.modulate = Color("White")
	elif col == 1:
		bullet_shot.collision_layer = 0b100
		bullet_shot.collision_mask = 0b101
		bullet_shot.modulate = Color("Black")
	get_parent().add_child(bullet_shot)
	bullet_shot.transform = global_transform
