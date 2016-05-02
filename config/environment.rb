# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# 七牛云构建鉴权对象
Qiniu.establish_connection!(:access_key => '',:secret_key => '')