extends StaticBody2D

onready var tree = $AnimationPlayer
var rng = RandomNumberGenerator.new()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	var random = rng.randi_range(1,5)
	tree.play(str(random))

func _on_Hurtbox_area_entered(area):
	get_tree().change_scene("res://Transisition.tscn")
	queue_free()
	 # Replace with function body.
