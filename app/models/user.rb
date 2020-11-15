class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 validates :name,       presence: true

 validates :first_name,    presence: true,
            format: {with: /\A[\p{Hiragana}||\p{Katakana}||[ー－]||[一-龠々]]+\z/,
            #messege: "can only use Full-width japanese"
            }

 validates :last_name, presence: true,
            format: {with: /\A[\p{Hiragana}||\p{Katakana}||[ー－]||[一-龠々]]+\z/,
            #messege: "can only use Full-width japanese"
            }

 validates :first_kana,   presence: true,
            format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
            #message: "can only use Full-width kana"
            }

 validates :last_kana,   presence: true,
            format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
            #message: "can only use Full-width kana"
            }

 validates :birthday,   presence: true

 validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/, 
            #messege: "requires the use of both numbers and alphabets"
            }

 #has_many :items
 #has_many :boughts
end
