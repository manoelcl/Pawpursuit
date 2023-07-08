extends CharacterBody2D
@export var speed = 200
@onready var sprite = $Sprite2D

func handleInput():
	var moveDirection=Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity=moveDirection*speed
	if (moveDirection.length())!=0:
		sprite.rotation=moveDirection.angle()+PI/2
func _physics_process(delta):
	handleInput()
	move_and_slide()
