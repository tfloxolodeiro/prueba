extends Node

var player

func init(_player):
	player = _player

func aim_position():
	return player.global_position

func should_shoot():
	return true
