extends CanvasLayer

onready var textbox = $Label
onready var timer = $Timer
onready var hpBar = $TextureProgress
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hpBar.set_value(Global.octoHealth)
	if Global.textBox == 0:
		textbox.text = ("")
	elif Global.textBox == 1:
		textbox.text = ("Press the left mouse button to use your staff")
		timer.start()
	elif Global.textBox == 2:
		textbox.text = ("Watch out for dummy enemy distractions!")
		timer.start()
	elif Global.textBox == 3:
		textbox.text = ("Press the right mouse button for spellcasting")
		timer.start()


func _on_Timer_timeout():
	Global.textBox = 0 # Replace with function body.
