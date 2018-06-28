use Mix.Config

if Mix.env() == :dev do
  config :mix_test_watch,
    clear: true,
    tasks: [
      "test",
      "credo --strict",
      "dialyzer",
      "format --check-formatted"
    ]
end
