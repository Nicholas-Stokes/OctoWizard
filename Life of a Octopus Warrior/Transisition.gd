extends Node2D
onready var label = $Label
onready var timer = $Timer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.level = Global.level + 1
	print(str(Global.level))
	if Global.level == 4:
		label.text = ("You Win!!!!")
	else:
		label.text = ("Loading New Level")
		timer.start()
		 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
		get_tree().change_scene("res://" + str(Global.level) + ".tscn")
	# Replace with function body.
