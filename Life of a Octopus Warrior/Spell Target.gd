extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Textbox_Trigger_area_entered(area):
	Global.textBox = 3 # Replace with function body.


func _on_Textbox_Trigger_area_exited(area):
	Global.textBox = 0 # Replace with function body.


func _on_Hurtbox_area_entered(area):
	queue_free() # Replace with function body.
