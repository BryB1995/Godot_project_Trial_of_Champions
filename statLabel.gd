extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	updateStat()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	updateStat()
#	pass
func updateStat():
	var currentS = get_node("../../../../../shopUi").returnCharPoints()
	#return currentG
	set_text("Stat Points: " + str(currentS))