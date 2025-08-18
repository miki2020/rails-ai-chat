RubyLLM.configure do |config|
  config.ollama_api_base = ENV.fetch("OLLAMA_API_BASE", "http://localhost:11434/v1")
  # config.default_provider = "ollama"
  config.default_model = "llama3.2:1b"

  # This should silence the "Assuming model exists" warning and allow unknown models
  config.log_assume_model_exists = false
  config.log_level = :debug
end
