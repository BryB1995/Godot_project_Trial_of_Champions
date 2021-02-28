extends VBoxContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var spellButtons = get_node("spellButtoncontainer").get_children()
	var arrLength = spellButtons.size() -1
	var counter = 0
	while counter <= arrLength:
		
		spellButtons[counter].set_visible(false)
		counter = counter + 1


#pass

	 # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):


