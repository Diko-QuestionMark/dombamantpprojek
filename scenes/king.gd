extends AnimatedSprite2D

var in_area = false
@onready var labelPlayer = $"../Player/Label/Label"

func _ready() -> void:
	pass 


func _process(_delta: float) -> void:
	pass


func _on_talk_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		in_area = true
		labelPlayer.visible = true


func _on_talk_area_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		in_area = false
		labelPlayer.visible = false
