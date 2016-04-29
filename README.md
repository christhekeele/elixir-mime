MIME.Types
==========

> **A toolbelt for working with MIME types in Elixir.**

This was extracted from [Plug](https://github.com/elixir-lang/plug) so that other projects can make use of it.


Installation
------------
>[![Version][hex-version-badge] ![Hex][hex-downloads-badge] ![License][hex-license-badge]][hex]

[hex]:                 https://hex.pm/packages/mime_types
[hex-version-badge]:   https://img.shields.io/hexpm/v/mime_types.svg?maxAge=86400&style=flat-square
[hex-downloads-badge]: https://img.shields.io/hexpm/dt/mime_types.svg?maxAge=86400&style=flat-square
[hex-license-badge]:   https://img.shields.io/badge/license-MIT-7D26CD.svg?maxAge=86400&style=flat-square

To install through Hex:

1. Add `mime_types` to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:mime, "~> 0.2.0"}]
  end
  ```

2. Add any custom types you want to your `config/config.exs`:


  ```elixir
  config :mime, :types, %{
    "application/vnd.api+json" => ["json-api"]
  }
  ```

Usage
-----

> **[Full API Docs](https://hexdocs.pm/mime_types/api-reference.html)**

The `MIME` module has a minimal surface area:

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

Contributing
------------

> **PRs welcome and appreciated [here](https://github.com/christhekeele/mime_types/pulls)!**

|         :thumbsup:         |  [Continuous Integration][travis-badge]   |
|:--------------------------:|:-----------------------------------------:|
|      [Master][master]      |   ![Build Status][master-travis-badge]    |
| [Development][development] | ![Build Status][development-travis-badge] |

[travis-badge]: https://travis-ci.org/christhekeele/mime_types

[master]:              https://github.com/christhekeele/mime_types/tree/master
[master-travis-badge]: https://img.shields.io/travis/christhekeele/mime_types/master.svg?maxAge=86400&style=flat-square

[development]:              https://github.com/christhekeele/mime_types/tree/development
[development-travis-badge]: https://img.shields.io/travis/christhekeele/mime_types/development.svg?maxAge=86400&style=flat-square

