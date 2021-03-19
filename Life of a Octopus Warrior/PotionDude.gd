extends KinematicBody2D


onready var timer = $Timer
onready var hit = $Hit
var health = 3
var targetPosition = Vector2(0,0)
var velocity = Vector2(0,0)
var speed = 0
const ACCELERATION = 40
var attacking = 0
var startPosition = Vector2(0,0)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass
		
func _on_Timer_timeout():
	var Butterfly = load("res://Potion.tscn")
	var butterfly = Butterfly.instance()
	var world = get_tree().current_scene
	world.add_child(butterfly)
	butterfly.global_position = global_position
	timer.start()
	


func _on_AreaOfEffect_area_entered(area):
	attacking = 1
	timer.start()
	 # Replace with function body.



func _on_AreaOfEffect_area_exited(area):
	attacking = 0
	timer.stop()


func _on_Hurtbox_area_entered(area):
	health = health - 1
	hit.play()
	if health == 0:
		hit.play()
		queue_free() # Replace with function body.



