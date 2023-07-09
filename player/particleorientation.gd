extends CPUParticles2D
@onready var sprite:Sprite2D = get_node("../..")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	angle_min=rad_to_deg(abs( sprite.rotation))
	angle_max=rad_to_deg(abs( sprite.rotation))
	pass
