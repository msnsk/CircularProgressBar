extends Control

export (float) var h_start = 0.0
export (float) var h_end = 0.45
export (float) var s_start = 0.3
export (float) var s_end = 1.0
export (float) var v_start = 0.3
export (float) var v_end = 1.0
export (float) var value_limit = 100

onready var progress_bar = $TextureProgress
onready var label = $Label


func _ready():
	progress_bar.value = 0


func _process(delta):
	get_input()
	update_label()
	update_color()


func get_input():
	if Input.is_action_pressed("ui_up"):
		progress_bar.value += 1
		progress_bar.value = min(progress_bar.value, value_limit)
	if Input.is_action_pressed("ui_down"):
		progress_bar.value -= 1


func update_label():
	var actual_value = floor(progress_bar.value / value_limit * 100)
	label.text = str(actual_value) + "%"


func update_color():
	progress_bar.tint_progress.h = range_lerp(progress_bar.value, progress_bar.min_value, progress_bar.max_value, h_start, h_end)
	progress_bar.tint_progress.s = range_lerp(progress_bar.value, progress_bar.min_value, progress_bar.max_value, s_start, s_end)
	progress_bar.tint_progress.v = range_lerp(progress_bar.value, progress_bar.min_value, progress_bar.max_value, v_start, v_end)
