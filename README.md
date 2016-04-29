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

Usage
-----

The `MIME` module has a very slim interface:

- [valid?/1](https://hexdocs.pm/mime_types/MIME.html#valid?/1)

  Returns whether a MIME type is registered.
  
- [type/1](https://hexdocs.pm/mime_types/MIME.html#type/1)

  Returns the MIME type associated with a file extension.
  
- [path/1](https://hexdocs.pm/mime_types/MIME.html#path/1)
  
  Guesses the MIME type based on the path’s extension.

- [types/0](https://hexdocs.pm/mime_types/MIME.html#types/0)

  List all registered MIME types.
  
- [extensions/0](https://hexdocs.pm/mime_types/MIME.html#extensions/0)

  List all file extensions registered with MIME types.
  
- [mapping/0](https://hexdocs.pm/mime_types/MIME.html#mapping/0)

  Show the complete MIME type mapping.
  
### MIME.Types

Additionaly, you can `use MIME.Types` to [generate your own registry](https://hexdocs.pm/mime_types/MIME.Types.html). Tack on a Map or Keyword list to supply it with extra types.

Contributing
------------

PRs welcome and appreciated [here](https://github.com/christhekeele/mime_types/pulls)!

