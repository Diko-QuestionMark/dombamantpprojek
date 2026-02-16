extends AnimatedSprite2D

@export var grow_time = 20

var is_growned = false
var in_area = false
@onready var labelPlayer = $"../Player/Label/Label"

func _ready() -> void:
	$GrowTime.start(randf_range(grow_time * 0.8, grow_time * 1.2))


func _process(_delta: float) -> void:
	if is_growned:
		if in_area:
			labelPlayer.visible = true
			if Input.is_action_just_pressed("shoot"):
				frame = 0
				$GrowTime.start(randf_range(grow_time * 0.8, grow_time * 1.2))
				print("+ 1 Pumkin")
				is_growned = false
				labelPlayer.visible = false


func _on_grow_time_timeout() -> void:
	frame += 1
	if frame == 3:
		is_growned = true
		$GrowTime.stop()



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		in_area = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		in_area = false
		labelPlayer.visible = false
