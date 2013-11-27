class Settings < Settingslogic
  source "#{Rails.root}/config/config.yml"
  namespace Rails.env
  load! if Rails.env.development?
end
