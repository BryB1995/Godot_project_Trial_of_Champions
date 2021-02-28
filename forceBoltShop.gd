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
	if goldCheck >= 70:
		get_node("../../../../shopUi").updateGold(-70)
		get_node("../../../../player").learnSpell("forcebolt")
		self.set_visible(false)
		
		
		
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
