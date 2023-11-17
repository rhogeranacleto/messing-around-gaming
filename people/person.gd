extends CharacterBody2D

@onready var hitTreeTimer: Timer = $HitTreeTimer

const SPEED = 300.0
const JUMP_VELOCITY = -400.0



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var targetPosition: Vector2
var hittingTree: Node2D;


func _physics_process(delta):
	if not get_tree().get_nodes_in_group("trees").is_empty():
		var tree: Node2D = get_tree().get_nodes_in_group("trees")[0]
		var distance = position.distance_to(tree.global_position)

		if distance > 50:
			velocity = (tree.global_position - position).normalized() * SPEED
		else:
			velocity = Vector2.ZERO
			removeTree(tree)

		move_and_slide()

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		targetPosition = event.position

func removeTree(tree: Node2D):
	if hitTreeTimer.is_stopped():
		hitTreeTimer.start()
		hittingTree = tree


func _on_hit_tree_timer_timeout():
	if not hittingTree.isHitted(20):
		hitTreeTimer.stop()
		

