extends CharacterBody2D


const SPEED = 300.0
var x_direction : float
var y_direction : float
var lives := 3
@export var bullet: PackedScene
@onready var bullet_origin: Node2D = $BulletOrigin
signal life_lost
@onready var death_timer: Timer = $DeathTimer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot_white"):
		shoot_bullet(0)
	if event.is_action_pressed("shoot_black"):
		shoot_bullet(1)
		pass

func shoot_bullet(col: int):
	var bullet_shot = bullet.instantiate()
	if col == 0:
		bullet_shot.collision_layer = 0b10
		bullet_shot.collision_mask = 0b10
		bullet_shot.modulate = Color("White")
	elif col == 1:
		bullet_shot.collision_layer = 0b100
		bullet_shot.collision_mask = 0b100
		bullet_shot.modulate = Color("Black")
	owner.add_child(bullet_shot)
	bullet_shot.transform = bullet_origin.global_transform

func lose_a_life():
	lives -= 1
	life_lost.emit()
	if lives <= 0:
		die()

func die():
	animation_player.play("death")
	Engine.time_scale = .75
	death_timer.start()

func _process(delta: float) -> void:
	x_direction = Input.get_axis("move_left", "move_right")
	y_direction = Input.get_axis("move_up","move_down")
	if x_direction:
		velocity.x = x_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if y_direction:
		velocity.y = y_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()


func _on_death_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
	pass # Replace with function body.
