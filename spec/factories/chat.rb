FactoryBot.define do
  factory :chat do
    user
    model_id { "ollama3.2:3b" }
    provider { "test" }
  end
end
