extends Node2D
onready var squish = $AnimationPlayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	 squish.play("Squish")# Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Credits_pressed():
	 get_tree().change_scene("res://Credits.tscn")# Replace with function body.


func _on_Story_pressed():
	get_tree().change_scene("res://Story.tscn") # Replace with function body.


func _on_play_pressed():
	get_tree().change_scene("res://Main.tscn") # Replace with function body.


func _on_more_games_pressed():
	OS.shell_open("http://plexagon.itch.io/") # Replace with function body.


func _on_twitter_pressed():
	OS.shell_open("http://twitter.com/plexstuff") # Replace with function body.


func _on_youtube_pressed():
	OS.shell_open("http://.youtube.com/channel/UCxbKVQZxmeAd0tal8z5rOOw/") # Replace with function body.
