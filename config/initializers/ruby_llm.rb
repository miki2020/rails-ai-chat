RubyLLM.configure do |config|
  # config.openai_api_key = ENV["OPENAI_API_KEY"]
  # config.anthropic_api_key = ENV["ANTHROPIC_API_KEY"]
  config.ollama_api_base = ENV.fetch("OLLLAMA_API_BASE", "http://localhost:11434")
  config.default_model = "phi3:latest"
end
