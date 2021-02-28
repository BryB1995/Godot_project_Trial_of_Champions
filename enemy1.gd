extends KinematicBody

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var hpMax = 200
var hp = hpMax
var idleFlag = true


var dbDex = 0
onready var anims = get_node("./cerberusGoodish/AnimationPlayer")
# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_visible(false)
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func bite():
	hp = hp + 20
	if hp > hpMax:
		hp = hpMax
	get_node("../sfxBite").playThis()
	anims.play("biteBryce")
	get_node("../player").takeDamage(20)
	get_node("../gui/masterBox/bars/VBoxContainer/NinePatchRect/logMsg").updateLog("The Cerberus bites into your Flesh! Wounding you and Healing for 20!")
		
	
func roar():
	get_node("../sfxRoar").playThis()
	anims.play("roarBryce")
	get_node("../player").applyBonuses(0,-1,0,0,0)
	get_node("../gui/masterBox/bars/VBoxContainer/NinePatchRect/logMsg").updateLog("Cerberus roars, shaking you to your core! Dexterity decreased!")
	
func attack():
	anims.play("idleBryce")
	var random = randi()%25+1
	return random + 10
	
func takeDamage1(d):
	hp = hp - d
	
	
func AiCycle1():
	if hp <= 0:
		self.set_visible(false)
		get_node("../gui/masterBox/bars/VBoxContainer/NinePatchRect/logMsg").updateLog("You have slain the cerberus and overcome the trial of champions!")
	else:
			var random = randi()%10+1
			if random == 7 || random == 8:
				roar()
			elif random == 9 || random == 10:
				bite()
			else:
				var random2 = randi()%70 + 1
				var hitPlayer = get_node("../player").playerDodge(random2)
				if hitPlayer == false:
					var dmg = attack()
					get_node("../sfxStab").playThis()
					get_node("../gui/masterBox/bars/VBoxContainer/NinePatchRect/logMsg").updateLog("The cerberus lunges! Dealing damage of " + str(dmg))
					get_node("../player").takeDamage(dmg)
					
				else:
					get_node("../gui/masterBox/bars/VBoxContainer/NinePatchRect/logMsg").updateLog("You dodge the cerberus' lunge!")
					get_node("../sfxWhoosh").playThis()
					
				
				

	
		
	
		
	