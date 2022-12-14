class Game < ApplicationRecord
    has_many :enemies
    has_many :current_rounds
    has_many :characters, through: :current_rounds

    def set_round_on_start
        update(round: 1)
    end

    def round_increment
        if round <= 13
            increment!(:round)
        else
            update(round: 1)
        end
    end

    def select_enemy(encounter)

        enemy_list = enemies.sort{|a,b|a.power<=>b.power}
        not_boss = (enemies.length - 2)
        half = (enemy_list.length/2)
        easy = enemies.length/half
            case encounter.setting

                when 'early'
                    num = rand(0..easy)
                    enemy_list[num]

                when 'transitionMiddle'
                    enemy_list[4]

                when 'middle'
  
                    num = rand(easy..half)
                    enemy_list[num]

                when 'transitionLate'
                    enemy_list[6]

                when 'late'
                    num= rand(half..not_boss)
                    enemy_list[num]

                when 'transitionBoss'
                    enemy_list[7]

                when 'boss'
                    enemy_list.last
            end        
    end


end
