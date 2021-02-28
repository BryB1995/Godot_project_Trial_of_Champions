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
	var pointCheck = get_node("../../../../shopUi").returnCharPoints()
	#return currentG
	if pointCheck >= 1:
		get_node("../../../../shopUi").tmpEndUp(1)
		
		get_node("../../../../shopUi").updatePoints(-1)

		
		#self.set_visible(false)
func labelSet(num):
	$Label.set_text(str(num))