class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'TOPS' },
    { id: 3, name: 'BOTTOMS' },
    { id: 4, name: 'DRESS' },
    { id: 5, name: 'SHOES' },
    { id: 6, name: 'OUTERS' },
    { id: 7, name: 'BAGS' },
    { id: 8, name: 'ACCESSORIES' },
    { id: 9, name: 'PAFUMES' },
    { id: 10, name: 'UNDERWERE' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :dresses

  end