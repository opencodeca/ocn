module PopularSorting
  def self.included(base)
    base.class_eval do
      scope :popular, -> do
        table_name = base.table_name
        limit_updated_at = 2.months.ago
        rank_select = "
          #{table_name}.*,
          round(((#{table_name}.comments_count + 3 * #{table_name}.like_emotions_count)
          /power(((extract(epoch from now()) - extract(epoch from #{table_name}.created_at))/200),0.7)
          )::numeric, 8) as rank
        ".gsub(/\s+/, " ").strip

        select(rank_select).where('updated_at >= ?', limit_updated_at).order('rank DESC')
      end
    end
  end
end
