extends Node

func _ready():
	OS.window_fullscreen = Settings.fullscreen
	go_to_main_menu()


func go_to_main_menu():
	var menu = ResourceLoader.load("res://menu/menu.tscn")
	change_scene(menu)


func replace_main_scene(resource):
	call_deferred("change_scene", resource)


func change_scene(resource : Resource):
	var node = resource.instance()
	
	while get_child_count() > 0:
		remove_child(get_child(0))
	add_child(node)
	
	node.connect("quit", self, "go_to_main_menu")
	node.connect("replace_main_scene", self, "replace_main_scene")
