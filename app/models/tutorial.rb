class Tutorial < ActiveRecord::Base
  ActiveRecord::Base.include_root_in_json = false
  acts_as_taggable
  validates_presence_of :title,:video,:image_url
  validates_uniqueness_of :title
end
