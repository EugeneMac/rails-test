class Post < ActiveRecord::Base
  before_create :user
  has_many :comments, dependent: :destroy
  has_many :tags
  validates :title, presence:true, length: {minimum:5}
  attr_accessible :text, :title, :tags_attributes, :user
  accepts_nested_attributes_for :tags, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  belongs_to :user  
end
