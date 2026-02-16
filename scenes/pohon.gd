extends Area2D

var in_tree = false
var max_grow = false
@onready var playerLabel = $"../Player/Label/Label"

func _process(_delta: float) -> void:
	interact_tree()
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		in_tree = true
		print("Masuk")


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		in_tree = false
		playerLabel.visible = false
		print("Keluar")


func interact_tree():
	if in_tree:
		var spritePohon = $AnimatedSprite2D
		if spritePohon.frame == 5:
			max_grow = true
		if !max_grow:
			playerLabel.visible = true
			if Input.is_action_just_pressed("shoot"):
				spritePohon.frame += 1
		else:
			playerLabel.visible = false
