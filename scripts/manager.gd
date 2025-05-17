extends Node

@onready var life_counter: Label = $Manager/LifeCounter
@onready var player: CharacterBody2D = $Player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	life_counter.text = ("Lives: " + str(player.lives))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_life_lost() -> void:
	life_counter.text = ("Lives: " + str(player.lives))
