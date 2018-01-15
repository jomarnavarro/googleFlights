# Loads the configuration from the yaml file.
class Config
  class << self
    ENV_CONFIG_VARIABLES = {
      url: 'GOOGLE_FLIGHTS_URL',
      browser: 'BROWSER'
    }.freeze
    PROPS_PATH = './features/support/props.yaml'.freeze

    def load_config_file
      config = YAML.load_file(PROPS_PATH)
      YAML.load_file(PROPS_PATH).each { |k, v| config[k.to_s] = v }
      ENV_CONFIG_VARIABLES.each do |key, variable_name|
        config[key.to_s] = ENV[variable_name] if ENV[variable_name]
      end
      config['browser'] = config['browser'].to_sym
      config['urls']['google'] = config['url'] if config['url']
      config
    end
  end
end
