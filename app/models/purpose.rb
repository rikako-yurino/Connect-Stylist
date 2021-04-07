class Purpose < ActiveHash::Base
  self.data = [
    { id: 1, name: '---'},
    { id: 2, name: '普段用'},
    { id: 3, name: '仕事用'},
    { id: 4, name: 'デート'},
    { id: 5, name: '結婚式用（ゲスト）'},
    { id: 6, name: '学校行事'},
    { id: 7, name: 'その他'}
  ]

  include ActiveHash::Associations
end