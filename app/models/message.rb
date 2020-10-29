class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?
 #設定されているバリデーションの内容は以下の通りです。
 #contentとimageの値が空の状態ではDBに保存できないこと
 #imageの値が空でもcontentの値が存在すれば、contentをDBに保存できること
 #contentの値が空でもimageの値が存在すれば、imageをDBに保存できること
 #もしbelongs_to :userの場合は、presenceは不要

  def was_attached?
    self.image.attached?
  end
end

