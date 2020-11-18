class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name

    validates :first_name,
               format: {with: /\A[\p{Hiragana}||\p{Katakana}||[ー－]||[一-龠々]]+\z/,
               #messege: "can only use Full-width japanese"
               }

    validates :last_name,
               format: {with: /\A[\p{Hiragana}||\p{Katakana}||[ー－]||[一-龠々]]+\z/,
               #messege: "can only use Full-width japanese"
               }

    validates :first_kana,
               format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
               #message: "can only use Full-width kana"
               }

    validates :last_kana,
               format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
               #message: "can only use Full-width kana"
               }

    validates :birthday

  end

  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/, 
            #messege: "requires the use of both numbers and alphabets"
            }

 has_many :items
 has_many :orders
end
