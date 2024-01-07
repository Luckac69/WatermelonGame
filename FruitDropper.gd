extends Node2D


var fruit_prefab = preload("res://Fruit.tscn")

var gravity = ProjectSettings.get_setting("phycics/2d/default_gravity")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y = 100
	if (position.x < 300):
		position.x = 300
	if(position.x > 800):
		position.x = 800

func get_input():
	var direction = Input.get_axis("Left","Right") 
	if (Input.get_action_strength("Fruit")):
		create_fruit()
	position.x += direction * 600 * get_process_delta_time()




func _physics_process(delta):
	get_input()
	


func create_fruit():
	var fruit = fruit_prefab.instantiate()
	get_parent().add_child(fruit)
	fruit.position = position
