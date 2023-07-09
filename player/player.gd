extends CharacterBody2D
var dogTexture = preload("res://sprites/dog-Sheet.png")
@export var normalSpeed = 200
@export var decreasedSpeed = 150
@onready var sprite = $Sprite2D
@onready var animation = $AnimationPlayer
var isSlow=0


func handleInput():
	var moveDirection=Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	var speed=normalSpeed
	if (isSlow>0):
		isSlow-=1
	if (get_meta("isDog")||isSlow>0):
		speed=decreasedSpeed
	velocity=moveDirection*speed
	if (moveDirection.length())!=0:
		sprite.rotation=moveDirection.angle()+PI/2

func _physics_process(delta):
	handleInput()
	move_and_slide()
	for i in get_slide_collision_count():
		var collider:Node2D = get_slide_collision(i).get_collider()
		if (collider.get_meta("isDog")==true):
			print("I collided with Dog")
			isSlow=10000
			position = get_slide_collision(i).get_position()
			collider.queue_free()
			set_meta("isDog", true)
			print($Sprite2D.get("texture"))
			$Sprite2D.texture=dogTexture
			$Sprite2D.get_child(1).visible=true
			scale=Vector2(2,2)
		elif (collider.get_meta("isTrap")==true):
			isSlow=60
			collider.queue_free()
			print("I collided with Trap")
		elif (collider.get_meta("isEnemy")==true):
			return
			#print("I collided with Enemy")

func _ready():
	animation.play("default")
	pass


