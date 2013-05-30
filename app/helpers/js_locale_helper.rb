module JsLocaleHelper

  def self.output_locale(locale)

    locale_str = locale.to_s

    translations = YAML::load(File.open("#{Rails.root}/config/locales/client.#{locale_str}.yml"))
    #admin_contents = translations[locale_str].delete('admin_js')

    translations[locale_str]['js'].merge!(admin_contents) if admin_contents.present?
    result  = "I18n.translations = #{translations.to_json};\n"
    result << "I18n.locale = '#{locale_str}'\n"
    result
  end

end
