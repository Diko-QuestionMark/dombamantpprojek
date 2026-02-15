extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -120.0
#var last_direction = 1
#var debug_check_position: Vector2

func _physics_process(delta: float) -> void:
	movement(delta)
	#check_tile_in_front()


func movement(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	#Handle Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	#Handle direction dan Move
	var direction := Input.get_axis("left", "right")
	if direction:
		#last_direction = direction
		$AnimatedSprite2D.play("walking")
		velocity.x = direction * SPEED
		if direction > 0:
			$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("idle")
	
	move_and_slide()


#func check_tile_in_front():
	#var tilemap = $"../TileMapLayer"
	#var offset = Vector2(12 * last_direction, 0)
	#var check_position = global_position + offset
	#debug_check_position = check_position
	#var cell = tilemap.local_to_map(tilemap.to_local(check_position))
	#if tilemap.get_cell_source_id(cell) != -1:
		#print("Tile ada di depan")
	#queue_redraw()


#func _draw() -> void:
	#draw_circle(to_local(debug_check_position), 0.4, Color.WHITE)
