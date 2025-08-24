extends Node3D
@onready var  FPS_debug = $FPSContainer/FPSDebug


func _physics_process(delta: float) -> void:
	FPS_debug.text = "FPS: " + str(int(Engine.get_frames_per_second()))
