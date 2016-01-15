class Post < ActiveRecord::Base
  belongs_to :user
  has_attached_file :avatar, styles: {
        :medium => {
          :geometry => "640x480",
          :format => 'mp4'
        },
        :thumb => { :geometry => "160x120", :format => 'jpeg', :time => 10}
    }, :processors => [:transcoder]
    validates_attachment_content_type :avatar, content_type: /\Avideo\/.*\Z/
end
