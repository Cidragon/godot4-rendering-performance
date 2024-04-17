extends Label

var objects : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Signals.update_object_counter.connect(func(counter : int): objects = counter)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = "Rendered Object: " + str(objects)
