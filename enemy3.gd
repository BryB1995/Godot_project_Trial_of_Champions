extends KinematicBody

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var hpMax = 50
var hp = hpMax
var idleFlag = true
onready var anims = get_node("./reanimatedBerserker/AnimationPlayer")


# Called when the node enters the scene tree for the first time.
func _ready():
	anims.play("idleBryce")
	#print(anims)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if idleFlag == true:
		#anims.play("idleBryce")
		pass
	
	pass

func takeDamage3(dmg):
	hp = hp - dmg
	print("berserker takes " + str(dmg) + " damage and has Hp of " + str(hp))

func attack():
	get_node("../sfxStab").playThis()
	var random = randi()%10+1
	get_node("../gui/masterBox/bars/VBoxContainer/NinePatchRect/logMsg").updateLog("Berserker hits you for " + str(random))
	return random
	
func healSelf():
	anims.play("drinkBryce")
	var random = randi()%8+1
	hp = hp + random
	get_node("../gui/masterBox/bars/VBoxContainer/NinePatchRect/logMsg").updateLog("Berserker drinks from a flask, Healing for " + str(random))
	if hp > hpMax:
		hp = hpMax
	#print("berserker heals himself to " + str(hp))

func AICycle3():
	anims.stop(true)
	#.clear_caches()
	idleFlag = false
	#anims.stop()
	if hp <= 0:
		var finalHype = get_node("../player").returnFlourish()
		self.set_visible(false)
		get_node("../gui/masterBox/bars/VBoxContainer/NinePatchRect/logMsg").updateLog("You slay the berserker and get " + str(finalHype + 100) + " Gold!")
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
		var random = randi()%2+1
		if(random == 2 && hp < hpMax):
			healSelf()
		else:
			anims.play("attackBryce")
			var random2 = randi()%50+1
			var hitPlayer = get_node("../player").playerDodge(random2)
			if(hitPlayer == false):
				var attackDmg = attack()
				get_node("../player").takeDamage(attackDmg)
			else:
				get_node("../gui/masterBox/bars/VBoxContainer/NinePatchRect/logMsg").updateLog("Berserker's attack misses!")
				get_node("../sfxWhoosh").playThis()
    
	idleFlag = true
		
			
						

		

		
		#print("berserker miss")
		

			



			

		
		