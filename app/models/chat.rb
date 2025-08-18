class Chat < ApplicationRecord
  acts_as_chat
  validates :model_id, presence: true
  validates :provider, presence: true

  after_initialize :set_chat

  def set_chat
    @chat = RubyLLM.chat(model: model_id, provider: provider)
  end
end
