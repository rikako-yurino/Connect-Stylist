class FrameType < ActiveHash::Base
  self.data = [
    { id: 1, name: '---'},
    { id: 2, name: 'ストレート'},
    { id: 3, name: 'ウェーブ'},
    { id: 4, name: 'ナチュラル'}
  ]

  include ActiveHash::Associations
  has_many :users
end