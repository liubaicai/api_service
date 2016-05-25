class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :filter_req
    
  $bots = [
      "Googlebot",
      "360Spider",
      "HaosouSpider",
      "Baiduspider",
      "Yahoo! Slurp",
      "bingbot",
      "YisouSpider",
      "Sogou web spider",
      "Alibaba.Security.Heimdall",
      "msnbot"
      ];

  $bad_bots = [
      "MSIE 6.0",
      "AhrefsBot",
      "JikeSpider",
      "adVisionCrawler.py",
      "InetURL",
      "MJ12bot",
      "SurveyBot",
      "Uptimebot",
      "heritrix",
      "spiderman",
      "Mail.RU_Bot",
      "Python-urllib",
      "Qwantify",
      "FeedDemon",
      "BOT/0.1 (BOT for JCE)",
      "CrawlDaddy",
      "Java",
      "Jullo",
      "Feedly",
      "UniversalFeedParser",
      "ApacheBench",
      "Swiftbot",
      "YandexBot",
      "ZmEu phpmyadmin",
      "WinHttp",
      "EasouSpider",
      "HttpClient",
      "Microsoft URL Control",
      "YYSpider",
      "jaunty",
      "oBot",
      "Indy Library",
      "FlightDeckReports Bot",
      "Linguee Bot",
      "NetcraftSurveyAgent",
      "Go http package",
      "SEOkicks-Robot",
      "SafeDNSBot",
      "PagesInventory",
      "linkdexbot",
      "Exabot",
      "360JK qiyunce",
      "BLEXBot",
      "MegaIndex"
      ];

  def include_badbots? str
      if str.nil? || str == ""
          return true
      end
      $bad_bots.each do |item|
          if str.include?(item)
              return true
          end
      end
      return false
  end

  def include_bots? str
      if str.nil? || str == ""
          return true
      end
      $bots.each do |item|
          if str.include?(item)
              return true
          end
      end
      return false
  end
  
  def filter_req
    if include_badbots? request.user_agent
      render plain: "爬虫木有小JJ"
    elsif include_bots? request.user_agent
      #do nothing
    elsif request.user_agent.to_s.size < 15
      render plain: "你是猴子派来的爬虫么"
    else
      ReqLog.insert(request.remote_ip,request.url,request.method,request.user_agent)
    end
  end
end
