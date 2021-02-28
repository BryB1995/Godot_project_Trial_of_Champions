extends KinematicBody

# Declare member variables here. Examples:
# var a = 2
var hpMax = 100
var hp = hpMax
var armor = 1
var dex = 1
var magic = 1
var strength = 1
var endure = 1
var bonusDmg = 0
var bonusMagic = 0
var bonusDex = 0
var flourish = 0
var bonusHp = 0
var flourishBonus = 0
var knownSpells = []
onready var anims = get_node("./oShadeblade/AnimationPlayer")
var tmpArmor = 0
#CLEAR THIS ON OPPONENT CHANGE



# Called when the node enters the scene tree for the first time.
func _ready():
	knownSpells.append("healWounds")
	recalculateStats(1,1,1,1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func recalculateStats(addStr, addDex, addMagic, addEnd):
	endure = endure + addEnd - 1
	strength = strength + addStr - 1
	magic = magic + addMagic - 1
	dex = dex + addDex - 1
	hpMax = 100 + (endure * 10) + bonusHp
	hp = hpMax
	armor = armor - tmpArmor

func updateBonusHp(amt):
	bonusHp = amt
	recalculateStats(1,1,1,1)
	#bonusHp = 0

func takeDamage(dmg):
	var trueDmg = (dmg - armor)
	if trueDmg < 0:
		trueDmg = 0
	hp = hp - (trueDmg)
	if hp <= 0:
		get_node("../gui/masterBox/bars/VBoxContainer/NinePatchRect/logMsg").updateLog("You have perished!")
		var killButtons = get_node("../gui/masterBox/buttons").get_children()
		var buttonLength = killButtons.size()
		var counter = 0
		while counter <= (buttonLength - 1):
			killButtons[counter].set_visible(false)
			counter = counter + 1
	
	#print("you take " + str(dmg) + " damage and have HP of " + str(hp))
	
func playerDodge(target):
		var dodgeSucc = false
		var random = randi()%50+1 + dex + bonusDex
		if (random >= target):
			dodgeSucc = true
			print ("player dodges attack roll of " + str(target) + " with a roll of " + str(random))
		return dodgeSucc
		
	

func hitChance():
	var hitSuccess
	var random = randi()%100+1
	if (random <= (50 + ((dex + bonusDex) * 10))):
		hitSuccess = true
	else:
		hitSuccess = false
	return hitSuccess

func damageCalc():
	var random = randi()%10+1
	return random + strength + bonusDmg
	
func attack():
	anims.play("swing")
	
	var getOpponent = get_node("../globalOpponent").returnOpponent()
	print(str(getOpponent))
	var hit = hitChance()
	if hit == true:
		var dmg = damageCalc()
		get_node("../sfxStab").playThis()
		get_node("../gui/masterBox/bars/VBoxContainer/NinePatchRect/logMsg").updateLog("You hit the enemy for " + str(dmg) + " damage!")
	
		if getOpponent == 3:
			#print("player hits opponent and does damage of " + str(dmg))
			get_node("../enemy3").takeDamage3(dmg)
			get_node("../enemy3").AICycle3()
		elif getOpponent == 2:
			print("getOpponent resolving as 2")
			get_node("../enemy2").takeDamage2(dmg)
			get_node("../enemy2").AiCycle2()
		else:
			get_node("../enemy1").takeDamage1(dmg)
			get_node("../enemy1").AiCycle1()
			
			
			
			
		
		#td damage enemy etc logic
	else:
		get_node("../gui/masterBox/bars/VBoxContainer/NinePatchRect/logMsg").updateLog("Your attack misses!")
		#print("player misses")
		if getOpponent == 3:
			get_node("../enemy3").AICycle3()
		elif getOpponent == 2:
			get_node("../enemy2").AiCycle2()
		else:
			get_node("../enemy1").AiCycle1()
			
		
		

func doFlourish(flAmt):
	var getOpponent = get_node("../globalOpponent").returnOpponent()
	#get_node("../gui/masterBox/bars/VBoxContainer/NinePatchRect/logMsg").updateLog("The crowd cheers as you flourish!")
	anims.play("magic")
	get_node("../sfxCheer").playThis()
	flourish = flourish + flAmt + flourishBonus
	
	if flourish > 100:
		flourish = 100
	if getOpponent == 3:
		get_node("../enemy3").AICycle3()
	elif getOpponent == 2:
		get_node("../enemy2").AiCycle2()
	elif getOpponent == 1:
		get_node("../enemy1").AiCycle1()
	
		
	
		
func returnFlourish():
	return flourish
	
		
func playerEcho():
	print("good pass to player")
	
func returnHp():
		return hp
		
func returnKnownSpells():
	return knownSpells
	
func learnSpell(spell):
	knownSpells.append(spell)
	
func applyBonuses(dmgAdd, dexAdd, magAdd, armAdd, flourAdd):
	bonusDmg = bonusDmg + dmgAdd
	bonusDex = bonusDex + dexAdd
	bonusMagic = bonusMagic + magAdd
	armor = armor + armAdd
	flourishBonus = flourishBonus + flourAdd
	

func heal():
	anims.play("magic")
	get_node("../sfxMagic").playThis()
	var magicRandom = randi()%10+1
	hp = hp + magic + magicRandom
	get_node("../gui/masterBox/bars/VBoxContainer/NinePatchRect/logMsg").updateLog("You heal for " + str(magic + magicRandom) + " HP!")
	if(hp > hpMax):
		hp = hpMax
	var getOpponent = get_node("../globalOpponent").returnOpponent()
	if getOpponent == 3:
		get_node("../enemy3").AICycle3()
	elif getOpponent == 2:
		get_node("../enemy2").AiCycle2()
	elif getOpponent == 1:
		get_node("../enemy1").AiCycle1()
		
		
	
func forceBolt():
	anims.play("magic")
	get_node("../sfxMagic").playThis()
	var magicRandom = randi()%5+5
	var magicFinal = magicRandom + magic
	var getOpponent = get_node("../globalOpponent").returnOpponent()
	get_node("../gui/masterBox/bars/VBoxContainer/NinePatchRect/logMsg").updateLog("You forcebolt the enemy for " + str(magicFinal) + " damage!")
	
	if getOpponent == 3:
			#print("player hits opponent and does damage of " + str(dmg))
			get_node("../enemy3").takeDamage3(magicFinal)
			get_node("../enemy3").AICycle3()
			
	elif getOpponent == 2:
		get_node("../enemy2").takeDamage2(magicFinal)
		get_node("../enemy2").AiCycle2()
		
	elif getOpponent == 1:
		get_node("../enemy1").takeDamage1(magicFinal)
		get_node("../enemy1").AiCycle1()
		
		
		
			
func mageArmor():
	anims.play("magic")
	get_node("../sfxMagic").playThis()
	var getOpponent = get_node("../globalOpponent").returnOpponent()
	armor = armor + magic
	tmpArmor = magic + tmpArmor
	get_node("../gui/masterBox/bars/VBoxContainer/NinePatchRect/logMsg").updateLog("You increase your armor to " + str(armor))
	if getOpponent == 3:
			#print("player hits opponent and does damage of " + str(dmg))
			#get_node("../enemy3").takeDamage3(magicFinal)
			get_node("../enemy3").AICycle3()
	elif getOpponent == 2:
		get_node("../enemy2").AiCycle2()
	elif getOpponent == 1:
		get_node("../enemy1").AiCycle1()
		
		
	

	
func dancingLights():
	
	get_node("../gui/masterBox/bars/VBoxContainer/NinePatchRect/logMsg").updateLog("Your display dazzles the crowd!")
	anims.play("magic")
	get_node("../sfxMagic").playThis()
	flourish = flourish + magic + flourishBonus + 8
	
	if flourish > 100:
		flourish = 100
	
	var getOpponent = get_node("../globalOpponent").returnOpponent()
	if getOpponent == 3:
		get_node("../enemy3").AICycle3()
	elif getOpponent == 2:
		get_node("../enemy2").AiCycle2()
	elif getOpponent == 1:
		get_node("../enemy1").AiCycle1()
		
		
	

func reportStr():
	return strength

func reportDex():
	return dex

func reportMagic():
	return magic
	
func reportEnd():
	return endure
	
func updateTmpArmor(number):
	armor = armor + number
	tmpArmor = tmpArmor + number

func resetTmpArmor():
	armor = armor - tmpArmor
	tmpArmor = 0