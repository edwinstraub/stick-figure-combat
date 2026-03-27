extends Node2D

@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var anim_tree: AnimationTree = $AnimationTree

func _ready():
	_create_idle_animation()
	_setup_animation_tree()
	anim_tree.active = true

# ---- IDLE (breathing) ----
func _create_idle_animation():
	var anim = Animation.new()
	anim.length = 2.0
	anim.loop_mode = Animation.LOOP_LINEAR

	# Spine: subtle rotation for breathing
	var t = anim.add_track(Animation.TYPE_VALUE)
	anim.track_set_path(t, "Skeleton2D/Hip/Spine:rotation")
	anim.track_insert_key(t, 0.0, 0.0)
	anim.track_insert_key(t, 0.5, deg_to_rad(-1.5))
	anim.track_insert_key(t, 1.0, 0.0)
	anim.track_insert_key(t, 1.5, deg_to_rad(1.5))
	anim.track_insert_key(t, 2.0, 0.0)

	# Head: very slight counter-rotation
	t = anim.add_track(Animation.TYPE_VALUE)
	anim.track_set_path(t, "Skeleton2D/Hip/Spine/Neck/Head:rotation")
	anim.track_insert_key(t, 0.0, 0.0)
	anim.track_insert_key(t, 0.5, deg_to_rad(0.5))
	anim.track_insert_key(t, 1.0, 0.0)
	anim.track_insert_key(t, 1.5, deg_to_rad(-0.5))
	anim.track_insert_key(t, 2.0, 0.0)

	# Left arm: slight sway
	t = anim.add_track(Animation.TYPE_VALUE)
	anim.track_set_path(t, "Skeleton2D/Hip/Spine/Neck/LeftUpperArm:rotation")
	anim.track_insert_key(t, 0.0, 0.0)
	anim.track_insert_key(t, 1.0, deg_to_rad(2.0))
	anim.track_insert_key(t, 2.0, 0.0)

	# Right arm: slight sway (opposite phase)
	t = anim.add_track(Animation.TYPE_VALUE)
	anim.track_set_path(t, "Skeleton2D/Hip/Spine/Neck/RightUpperArm:rotation")
	anim.track_insert_key(t, 0.0, 0.0)
	anim.track_insert_key(t, 1.0, deg_to_rad(-2.0))
	anim.track_insert_key(t, 2.0, 0.0)

	var lib = AnimationLibrary.new()
	lib.add_animation("Idle", anim)
	anim_player.add_animation_library("", lib)

# ---- ANIMATION TREE ----
func _setup_animation_tree():
	var state_machine = AnimationNodeStateMachine.new()

	var idle_node = AnimationNodeAnimation.new()
	idle_node.animation = "Idle"
	state_machine.add_node("Idle", idle_node, Vector2(0, 0))

	anim_tree.tree_root = state_machine
	anim_tree.anim_player = anim_tree.get_path_to(anim_player)

	await get_tree().process_frame
	var playback = anim_tree.get("parameters/playback") as AnimationNodeStateMachinePlayback
	if playback:
		playback.travel("Idle")
