defmodule MIME.Types.Mixfile do
  use Mix.Project

  def project, do: [
    app: :mime,
    
    elixir: "~> 1.0",
    build_embedded:  Mix.env == :prod,
    start_permanent: Mix.env == :prod,
    deps: deps,
    
    version: "0.1.1",
    name: "MIME Types",
    source_url: "https://github.com/christhekeele/mime_types",
    homepage_url: "http://christhekeele.github.io/mime_types",
    
    docs: docs,
    
    package: package,
    
  ]

  def application, do: [
    applications: [:logger],
  ]
  
  defp deps, do: [
    earmark: [only: :dev],
    ex_doc:  [only: :dev],
  ]
  
  defp docs, do: [
    # logo: "path/to/logo.png",
    extras: [
      "README.md",
      "LICENSE.md",
      "CONTRIBUTORS.md",
    ],
  ]
  
  defp package, do: [
    description: "A toolbelt for working with MIME types in Elixir.",
    maintainers: [
      "Chris Keele <dev@chriskeele.com>",
    ],
    licenses: [
      "MIT",
    ],
    links: %{
      Source: "https://github.com/christhekeele/mime_types",
      Homepage: "http://christhekeele.github.io/mime_types",
      Tests: "https://travis-ci.org/christhekeele/mime_types",
    }
  ]
  
end
