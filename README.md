MIME.Types
==========

> **A toolbelt for working with MIME types in Elixir.**

This was extracted from [Plug](https://github.com/elixir-lang/plug) so that other projects can make use of it.

Installation
------------

To install through Hex:

  1. Add `mime_types` to your list of dependencies in `mix.exs`:

        def deps do
          [{:mime_types, "~> 0.1.0"}]
        end

  2. Add any custom types you want to your `config/config.exs`:

        config :mime_types, custom: %{
          "application/vnd.api+json" => ["json-api"]
        }

