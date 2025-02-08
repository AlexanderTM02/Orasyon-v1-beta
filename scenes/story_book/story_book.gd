extends Control

@onready var next_button: TextureButton = $Book/Story/NextButton
@onready var back_button: TextureButton = $Book/Story/BackButton
@onready var cover_container: AspectRatioContainer = $Book/Story/CoverContainer
@onready var book_title: Label = $Book/Story/BookTitle
@onready var book_content: Label = $Book/Story/BookContent

@onready var story_button: TextureButton = $Book/StoryButton
@onready var lore_button: TextureButton = $Book/LoreButton

var current_page = 0
var current_cover
var current_content

var is_story = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_cover = $Book/Story/CoverContainer/Page0
	current_cover.show()
	update_content()

func update_content():	
	current_cover.hide()
	
	if is_story:
		match current_page:
			0:
				back_button.hide()
				next_button.show()
				book_title.show()
				book_title.text = "The World of Orasyon"
				current_cover = $Book/Story/CoverContainer/Page0
				current_content = ""
			1:
				book_title.hide()
				back_button.show()
				current_cover = $Book/Story/CoverContainer/Page1
				current_content = "In a mystical Philippines, where myths and legends come to life, the line between reality and folklore blurs. Stories whispered by elders around evening fires manifest in vivid reality, transforming the land into a place where creatures of legend roam freely. These mythical beings, once hidden from the world, now find themselves displaced, creating chaos in both the human and magical realms."
			2:
				current_cover = $Book/Story/CoverContainer/Page2
				current_content = "The balance of this world has been disturbed by an enigmatic figure whose actions have disrupted the harmony between myth and reality. Mythical creatures, such as the mischievous duwende, kapre and fearsome manananggal, have been drawn into the human world. In their confusion and displacement, they act unpredictably, unintentionally threatening human settlements and themselves."
			3:
				next_button.show()
				current_cover = $Book/Story/CoverContainer/Page3
				current_content = "As the protagonist, the player is a \"Bantay-Kwento\" (Guardian of Stories), part of a group tasked with subduing these creatures using magical spells. Armed with a spell-casting orasyon system, players work to capture the creatures, calm their unrest, and safely return them to their homes in the mythical realm."
			4:
				next_button.hide()
				current_cover = $Book/Story/CoverContainer/Page4
				current_content = "The tone of Orasyon remains lighthearted, blending Filipino humor with moments of wonder and discovery. Encounters with mythical creatures often involve amusing misunderstandings, clever traps, and spells that don’t always work as intended. The story emphasizes cooperation and respect for these creatures rather than outright confrontation."
	else:
		match current_page:
			0:
				back_button.hide()
				next_button.show()
				book_title.show()
				book_title.text = "The Creatures of Orasyon"
				current_cover = $Book/Story/CoverContainer/Page0
				current_content = ""
			1:
				book_title.hide()
				back_button.show()
				current_cover = $Book/Story/CoverContainer/MonsterPage1
				current_content = "Duwende – Mischievous Trickster
				
Small, gnome-like beings with powerful magic. They reward respect but punish offense with pranks or curses. Invisible at will, they hide objects, trip people, and bring luck—or misfortune."
			2:
				next_button.show()
				current_cover = $Book/Story/CoverContainer/MonsterPage2
				current_content = "Manananggal – Winged Horror
				
A night-stalking predator that detaches its upper body to hunt. With bat-like wings, sharp claws, and a deadly tongue, it silently feeds on the life force of the unsuspecting."
			3:
				next_button.hide()
				current_cover = $Book/Story/CoverContainer/MonsterPage3
				current_content = "Kapre – Watchful Giant
				
A towering, tobacco-smoking spirit dwelling in ancient trees. Their glowing eyes and deep laughter unsettle travelers. Playful yet territorial, they confuse intruders or scare them away if disturbed."
	
	
	book_content.text = current_content
		
	print(str(current_page))
	current_cover.show()

func _on_next_button_pressed() -> void:
	current_page += 1
	
	update_content()

func _on_back_button_pressed() -> void:
	current_page -= 1
	
	update_content()


func _on_story_button_pressed() -> void:
	current_page = 0
	is_story = true
	
	update_content()


func _on_lore_button_pressed() -> void:
	current_page = 0
	is_story = false
	
	update_content()


func _on_close_button_pressed() -> void:
	$".".hide()
