extends Button
var spellString = "forcebolt"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	#var listen = TextureButton.new()
	connect("pressed", self, "_on_Button_pressed")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Button_pressed():  
    #print("Hello world!")
	var known = get_node("../../../../../player").returnKnownSpells()
	#print(known)
	if known.has(spellString):
		get_node("../../../../../player").forceBolt()
		#print("known")
		
	else:
		print("Spell not known")