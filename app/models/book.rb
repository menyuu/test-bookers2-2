class Book < ApplicationRecord

  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}

  belongs_to :user

  def self.search_for(content, method)
    if method == 'perfect'
      Book.where(title: content)
    elsif method == 'forward'
      Book.where('title LIKE ?', content + '%')
    elsif method == 'backward'
      Book.where('title LIKE ?', '%' + content)
    elsif method == 'partial'
      Book.where('title LIKE ?', '%' + content + '%')
    else
      Book.all
    end
  end

end