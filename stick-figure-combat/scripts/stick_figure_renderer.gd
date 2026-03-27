extends Node2D

@onready var skeleton: Skeleton2D = $"../Skeleton2D"

# Bone references
var head: Bone2D
var neck: Bone2D
var spine: Bone2D
var hip: Bone2D
var l_upper_arm: Bone2D
var l_forearm: Bone2D
var l_hand: Bone2D
var r_upper_arm: Bone2D
var r_forearm: Bone2D
var r_hand: Bone2D
var l_thigh: Bone2D
var l_shin: Bone2D
var l_foot: Bone2D
var r_thigh: Bone2D
var r_shin: Bone2D
var r_foot: Bone2D

# Visual style — uniform width, no joints
var line_width: float = 5.0
var head_radius: float = 12.0
var body_color: Color = Color.BLACK

func _ready():
	head = skeleton.get_node("Hip/Spine/Neck/Head")
	neck = skeleton.get_node("Hip/Spine/Neck")
	spine = skeleton.get_node("Hip/Spine")
	hip = skeleton.get_node("Hip")
	l_upper_arm = skeleton.get_node("Hip/Spine/Neck/LeftUpperArm")
	l_forearm = skeleton.get_node("Hip/Spine/Neck/LeftUpperArm/LeftForearm")
	l_hand = skeleton.get_node("Hip/Spine/Neck/LeftUpperArm/LeftForearm/LeftHand")
	r_upper_arm = skeleton.get_node("Hip/Spine/Neck/RightUpperArm")
	r_forearm = skeleton.get_node("Hip/Spine/Neck/RightUpperArm/RightForearm")
	r_hand = skeleton.get_node("Hip/Spine/Neck/RightUpperArm/RightForearm/RightHand")
	l_thigh = skeleton.get_node("Hip/LeftThigh")
	l_shin = skeleton.get_node("Hip/LeftThigh/LeftShin")
	l_foot = skeleton.get_node("Hip/LeftThigh/LeftShin/LeftFoot")
	r_thigh = skeleton.get_node("Hip/RightThigh")
	r_shin = skeleton.get_node("Hip/RightThigh/RightShin")
	r_foot = skeleton.get_node("Hip/RightThigh/RightShin/RightFoot")

func _process(_delta):
	queue_redraw()

func _draw():
	var p_head = to_local(head.global_position)
	var p_neck = to_local(neck.global_position)
	var p_spine = to_local(spine.global_position)
	var p_hip = to_local(hip.global_position)
	var p_l_forearm = to_local(l_forearm.global_position)
	var p_l_hand = to_local(l_hand.global_position)
	var p_r_forearm = to_local(r_forearm.global_position)
	var p_r_hand = to_local(r_hand.global_position)
	var p_l_thigh = to_local(l_thigh.global_position)
	var p_l_shin = to_local(l_shin.global_position)
	var p_l_foot = to_local(l_foot.global_position)
	var p_r_thigh = to_local(r_thigh.global_position)
	var p_r_shin = to_local(r_shin.global_position)
	var p_r_foot = to_local(r_foot.global_position)

	# Body (neck to hip)
	draw_line(p_neck, p_hip, body_color, line_width)

	# Left arm (from neck to elbow to hand)
	draw_line(p_neck, p_l_forearm, body_color, line_width)
	draw_line(p_l_forearm, p_l_hand, body_color, line_width)

	# Right arm (from neck to elbow to hand)
	draw_line(p_neck, p_r_forearm, body_color, line_width)
	draw_line(p_r_forearm, p_r_hand, body_color, line_width)

	# Left leg (from hip)
	draw_line(p_hip, p_l_shin, body_color, line_width)
	draw_line(p_l_shin, p_l_foot, body_color, line_width)

	# Right leg (from hip)
	draw_line(p_hip, p_r_shin, body_color, line_width)
	draw_line(p_r_shin, p_r_foot, body_color, line_width)

	# Head (on top)
	draw_circle(p_head, head_radius, body_color)
