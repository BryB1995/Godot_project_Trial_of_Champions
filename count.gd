extends MarginContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	uiUpdateHp(get_node("../../../../../player").returnHp())
	#print(get_node("../../../../../player").get_children())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	uiUpdateHp(get_node("../../../../../player").returnHp())

#	pass

func uiUpdateHp(playerHp):
	$num.set_text(str(playerHp))