extends Button

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
	var goldCheck = get_node("../../../../shopUi").returnGold()
	if goldCheck >= 50:
		get_node("../../../../shopUi").updateGold(-50)
		get_node("../../../../player").applyBonuses(0,0,0,0,10)
		self.set_visible(false)
		#DOUBLE CHECK THAT THIS DOES SOMETHING