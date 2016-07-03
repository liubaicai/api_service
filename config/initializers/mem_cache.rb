$cache_cache = ActiveSupport::Cache::MemoryStore.new
scheduler = Rufus::Scheduler.new
scheduler.every '60m' do
  articles = Article.limit(5).order('views DESC')
  $cache_cache.write('get_hot_articles',articles)
end