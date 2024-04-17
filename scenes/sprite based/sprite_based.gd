extends Node2D

@export var some_texture : Texture

var instances : int = 50_000
var frame_counter : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#generate_sprite_random_position()
	generate_sprite_fixed_position()
	Signals.update_object_counter.emit(instances)
	pass # Replace with function body.

func generate_sprite_random_position() -> void:
	var viewport_dimensions : Vector2 = get_viewport_rect().end
	var rng = RandomNumberGenerator.new()
	
	for i in range(instances):
		var new_sprite : Sprite2D = Sprite2D.new()
		new_sprite.texture = some_texture
		new_sprite.centered = false
		
		rng.randomize()
		var x = rng.randi_range(0, 2*viewport_dimensions.x - 10)
		var y = rng.randi_range(0, 2*viewport_dimensions.y - 10)
		new_sprite.position = Vector2(x,y)
		add_child(new_sprite)
	
	

func generate_sprite_fixed_position() -> void:
	for x in range(400):
		for y in range(200):
			var new_sprite := Sprite2D.new()
			new_sprite.texture = some_texture
			new_sprite.centered = false
			new_sprite.position = Vector2(16 * x, 16 * y)
			add_child(new_sprite)
	pass

var last_point = 400 * 16
var end_viewport = 1920 * 4
func _process(delta: float) -> void:
	if last_point < end_viewport:
		last_point += 16
		for sprite in get_children():
			sprite.position.x += 16
	
	#if frame_counter % 2 == 0:
	#	for sprite in get_children():
	#		sprite.position.x += 4
	#	frame_counter +=1
	#else:
	#	for sprite in get_children():
	#		sprite.position.x -= 4
	#	frame_counter = 0
	
	pass
