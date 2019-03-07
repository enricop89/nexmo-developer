module VideoHelper
  def video_embed_url(video_url)
    if video_url.include? 'youtube'
      video_id = video_url.match(/v=(.{11})/)[1]
      return "https://www.youtube.com/embed/#{video_id}?showinfo=0"
    end

    if video_url.include? 'vimeo'
      video_id = video_url.match(/(\d{7,})/)[1]
      return "https://player.vimeo.com/video/#{video_id}"
    end

    video_url
  end

  def featured_video
    videos = Session.where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)

    if videos.empty?
      videos = Session.where('created_at >= :month', { month: 1.month.ago })
    end
    videos
  end
end
