extends Node2D

var in_tree = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	interact_tree()
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		in_tree = true
		print("Masuk")


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		in_tree = false
		print("Keluar")

func interact_tree():
	if Input.is_action_just_pressed("shoot") and in_tree == true:
		$Area2D/AnimatedSprite2D.frame += 1
