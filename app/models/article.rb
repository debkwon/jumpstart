class Article < ActiveRecord::Base
	has_many :comments
	has_many :taggings
	has_many :tags, through: :taggings

	def tag_list
		tags.join(",")
	end

	def tag_list=(tags_string)
		tag_names = tags_string.split(",").collect { |s| s.strip.downcase}.uniq #splitting, mapping, then de-spacing, gathering only unique tag names
		new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name)} #storing the tag name collection and finding or creating a tag by that name
		self.tags = new_or_found_tags #assigning the tag list as the tags of the article
	end
end
