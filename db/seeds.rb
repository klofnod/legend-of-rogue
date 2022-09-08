# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p1 = Combatant.create(username:'jeremy',password_digest: BCrypt::Password.create('harry'))
p2 = Combatant.create(username:'klofnod',password_digest: BCrypt::Password.create('crazy11'))
p3 = Combatant.create(username:'kenky',password_digest: BCrypt::Password.create('hotdog'))
p4 = Combatant.create(username:'shib',password_digest: BCrypt::Password.create('password'))

Character.create(name:'klofnod',backstory:'lived long hasnt died',health:7,power:8,defence:4,combatant_id:p1.id)
Character.create(name:'grandad',backstory:'fast guy',health:7,power:8,defence:4,combatant_id:p1.id)
Character.create(name:'aurthor',backstory:'cant be caught',health:5,power:8,defence:4,combatant_id:p1.id)
Character.create(name:'deathblade',backstory:'now dead',health:15,power:8,defence:4,combatant_id:p1.id)
Character.create(name:'king john',backstory:'woobly oobly',health:12,power:8,defence:4,combatant_id:p2.id)
Character.create(name:'bacon',backstory:'has a nice smile',health:34,power:8,defence:4,combatant_id:p2.id)
Character.create(name:'kikkkkko',backstory:'two in the hand',health:76,power:8,defence:4,combatant_id:p3.id)
Character.create(name:'seannnn',backstory:'spinning for gear',health:2,power:8,defence:4,combatant_id:p3.id)
Character.create(name:'babbba',backstory:'already has a tombstone',health:16,power:8,defence:4,combatant_id:p3.id)
Character.create(name:'quilt',backstory:'cant be left alone',health:4,power:8,defence:4,combatant_id:p4.id)
Character.create(name:'horray',backstory:'got two more hearts then you',health:1,power:8,defence:4,combatant_id:p4.id)

g1= Game.create(round:1)
g2= Game.create(round:1)
g3= Game.create(round:1)

e1= Enemy.create(name:'orc',description:'huge armor',health:8,power:4,defence:5,game_id:g1.id)
e1= Enemy.create(name:'eagle',description:'huge talons',health:3,power:2,defence:5,game_id:g1.id)
e1= Enemy.create(name:'witch',description:'huge hat',health:6,power:7,defence:5,game_id:g2.id)
e1= Enemy.create(name:'gambler',description:'huge debdt',health:7,power:3,defence:5,game_id:g2.id)
e1= Enemy.create(name:'blade thrower',description:'huge blade',health:9,power:2,defence:5,game_id:g3.id)
e1= Enemy.create(name:'death knight',description:'huge',health:5,power:4,defence:7,game_id:g3.id)
e1= Enemy.create(name:'dragon',description:'huge wings',health:15,power:5,defence:5,game_id:g3.id)

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


Encounter.create(name:'War',setting:'field of war',plot:'you are attacked by')
Encounter.create(name:'rest',setting:'small plains',plot:'you rest by camp fire')
Encounter.create(name:'sneak attack',setting:'road',plot:'you are ambushed by')
Encounter.create(name:'battle',setting:'throne room',plot:'you must fight')
Encounter.create(name:'river battle',setting:'river crossing',plot:'you are ambushed while crossing the river by')






