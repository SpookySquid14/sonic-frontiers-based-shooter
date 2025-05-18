extends Node2D

@onready var life_counter: Label = $Manager/LifeCounter
@onready var player: CharacterBody2D = $Player
@export var rotating_emitter: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	life_counter.text = ("Lives: " + str(player.lives))
	create_rotator(Vector2(144,80),0)
	create_rotator(Vector2(1008,80),1)
	pass # Replace with function body.

func create_rotator(pos: Vector2, color: int):
	var rot_emitter = rotating_emitter.instantiate()
	print(pos)
	rot_emitter.color = color
	add_child(rot_emitter)
	rot_emitter.transform = global_transform
	rot_emitter.position = pos
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_life_lost() -> void:
	life_counter.text = ("Lives: " + str(player.lives))
