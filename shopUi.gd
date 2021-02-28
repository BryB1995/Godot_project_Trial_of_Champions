extends MarginContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gold = 0
var charPoints = 0
var tmpStr = 0
var tmpDex = 0
var tmpMag = 0
var tmpEnd = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_visible(false)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	updateLabels()
#	pass
func updateGold(amt):
	gold = gold + amt
	
func updatePoints(amt2):
	charPoints = charPoints + amt2
	
func returnGold():
	return gold

func returnCharPoints():
	return charPoints
	
func tmpStrUp(number):
	tmpStr = tmpStr + number

func tmpDexUp(number):
	tmpDex = tmpDex + number
	
func tmpMagUp(number):
	tmpMag = tmpMag + number
	
func tmpEndUp(number):
	tmpEnd = tmpEnd + number
	
func playerUpdate():
	get_node("../player").recalculateStats(tmpStr + 1,tmpDex + 1,tmpMag + 1,tmpEnd + 1)
	reset()

func reset():
	tmpStr = 0
	tmpDex = 0
	tmpEnd = 0
	tmpMag = 0

func updateLabels():
	var reportStr = get_node("../player").reportStr()
	var reportDex = get_node("../player").reportDex()
	var reportMag = get_node("../player").reportMagic()
	var reportEnd = get_node("../player").reportEnd()
	get_node("./HBoxContainer/statColumn/strength").labelSet(reportStr + tmpStr)
	get_node("./HBoxContainer/statColumn/Dexterity").labelSet(reportDex + tmpDex)
	get_node("./HBoxContainer/statColumn/Magic").labelSet(reportMag + tmpMag)
	get_node("./HBoxContainer/statColumn/Endurance").labelSet(reportEnd + tmpEnd)