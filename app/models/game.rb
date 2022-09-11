class Game < ApplicationRecord
    has_many :enemies
    has_many :current_rounds
    has_many :characters, through: :current_rounds

    def set_round_on_start
        update(round: 1)
    end

    def round_increment
        if round < 12
            increment!(:round)
        else
            update(round: 1)
        end
    end

    def select_enemy
        last_num = self.enemies.length - 1
        num = rand(0..last_num)

        enemies[num]        
    end
end
