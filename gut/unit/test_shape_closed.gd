extends "res://addons/gut/test.gd"

func test_add_points():
	var shape = RMSS2D_Shape_Closed.new()
	add_child_autofree(shape)
	var points = get_clockwise_points()

	var keys = []
	assert_eq(shape.get_point_count(), 0)

	keys.push_back(shape.add_point(points[0]))
	assert_eq(shape.get_point_count(), 1)
	assert_eq(shape.get_point_index(keys[0]), 0)

	keys.push_back(shape.add_point(points[1]))
	assert_eq(shape.get_point_count(), 2)
	assert_eq(shape.get_point_index(keys[0]), 0)
	assert_eq(shape.get_point_index(keys[1]), 1)

	keys.push_back(shape.add_point(points[2]))
	keys.push_back(shape.get_point_key_at_index(3))
	assert_eq(shape.get_point_count(), 4)
	assert_eq(shape.get_point_index(keys[0]), 0)
	assert_eq(shape.get_point_index(keys[1]), 1)
	assert_eq(shape.get_point_index(keys[2]), 2)
	assert_eq(shape.get_point_index(keys[3]), 3)

	# Ensure that the first point only matches the final point
	assert_false(shape.get_point_at_index(0).equals(shape.get_point_at_index(2)))
	assert_true(shape.get_point_at_index(0).equals(shape.get_point_at_index(3)))

	keys.push_back(shape.add_point(points[3]))
	assert_eq(shape.get_point_count(), 5)
	assert_eq(shape.get_point_index(keys[0]), 0)
	assert_eq(shape.get_point_index(keys[1]), 1)
	assert_eq(shape.get_point_index(keys[2]), 2)
	assert_eq(shape.get_point_index(keys[4]), 3)
	assert_eq(shape.get_point_index(keys[3]), 4)

	keys.push_back(shape.add_point(points[4], 0))
	assert_eq(shape.get_point_count(), 6)
	assert_eq(shape.get_point_index(keys[0]), 0)
	assert_eq(shape.get_point_index(keys[1]), 2)
	assert_eq(shape.get_point_index(keys[2]), 3)
	assert_eq(shape.get_point_index(keys[4]), 4)
	assert_eq(shape.get_point_index(keys[5]), 1)
	assert_eq(shape.get_point_index(keys[3]), 5)

	keys.push_back(shape.add_point(points[5], 6))
	assert_eq(shape.get_point_count(), 7)
	assert_eq(shape.get_point_index(keys[0]), 0)
	assert_eq(shape.get_point_index(keys[1]), 2)
	assert_eq(shape.get_point_index(keys[2]), 3)
	assert_eq(shape.get_point_index(keys[4]), 4)
	assert_eq(shape.get_point_index(keys[5]), 1)
	assert_eq(shape.get_point_index(keys[6]), 5)
	assert_eq(shape.get_point_index(keys[3]), 6)

	keys.push_back(shape.add_point(points[5], 80))
	assert_eq(shape.get_point_count(), 8)
	assert_eq(shape.get_point_index(keys[0]), 0)
	assert_eq(shape.get_point_index(keys[1]), 2)
	assert_eq(shape.get_point_index(keys[2]), 3)
	assert_eq(shape.get_point_index(keys[4]), 4)
	assert_eq(shape.get_point_index(keys[5]), 1)
	assert_eq(shape.get_point_index(keys[6]), 5)
	assert_eq(shape.get_point_index(keys[7]), 6)
	assert_eq(shape.get_point_index(keys[3]), 7)


func get_clockwise_points() -> Array:
	return [
		Vector2(0, 0),
		Vector2(50, -50),
		Vector2(100, 0),
		Vector2(100, 100),
		Vector2(0, 100),
		Vector2(-50, 150),
		Vector2(-100, 100)
	]
