extends Node2D

func _draw():
	draw_circle(Vector2(0, -60), 10, Color.BLACK)
	draw_line(Vector2(0, -50), Vector2(0, 0), Color.BLACK, 2)
	draw_line(Vector2(0, -35), Vector2(-20, -15), Color.BLACK, 2)
	draw_line(Vector2(0, -35), Vector2(20, -15), Color.BLACK, 2)
	draw_line(Vector2(0, 0), Vector2(-15, 30), Color.BLACK, 2)
	draw_line(Vector2(0, 0), Vector2(15, 30), Color.BLACK, 2)
