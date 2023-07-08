extends CharacterBody2D
@export var speed = 175
@onready var sprite = $Sprite2D
@onready var animation = $AnimationPlayer
@onready var player:Node =  get_node("../Player")

func handleInput():
	var moveDirection=(player.global_position-position).normalized()
	velocity=moveDirection*speed
	if (moveDirection.length())!=0:
		sprite.rotation=moveDirection.angle()+PI/2

func _physics_process(delta):
	handleInput()
	move_and_slide()

func _ready():
	animation.play("default")
	pass
