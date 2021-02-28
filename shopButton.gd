extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_visible(false)
	connect("pressed", self, "_on_Button_pressed")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

	
func _on_Button_pressed():  
    #print("Hello world!")
	#var nodeRef = get_node("../../../../player").get_children()
	#print(nodeRef)
	#get_node("../../../../../").set_visible(false)
	get_node("../../../../../gui").set_visible(false)
	get_node("../../../../../shopUi").set_visible(true)