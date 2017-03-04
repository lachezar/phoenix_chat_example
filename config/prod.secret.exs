use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :chat, Chat.Endpoint,
  secret_key_base: "random_symbols_here_plz"
