extends Control

@onready var color_rect = $CanvasLayer/ColorRect
@onready var animation_player = $CanvasLayer/AnimationPlayer
var musica_pausada = false
var background_music : AudioStreamPlayer2D

func _ready():
	animation_player.play("fade_out")
	await animation_player.animation_finished
	color_rect.visible = false
	background_music = $BackgroundMusic
	actualizar_boton_sonido()
	background_music.play()

func _on_music_pressed():

	# Activar o desactivar el sonido global del juego
	if musica_pausada:
		background_music.stream_paused = false
		musica_pausada = false
	else:
		background_music.stream_paused = true
		musica_pausada = true

	# Actualizar la apariencia del botón dependiendo del estado
	actualizar_boton_sonido()

func actualizar_boton_sonido():
	if musica_pausada:
		$Musica.icon = preload("res://assets/music_icon_off.png")
	else:
		$Musica.icon = preload("res://assets/music_icon.png")

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://addons/proton_scatter/scenario_day.tscn")

func _on_opciones_pressed() -> void:
	color_rect.visible = true
	animation_player.play("fade_in")
	await animation_player.animation_finished
	get_tree().change_scene_to_file("res://scenes/options_menu.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
