extends KinematicBody

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var hpMax = 65
var hp = hpMax
var idleFlag = true
var dbArmor = 0
var dbDmg = 0
onready var anims = get_node("./sorc/AnimationPlayer")
# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_visible(false)
	anims.play("default")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func debuffPool():
	get_node("../player").updateTmpArmor(dbArmor * -1)
	get_node("../player").applyBonuses((dbDmg * -1),0,0,0,0)
	

func takeDamage2(dmg):
	hp = hp - dmg
	print("Sorceress takes " + str(dmg) + " damage and has Hp of " + str(hp))
	
func attack():
	anims.play("default")
	get_node("../sfxMagic").playThis()
	var random = randi()%15+1
	#get_node("../gui/masterBox/bars/VBoxContainer/NinePatchRect/logMsg").updateLog("Sorceress enchants you for " + str(random + 10))
	return random + 10
	
func sunder():
	anims.play("default")
	get_node("../sfxMagic").playThis()
	get_node("../player").updateTmpArmor(-2)
	dbArmor = dbArmor - 2
	get_node("../gui/masterBox/bars/VBoxContainer/NinePatchRect/logMsg").updateLog("Sorceress casts acid, reducing armor by 2!")
	
func weakness():
	anims.play("default")
	get_node("../sfxMagic").playThis()
	get_node("../player").applyBonuses(-5,0,0,0,0)
	dbDmg = dbDmg - 5
	get_node("../gui/masterBox/bars/VBoxContainer/NinePatchRect/logMsg").updateLog("Sorceress casts feeble, reducing attack by 5!")
	
func AiCycle2():
	
		if hp <= 0:
			debuffPool()
			self.set_visible(false)
			var finalHype = get_node("../player").returnFlourish()
			get_node("../gui/masterBox/bars/VBoxContainer/NinePatchRect/logMsg").updateLog("You slay the sorceress and get " + str(finalHype + 100) + " Gold!")
			get_node("../shopUi").updateGold(100 + finalHype)
			get_node("../shopUi").updatePoints(5)
			get_node("../gui/masterBox/bars/VBoxContainer/shopButton").set_visible(true)
			var killButtons = get_node("../gui/masterBox/buttons").get_children()
			var buttonLength = killButtons.size()
			var counter = 0
			while counter <= (buttonLength - 1):
				killButtons[counter].set_visible(false)
				counter = counter + 1
		

		else:
			var random = randi()%10+1
			if random == 10:
				weakness()
			elif random == 9:
				sunder()
			else:
				var dmg = attack()
				var random2 = randi()%55+1
				var hitPlayer = get_node("../player").playerDodge(random2)
				if hitPlayer == false:
					get_node("../gui/masterBox/bars/VBoxContainer/NinePatchRect/logMsg").updateLog("Sorceress enchants you for " + str(dmg))
					get_node("../player").takeDamage(dmg)
					
				else:
					get_node("../gui/masterBox/bars/VBoxContainer/NinePatchRect/logMsg").updateLog("You dodge the Sorceress' attack!")
					
					
				
	                  
				
				
		print("AI cycle 2 firing")

			

	

	
		