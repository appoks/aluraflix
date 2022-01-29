class ApplyCategoryToVideos < ActiveRecord::Migration[6.1]
  def change
    if Category.first.nil?
      category = Category.create(title: 'LIVRE', color: '#CDCDCD')
      category.save
    end

    @videos = Video.where(category: nil)

    @videos.each do |video|
      video.category_id = 1
      video.save
    end
  end
end
