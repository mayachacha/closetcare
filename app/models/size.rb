class Size < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'XSS' },
    { id: 3, name: 'XS' },
    { id: 4, name: 'S' },
    { id: 5, name: 'M' },
    { id: 6, name: 'L' },
    { id: 7, name: 'XL' },
    { id: 8, name: 'XXL' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :dresses
  
  end