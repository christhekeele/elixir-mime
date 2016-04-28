MIME.Types
==========

> **A standardized Elixir toolbelt for working with MIME types.**

Installation
------------

To install through Hex:

  1. Add `mime_types` to your list of dependencies in `mix.exs`:

        def deps do
          [{:mime_types, "~> 0.1.0"}]
        end

  2. Add any custom types you want to your `config/config.exs`:

        config :mime, :types, %{
          "application/vnd.api+json" => ["json-api"]
        }

