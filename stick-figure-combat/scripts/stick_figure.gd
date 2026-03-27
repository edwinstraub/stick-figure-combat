extends Node2D

var breath_time: float = 0.0
@export var breath_speed: float = 2.0
@export var breath_amount: float = 2.0

# Line thickness and joint sizes
var limb_width: float = 4.0
var body_width: float = 5.0
var joint_radius: float = 3.5
var head_radius: float = 12.0

# Colors
var body_color: Color = Color.BLACK
var joint_color: Color = Color.BLACK

func _process(delta):
	breath_time += delta
	queue_redraw()

func _draw():
	var b = sin(breath_time * breath_speed) * breath_amount

	# --- Define points ---
	# Head
	var head = Vector2(0, -65 + b)

	# Body
	var neck = Vector2(0, -53 + b)
	var shoulder = Vector2(0, -45 + b * 0.7)
	var hip = Vector2(0, -5)

	# Left arm
	var l_shoulder = Vector2(-8, -43 + b * 0.7)
	var l_elbow = Vector2(-22, -28 + b * 0.4)
	var l_hand = Vector2(-20, -12 + b * 0.2)

	# Right arm
	var r_shoulder = Vector2(8, -43 + b * 0.7)
	var r_elbow = Vector2(22, -28 + b * 0.4)
	var r_hand = Vector2(20, -12 + b * 0.2)

	# Left leg
	var l_hip = Vector2(-6, -5)
	var l_knee = Vector2(-14, 14)
	var l_foot = Vector2(-16, 32)

	# Right leg
	var r_hip = Vector2(6, -5)
	var r_knee = Vector2(14, 14)
	var r_foot = Vector2(16, 32)

	# --- Draw limbs (thick lines) ---
	# Body
	draw_line(neck, hip, body_color, body_width)

	# Left arm
	draw_line(l_shoulder, l_elbow, body_color, limb_width)
	draw_line(l_elbow, l_hand, body_color, limb_width)

	# Right arm
	draw_line(r_shoulder, r_elbow, body_color, limb_width)
	draw_line(r_elbow, r_hand, body_color, limb_width)

	# Left leg
	draw_line(l_hip, l_knee, body_color, limb_width)
	draw_line(l_knee, l_foot, body_color, limb_width)

	# Right leg
	draw_line(r_hip, r_knee, body_color, limb_width)
	draw_line(r_knee, r_foot, body_color, limb_width)

	# --- Draw joints (circles) ---
	# Shoulders
	draw_circle(l_shoulder, joint_radius, joint_color)
	draw_circle(r_shoulder, joint_radius, joint_color)

	# Elbows
	draw_circle(l_elbow, joint_radius, joint_color)
	draw_circle(r_elbow, joint_radius, joint_color)

	# Hands
	draw_circle(l_hand, joint_radius, joint_color)
	draw_circle(r_hand, joint_radius, joint_color)

	# Hips
	draw_circle(l_hip, joint_radius, joint_color)
	draw_circle(r_hip, joint_radius, joint_color)

	# Knees
	draw_circle(l_knee, joint_radius, joint_color)
	draw_circle(r_knee, joint_radius, joint_color)

	# Feet
	draw_circle(l_foot, joint_radius, joint_color)
	draw_circle(r_foot, joint_radius, joint_color)

	# --- Draw head (on top of everything) ---
	draw_circle(head, head_radius, body_color)
