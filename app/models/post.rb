class Post < ApplicationRecord
  
  # titleは入力が必須（presence -> 存在していることが必須）
  validates :title, :presence => true

  # titleは入力が必須かつ、文字数の長さが最低５は必須
  validates :content, :presence => true,
                      :length => { :minimum => 5 }

  # PostオブジェクトはたくさんのCommentオブジェクトを持つ
  has_many :comments
end
