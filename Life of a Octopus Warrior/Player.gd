extends KinematicBody2D

onready var animation = $AnimationPlayer
onready var animationTimer1 = $AnimationTimer1
onready var hit = $hit
onready var spell = $Spell


const ACCELERATION = 700
const MAX_SPEED = 150
const FRICTION = 600

var velocity = Vector2.ZERO

func _ready():
	animation.play("Idle")
func _process(delta):
	Global.octoPosition = global_position
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y= Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	velocity = move_and_slide(velocity)
	if Input.is_action_just_pressed("smack"):
		animation.play("Smack")
		animationTimer1.start()
	if Input.is_action_just_pressed("shoot"):
		var Butterfly = load("res://WizardProjectile.tscn")
		var butterfly = Butterfly.instance()
		var world = get_tree().current_scene
		world.add_child(butterfly)
		butterfly.global_position = global_position
		spell.play()
		


func _on_AnimationTimer1_timeout():
	animation.play("Idle") # Replace with function body.


func _on_Hurtbox_area_entered(area):
	hit.play() # Replace with function body.
