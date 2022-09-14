# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# sudo service postgresql start
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#p1 = Combatant.create(username:'jeremy',password_digest: BCrypt::Password.create('harry'))

#p3 = Combatant.create(username:'kenky',password_digest: BCrypt::Password.create('hotdog'))
#p4 = Combatant.create(username:'shib',password_digest: BCrypt::Password.create('password'))
p2 = Combatant.create(username:'klofnod',password_digest: BCrypt::Password.create('crazy11'))
#Character.create(name:'klofnod',backstory:'lived long hasnt died',health:7,power:8,defence:4,combatant_id:p1.id)
#Character.create(name:'grandad',backstory:'fast guy',health:7,power:8,defence:4,combatant_id:p1.id)
#Character.create(name:'aurthor',backstory:'cant be caught',health:5,power:8,defence:4,combatant_id:p1.id)
#Character.create(name:'deathblade',backstory:'now dead',health:15,power:8,defence:4,combatant_id:p1.id)
Character.create(name:'king john',backstory:'woobly oobly',health:12,power:8,defence:4,combatant_id:p2.id)
Character.create(name:'bacon',backstory:'has a nice smile',health:34,power:8,defence:4,combatant_id:p2.id)
#Character.create(name:'kikkkkko',backstory:'two in the hand',health:76,power:8,defence:4,combatant_id:p3.id)
#Character.create(name:'seannnn',backstory:'spinning for gear',health:2,power:8,defence:4,combatant_id:p3.id)
#Character.create(name:'babbba',backstory:'already has a tombstone',health:16,power:8,defence:4,combatant_id:p3.id)
#Character.create(name:'quilt',backstory:'cant be left alone',health:4,power:8,defence:4,combatant_id:p4.id)
#Character.create(name:'horray',backstory:'got two more hearts then you',health:1,power:8,defence:4,combatant_id:p4.id)

g1= Game.create(round:1)
g2= Game.create(round:1)
g3= Game.create(round:1)

Enemy.create(name:'Possessed Farmer',description:'the poor soul has been corrupted. A husk of their former self left only with rage and hatred.', health:5,power:2,defence:3,game_id:g1.id)
Enemy.create(name:'Undead Shambler',description:'it is beyond corrupt, a reawakened corpse brought back to serve Abaddon.',health:6,power:2,defence:7,game_id:g1.id)
Enemy.create(name:'Giant Rat',description:'it has grown huge with the field untended. It Hisses at you and you see glimpse of its sharp teeth, ready to chew you apart.',health:5,power:2,defence:5,game_id:g1.id)
Enemy.create(name:'Possessed Guard',description:'another poor soul that has been corrupted. They used to protect these streets from evil, now they are the evil.',health:10,power:5,defence:10,game_id:g1.id)
Enemy.create(name:'Cursed Archer',description:'another reanimated corpse, this one is outfitted with a bow. They notch an arrow and prepare to fire, you cant let them fire twice.',health:10,power:7,defence:10,game_id:g1.id)
Enemy.create(name:'Undead Soldier',description:'another beyond corrupt entity, this one has been outfitted with a sword and armor.',health:8,power:5,defence:8,game_id:g1.id)
Enemy.create(name:'Possessed Shopkeeper',description:'another poor soul that has been corrupted. A shopkeeper frequented by your family, there is nothing left of their former self.',health:8,power:4,defence:6,game_id:g1.id)
Enemy.create(name:'Boneclaw',description:'a terrible creature of corruption, even animals are not safe from Abaddon. A bear skeleton reanimated for battle.',health:12,power:6,defence:5,game_id:g1.id)
Enemy.create(name:'Cursed Knight',description:'complete corruption, evil in almost pure form. Their armor and sword make these already hulking beasts look even more intimidating.',health:15,power:5,defence:15,game_id:g1.id)
Enemy.create(name:'Abaddon',description:'the Lord of Evil. He has taken your homeland and now you are here to take his life. Magic pulses in the room from his power. This will not be an easy fight, but if not you who will stop his reign.',health:25,power:9,defence:20,game_id:g1.id)


Enemy.create(name:'witch',description:'huge hat',health:6,power:7,defence:5,game_id:g2.id)
Enemy.create(name:'gambler',description:'huge debdt',health:7,power:3,defence:5,game_id:g2.id)




Enemy.create(name:'blade thrower',description:'huge blade',health:9,power:2,defence:5,game_id:g3.id)
Enemy.create(name:'death knight',description:'huge',health:5,power:4,defence:7,game_id:g3.id)
Enemy.create(name:'dragon',description:'huge wings',health:15,power:5,defence:5,game_id:g3.id)


Gear.create(name:'some new armor',description:'very heavy',effect:'defence',power:8)
Gear.create(name:'amulet of protection',description:'very stong',effect:'defence',power:5)
Gear.create(name:'ring of defence',description:'very round',effect:'defence',power:4)

Gear.create(name:'a new weapon',description:'very pointy',effect:'damage',power:5)
Gear.create(name:'talisman of power',description:'very curved',effect:'damage',power:6)
Gear.create(name:'ring of power',description:'very power',effect:'damage',power:5)

Gear.create(name:'some food',description:'very metal',effect:'health',power:5)
Gear.create(name:'flask of water',description:'very strechty',effect:'health',power:4)
Gear.create(name:'health potion',description:'very healthy',effect:'health',power:7)












Encounter.create(name:'Abaddon',setting:'early',plot:'You decide to take a short cut through a farm field. While Crossing from behind a dirt mound comes a')
Encounter.create(name:'Abaddon',setting:'early',plot:'You hear a scream come from a nearby house you rush in but are too late, over a dead body is a')
Encounter.create(name:'Abaddon',setting:'early',plot:'The fortess front entrance is too heavily guarded, while making your way along the outer wall looking for another way in you run into a')
Encounter.create(name:'Abaddon',setting:'early',plot:'You come across a previous scrimmage, bodys from both sides lay around. You stop to pay respect to your former comrades, until see a body move from under it comes a')
Encounter.create(name:'Abaddon',setting:'early',plot:'While search for food between abandoned and dilapidated farm houses, you get surprised by a')
Encounter.create(name:'Abaddon',setting:'early',plot:'You see a horse still tied up to a hitching post outside a farm house. Creatures are quickly approaching it, you run over and cut its lead to set it free. Most of the creatures take off after it, none of them will catch it. Still staring at you is a')

Encounter.create(name:'Abaddon',setting:'middle',plot:'While moving through familiar but alien streets you cant shake the feeling you are being watched. Then you hear a noise coming from an unlit house, from the darkness jumps a')
Encounter.create(name:'Abaddon',setting:'middle',plot:'You still hold hope that some people may have survived. you come across the old town hall decaying in state, you know entering is a bad idea but the basement was a rendezvous point for the town. You enter but your hope quickly fades as you see the scene inside, you turn to try an ease your stomach but then you see a')
Encounter.create(name:'Abaddon',setting:'middle',plot:'You hear a massive hoard of undead coming towards you, quickly you move towards the nearest house and jump in through a window. You are safe from the hoard but inside the house is a')
Encounter.create(name:'Abaddon',setting:'middle',plot:'You can see the castle but it is still a ways off, you stop to rest but hear something approaching. Emerging from the darkness you see a')
Encounter.create(name:'Abaddon',setting:'middle',plot:'You hear the sound of approaching hooves, unquestionably a patrol of cursed knights. You quickly make your way into a nearby cellar and close the door behind you. You hear noises coming from behind some barrels in the corner, you hope for a quick and quiet fight when emerges a')



Encounter.create(name:'Abaddon',setting:'late',plot:'While making your way through the castle hallways you run into a')
Encounter.create(name:'Abaddon',setting:'late',plot:'You find a small room with markings all over the wall, you stop only for a second to look but as you turn to leave the room you see a')
Encounter.create(name:'Abaddon',setting:'late',plot:'You get a bit lost within the castle and try to make it back towards the main hall but run into a')

Encounter.create(name:'Abaddon',setting:'transitionMiddle',plot:'You find a break in the wall and start to make your way in, you stop in shock of your former home now in ruins. You hear a noise behind you though and turn around to see a')
Encounter.create(name:'Abaddon',setting:'transitionLate',plot:'You are at the castle now strangly the only guard at the front gate is a')
Encounter.create(name:'Abaddon',setting:'transitionBoss',plot:'You find the throne room, a once wonderful place now filled with decay and horror. Beyond the doors lies Abaddon, you step forward and prepare for battle. Before you can reach the door, smoke fills the room. In the smoke you see a')

Encounter.create(name:'Abaddon',setting:'boss',plot:'Finally you make it to the throne room Abaddon has stolen from the king. You look at your nemesis and he looks at you, both of you know one of you is not leaving this room. Get ready to battle')

