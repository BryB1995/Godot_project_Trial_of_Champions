extends TextureButton
#var msg = "attack button"

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
	get_node("../../../../player").doFlourish(10)