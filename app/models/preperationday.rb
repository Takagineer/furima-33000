class Preperationday < ActiveHash::Base
  self.data =[
    {id: 1, name: '---'}, {id: 2, name: '1~2日)'}, {id: 3, name: '送料込み(出品者負担)'}
  ]

  include ActiveHash::Associations
  has_many :items
end
