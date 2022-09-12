# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#p1 = Combatant.create(username:'jeremy',password_digest: BCrypt::Password.create('harry'))
p2 = Combatant.create(username:'klofnod',password_digest: BCrypt::Password.create('crazy11'))
#p3 = Combatant.create(username:'kenky',password_digest: BCrypt::Password.create('hotdog'))
#p4 = Combatant.create(username:'shib',password_digest: BCrypt::Password.create('password'))

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

Enemy.create(name:'Possessed Farmer',description:'The poor soul has been corrupted', health:8,power:2,defence:3,game_id:g1.id)
Enemy.create(name:'Undead Shambler',description:'Beyond corrupt, raised to do the bidding of Abaddon',health:6,power:2,defence:7,game_id:g1.id)
Enemy.create(name:'Giant Rat',description:'With the fields untended it has grown huge',health:5,power:3,defence:5,game_id:g1.id)
Enemy.create(name:'Possessed Guard',description:'The poor soul has been corrupted',health:10,power:4,defence:10,game_id:g1.id)
Enemy.create(name:'Undead Soldier',description:'Beyond corrupt, this one has been outfitted with a sword and armor',health:8,power:4,defence:8,game_id:g1.id)
Enemy.create(name:'Possessed Shopkeeper',description:'The poor soul has been corrupted',health:8,power:3,defence:6,game_id:g1.id)
Enemy.create(name:'Boneclaw',description:'Beyond corrupt, even animals are not safe from Abaddon. A bear skeleton reanimated for battle',health:12,power:6,defence:5,game_id:g1.id)
Enemy.create(name:'Black Knight',description:'Beyond corrupt, One of Abaddons elite fighters',health:15,power:5,defence:15,game_id:g1.id)
Enemy.create(name:'Abaddon',description:'Beyond corrupt, raised to do the bidding of another',health:25,power:9,defence:20,game_id:g1.id)


Enemy.create(name:'witch',description:'huge hat',health:6,power:7,defence:5,game_id:g2.id)
Enemy.create(name:'gambler',description:'huge debdt',health:7,power:3,defence:5,game_id:g2.id)




Enemy.create(name:'blade thrower',description:'huge blade',health:9,power:2,defence:5,game_id:g3.id)
Enemy.create(name:'death knight',description:'huge',health:5,power:4,defence:7,game_id:g3.id)
Enemy.create(name:'dragon',description:'huge wings',health:15,power:5,defence:5,game_id:g3.id)

Gear.create(name:'sword',description:'very pointy',effect:'damage',power:5)
Gear.create(name:'hammer',description:'very heavy',effect:'damage',power:5)
Gear.create(name:'chest plate',description:'very stong',effect:'defence',power:8)
Gear.create(name:'mace',description:'very round',effect:'damage',power:5)
Gear.create(name:'helmet',description:'very metal',effect:'defence',power:2)
Gear.create(name:'bow',description:'very strechty',effect:'damage',power:1)
Gear.create(name:'scimitar',description:'very curved',effect:'damage',power:6)
Gear.create(name:'greaves',description:'very leather',effect:'defence',power:5)
Gear.create(name:'health potion',description:'very healthy',effect:'health',power:7)
Gear.create(name:'ring of power',description:'very power',effect:'damage',power:5)











Encounter.create(name:'Abaddon',setting:'early',plot:'While crossing a farm field you are attacked by')
Encounter.create(name:'Abaddon',setting:'early',plot:'You hear a scream come from a nearby house you rush in but are too late, over a dead body is')
Encounter.create(name:'Abaddon',setting:'early',plot:'Looking for a way into the wall you find come across a')
Encounter.create(name:'Abaddon',setting:'early',plot:'You find a break in the wall and start to make your way in, you hear a noise behind you though and turn around to see a')
Encounter.create(name:'Abaddon',setting:'middle',plot:'While moving through the city streets you run into a')
Encounter.create(name:'Abaddon',setting:'middle',plot:'While searching for survivors you are ambushed by a')
Encounter.create(name:'Abaddon',setting:'middle',plot:'You hear a massive hoard of undead coming towards you, quickly you move towards the nearest house and jump in through a window. You are safe from the hoard but inside the house is a')
Encounter.create(name:'Abaddon',setting:'middle',plot:'You can see the castle but it still a ways off, you stop to rest but hear something approaching. Emerging from the dark you see a ')
Encounter.create(name:'Abaddon',setting:'late',plot:'You are at the castle now strangly the only guard at the front gate is a')
Encounter.create(name:'Abaddon',setting:'late',plot:'While making your way through the castle hallways you run into a')
Encounter.create(name:'Abaddon',setting:'late',plot:'You find a small room with markings all over the wall, you stop only for a second to look but as you turn to leave the room you see a')
Encounter.create(name:'Abaddon',setting:'late',plot:'You get a bit lost within the castle and try to make it back towards the main hall but run into a')
Encounter.create(name:'Abaddon',setting:'boss',plot:'Finally you make it to the throne room Abaddon has stolen from the king. You look at your nemesis and he looks at you, both of you know one of you is not leaving this room. Get ready to battle')






