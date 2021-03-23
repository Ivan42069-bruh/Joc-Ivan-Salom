extends KinematicBody2D

var velocitat : Vector2 = Vector2(100, 100 )
var acceleracio : Vector2 = Vector2(10, 50)
var velocitat_max = 100
func _ready():
	pass
func _process(delta):
	velocitat = Vector2.ZERO
	if Input.is_action_pressed("dreta"):
		velocitat += Vector2(50, 0)
		$AnimatedSprite.play('walkin')
	if Input.is_action_pressed("esquerra"):
		velocitat += Vector2(-50, 0)
		$AnimatedSprite.play('walkin')
	if Input.is_action_pressed("up"):
		velocitat += Vector2(0, -50)
		$AnimatedSprite.play('walkin')
	if Input.is_action_pressed("down"):
		velocitat += Vector2(0, 50)
		$AnimatedSprite.play('walkin')
	position += velocitat * delta * 10
	position.x = clamp(position.x, 0, 1024)
	position.y = clamp(position.y, 0, 600)
