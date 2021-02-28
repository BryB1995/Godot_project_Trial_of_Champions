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
	var curr = get_node("../../../../globalOpponent").returnOpponent()
	if curr == 3:
		get_node("../../../../enemy3").set_visible(false)
		get_node("../../../../enemy2").set_visible(true)
	elif curr == 2:
		get_node("../../../../enemy2").set_visible(false)
		get_node("../../../../enemy1").set_visible(true)
	else:
		get_node("../../../../enemy3").set_visible(false)
		
	
	
	get_node("../../../../globalOpponent").nextOpponent()
	get_node("../../../../shopUi").playerUpdate()
	get_node("../../../../shopUi").set_visible(false)
	get_node("../../../../gui").set_visible(true)
	get_node("../../../../gui/masterBox/bars/VBoxContainer/shopButton").set_visible(false)
	#get_node("../gui/masterBox/bars/VBoxContainer/shopButton").set_visible(true)
	var killButtons = get_node("../../../../gui/masterBox/buttons").get_children()
	var buttonLength = killButtons.size()
	var counter = 0
	while counter <= (buttonLength - 1):
	         killButtons[counter].set_visible(true)
	         counter = counter + 1

    #print("Hello world!")
	
	#print(nodeRef)
