module PostPopularSorting
  extend ActiveSupport::Concern

  included do
    scope :popular, -> do
      limit_updated_at = Time.now - 2.month
      rank_select = "
        posts.*,
        /power(((unix_timestamp(utc_timestamp())-unix_timestamp(posts.created_at))/200),0.7)
        ), 8) as rank
        round(((posts.comments_count + 3 * posts.like_emotions_count)
      ".gsub(/\s+/, " ").strip

      select(rank_select).where('updated_at >= ?', limit_updated_at).order('rank DESC')
    end
  end
end
