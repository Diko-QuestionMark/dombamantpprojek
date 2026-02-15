extends Node2D

var in_tree = false
var max_grow = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	interact_tree()
	print(max_grow)
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
	if in_tree and !max_grow:
		$Player/Label/Label.visible = true
		if Input.is_action_just_pressed("shoot"):
			$Pohon/AnimatedSprite2D.frame += 1
			if $Pohon/AnimatedSprite2D.frame == 5:
				max_grow = true
	else:
		$Player/Label/Label.visible = false
