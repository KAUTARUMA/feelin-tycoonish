class_name PolygonCollisionAndShape
extends Polygon2D

var collision: CollisionPolygon2D = CollisionPolygon2D.new()

func _ready() -> void:
	collision.polygon = polygon
	collision.transform = transform
	add_sibling.call_deferred(collision)
