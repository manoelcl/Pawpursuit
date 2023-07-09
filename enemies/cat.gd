extends CharacterBody2D
@export var normalSpeed = 175
@export var decreasedSpeed = 125
@onready var sprite = $Sprite2D
@onready var animation = $AnimationPlayer
@onready var player:Node =  get_node("../Player")
var isSlow=0

func handleInput():
	var moveDirection=(player.global_position-position).normalized()	
	var speed=normalSpeed
	if (isSlow>0):
		isSlow-=1
	if (get_meta("isDog")||isSlow>0):
		speed=decreasedSpeed
	if (player.get_meta("isDog")):
		moveDirection=moveDirection*-1
	velocity=moveDirection*speed
	
	if (moveDirection.length())!=0:
		sprite.rotation=moveDirection.angle()+PI/2

func _physics_process(delta):
	handleInput()
	move_and_slide()
	for i in get_slide_collision_count():
		var collider:Node2D = get_slide_collision(i).get_collider()
		if (collider.get_meta("isTrap")==true):
			isSlow+=60
			collider.queue_free()
			print("Cat collided with Trap")

func _ready():
	animation.play("default")
	pass
