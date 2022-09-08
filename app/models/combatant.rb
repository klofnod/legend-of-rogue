class Combatant < ApplicationRecord
    has_many :characters
    has_secure_password

    validates :username, presence: true, uniqueness: true

    def select_alive
        characters.where(["health > 0"]).sort { |a,b| a.id <=> b.id }
    end

    def select_dead
        characters.where(["health <= 0"]).sort { |a,b| a.id <=> b.id }
    end

   

    def password=(new_password)
        salt = BCrypt::Engine::generate_salt
        self.password_digest = BCrypt::Engine::hash_secret(new_password, salt)
    end
    
    
    def authenticate(password)
        salt = password_digest[0..28]
        return nil unless BCrypt::Engine::hash_secret(password, salt) == self.password_digest
        self
    end
end
