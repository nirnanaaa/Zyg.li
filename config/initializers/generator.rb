
# HACK
unless Rails.env.production? 
  Rails.application.config.generators do |g|
    g.test_framework = :rspec
  end

end 
