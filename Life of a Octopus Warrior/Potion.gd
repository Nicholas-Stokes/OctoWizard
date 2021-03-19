extends KinematicBody2D

onready var state = $AnimationPlayer
onready var time = $Timer
onready var potion = $Potion
var status = 0
var timer = 0
var velocity = Vector2(0, 0)
const ACCELERATION = 20
var speed = 40
var direction = 0
var target = Vector2(0,0)

var angle = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	state.play("Thrown")
	timer = 0
	status = 0
	state.play("Thrown")
	target = Global.octoPosition
	time.start()
	
	# Replace with function body.
	
func _process(_delta):
	target = Global.octoPosition
	direction = global_position.direction_to(target)
	velocity = velocity.move_toward(direction * speed, ACCELERATION)
	velocity = move_and_slide(velocity)


func _on_Timer_timeout():
	if timer == 0:
		state.play("Splash")
		potion.play()
		speed = 0
		timer = 1
	else:
		queue_free()


func _on_Hitbox_area_entered(area):
	if status == 0:
		Global.octoHealth = Global.octoHealth - 5
		if Global.octoHealth <= 0:
			get_tree().change_scene("res://Title.tscn")
	else:
		Global.octoHealth = Global.octoHealth - 10
		if Global.octoHealth <= 0:
			get_tree().change_scene("res://Title.tscn")
