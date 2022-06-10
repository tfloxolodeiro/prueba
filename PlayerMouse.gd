extends Node

func aim_position():
	return get_viewport().get_mouse_position()

func should_shoot():
	return Input.is_action_pressed("shoot")
