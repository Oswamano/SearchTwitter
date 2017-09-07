class Setting < ActiveRecord::Base

  cattr_accessor :settings
  attr_accessor :default
  
  before_save :check_category
  before_create :set_default_value
  
  def self.get key, default = nil
    check_settings

    if not self.settings[key]
      k = Setting.find_or_initialize_by(setting_key: key)
      if k.setting_value.nil?
        if not default.nil?
          k.setting_value = default
        else
          k.setting_value = k.setting_key.to_s.titlecase
        end
        k.save
      end
      self.settings[key] = k.setting_value
    end
    self.settings[key].to_s.gsub("&amp;","&")
  end
  
  def self.set key,value
    check_settings

    k = Setting.find_or_create_by(setting_key: key)
    k.setting_value = value
    k.save
    self.settings[key] = value
  end

  def self.check_settings
    if not self.settings
      self.settings = {}
    end
  end

  def check_category
    if self.setting_category.nil? or self.setting_category.length == 0
      self.setting_category = "Uncategorized"
    end
  end

  def set_default_value
    if self.setting_value.nil?
      self.setting_value = "UNDEFINED"
    end
  end

end



