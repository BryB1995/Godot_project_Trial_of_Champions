extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	#var tst = updateGold()
	#print(str(tst))
	updateGold()
	#updateStat()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	updateGold()
	#updateStat()

#	pass

func updateGold():
	var currentG = get_node("../../../../../shopUi").returnGold()
	#return currentG
	set_text("Gold: " + str(currentG))
	
	

