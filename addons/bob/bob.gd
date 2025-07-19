@tool
extends EditorPlugin

# bob

var scene : Control
var desc : Control
var bob : TextureRect
var dst : Vector2
@onready var texture = preload("res://addons/bob/bob_desc.png").get_image()
@onready var bobImage = preload("res://addons/bob/bob.png").get_image()

func apply_modulate(img: Image, modulate: Color) -> Image:
	var modulated_img = img.duplicate()

	for y in range(modulated_img.get_height()):
		for x in range(modulated_img.get_width()):
			var pixel = modulated_img.get_pixel(x, y)
			var new_pixel = Color(
				pixel.r * modulate.r,
				pixel.g * modulate.g,
				pixel.b * modulate.b,
				pixel.a
			)
			modulated_img.set_pixel(x, y, new_pixel)

	return modulated_img

func click_me() -> void:
	var bob_img = apply_modulate(bobImage.duplicate(), scene.get_node("bob himself").modulate)
	bob_img.resize(texture.get_width() / 1.6, texture.get_width() / 1.6, Image.INTERPOLATE_NEAREST)
	var img = texture.duplicate()
	img.blend_rect(bob_img, Rect2(0, 0, bob_img.get_width(), bob_img.get_height()), dst)
	bob.texture = ImageTexture.create_from_image(img)
	scene.get_node("dialogue").show()

func _enter_tree() -> void:
	scene = load("res://addons/bob/bob.tscn").instantiate()
	add_control_to_dock(EditorPlugin.DOCK_SLOT_LEFT_BR, scene)
	scene.get_node("click me").connect("pressed", Callable(self, "click_me"))
	desc = Control.new()
	desc.name = "control"
	desc.anchor_right = 1.0
	desc.anchor_bottom = 0.763
	desc.anchor_left = 0.0
	desc.anchor_top = 0.0
	scene.get_node("dialogue").add_child(desc)
	bob = TextureRect.new()
	bob.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS
	bob.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	bob.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	desc.add_child(bob)
	bob.anchor_top = 0
	bob.anchor_bottom = 1
	bob.anchor_left = 0
	bob.anchor_right = 1
	while !texture:
		await get_tree().process_frame
	dst = Vector2((texture.get_width() - (texture.get_width() / 1.6)) / 2.0, 0.45 * (texture.get_width() / 1.6))

func _exit_tree() -> void:
	remove_control_from_docks(scene)
	scene.queue_free()

func _process(delta: float) -> void:
	if scene:
		scene.get_node("bob himself").visible = !scene.get_node("dialogue").visible
		scene.get_node("bob himself").modulate = scene.get_node("colour").color
