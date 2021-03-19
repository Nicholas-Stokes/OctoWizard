extends KinematicBody2D


onready var timer = $Timer
onready var smack = $AnimationPlayer
onready var hit = $Hit
var health = 2
var targetPosition = Vector2(0,0)
var velocity = Vector2(0,0)
var speed = 80
const ACCELERATION = 40
var attacking = 0
var startPosition = Vector2(0,0)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	smack.play("Idle")# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	targetPosition = Global.octoPosition
	if attacking == 1:
		targetPosition = Global.octoPosition
		var direction = global_position.direction_to(targetPosition)
		velocity = velocity.move_toward(direction * speed, ACCELERATION)
		velocity = move_and_slide(velocity) 
	if attacking == 0:
		velocity = Vector2.ZERO
		
func _on_Timer_timeout():
	smack.play("Smack")
	timer.start()
	





func _on_Hurtbox_area_entered(area):
	health = health - 1
	hit.play()
	if health == 0:
		hit.play()
		queue_free() # Replace with function body.


func _on_AreaOfEffect_area_entered(area):
	attacking = 1
	timer.start() # Replace with function body.


func _on_AreaOfEffect_area_exited(area):
	attacking = 0
	smack.play("Idle")# Replace with function body.


func _on_Hurtbox_area_exited(area):
	pass # Replace with function body.


func _on_Hitbox_area_entered(area):
	Global.octoHealth = Global.octoHealth - 20
	if Global.octoHealth <= 0:
			get_tree().change_scene("res://Title.tscn") # Replace with function body.
