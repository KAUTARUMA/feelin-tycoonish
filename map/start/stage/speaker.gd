extends Node2D

const FREQ_MIN = 0.0
const FREQ_MAX = 11050.0

var spectrum_analyzer:AudioEffectSpectrumAnalyzerInstance

@onready var big: Sprite2D = $Big
@onready var small: Sprite2D = $Small

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spectrum_analyzer = AudioServer.get_bus_effect_instance(1, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var magnitude = spectrum_analyzer.get_magnitude_for_frequency_range(FREQ_MIN, FREQ_MAX / 2.0, AudioEffectSpectrumAnalyzerInstance.MAGNITUDE_AVERAGE)
	big.scale = (magnitude * 100.0) + (Vector2.ONE * 0.75)
	
	magnitude = spectrum_analyzer.get_magnitude_for_frequency_range(FREQ_MAX / 2.0, FREQ_MIN, AudioEffectSpectrumAnalyzerInstance.MAGNITUDE_AVERAGE)
	small.scale = (magnitude * 100.0) + (Vector2.ONE * 0.75)
	
	magnitude = spectrum_analyzer.get_magnitude_for_frequency_range(FREQ_MIN, FREQ_MAX / 4.0, AudioEffectSpectrumAnalyzerInstance.MAGNITUDE_AVERAGE)
	scale = (magnitude * 20.0) + (Vector2(0.5, 0.5))
