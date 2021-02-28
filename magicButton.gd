extends TextureButton
var msg = "attack button"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	#var listen = TextureButton.new()
	connect("pressed", self, "_on_Button_pressed")
	#add_child(listen)
	
func _on_Button_pressed():  
    #print("Hello world!")
	#var nodeRef = get_node("../../../../player").get_children()
	#print(nodeRef)
	var spellButtons = get_node("../spellButtoncontainer").get_children()
	print(spellButtons)
	#var b = spellButtons[0]
	var arrLength = spellButtons.size() -1
	var counter = 0
	while counter <= arrLength:
			if spellButtons[counter].is_visible() == true:
		       spellButtons[counter].set_visible(false)
			else:
				spellButtons[counter].set_visible(true)
		 counter = counter + 1


		