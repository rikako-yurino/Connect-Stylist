class Style < ActiveHash::Base
  self.data = [
    { id: 1, name: '---'},
    { id: 2, name: 'シンプル'},
    { id: 3, name: 'カジュアル'},
    { id: 4, name: 'スタイリッシュ'},
    { id: 5, name: 'エレガント'},
    { id: 6, name: 'フェミニン'},
    { id: 7, name: 'コンサバティブ'},
    { id: 8, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :rooms
end