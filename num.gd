extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	uiUpdateFlourish(get_node("../../../../../../player").returnFlourish())
	#print(get_node("../../../../../player").get_children())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	uiUpdateFlourish(get_node("../../../../../../player").returnFlourish())

#	pass

func uiUpdateFlourish(playerFl):
	set_text(str(playerFl))