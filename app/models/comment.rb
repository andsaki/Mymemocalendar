class Comment < ApplicationRecord
  belongs_to :post
  
  # commenterは入力が必須（presence -> 存在していることが必須）
  validates :commenter, :presence => true

  # bodyは入力が必須かつ、文字数の長さが最低５は必須
  validates :body, :presence => true,
                      :length => { :minimum => 5 }
end
