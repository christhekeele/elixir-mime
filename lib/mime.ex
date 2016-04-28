defmodule MIME do
  
  @moduledoc """
  Utilities for working with common MIME types.
  
  The MIME types registry can be extended
  in your application configuration as follows:
  
      config :mime_types, :custom, %{
        "application/vnd.api+json" => ["json-api"]
      }
      
  After adding the configuration, MIME.Types needs to be recompiled.
  If you are using mix, this can be accomplished with:
  
      $ mix deps.clean mime_types --build
      $ mix deps.get
      
  """
  
  # Tag MIME as :no_native due to file size
  @compile :no_native
  
  @default_type "application/octet-stream"
  
  use MIME.Types, Application.get_env(:mime_types, :custom, %{})
  
  @doc """
  Returns a list of MIME type + associated extensions two-tuples.
  """
  def mapping

  @doc """
  Returns whether a MIME type is registered.
  ## Examples
      iex> MIME.valid?("text/plain")
      true
      iex> MIME.valid?("foo/bar")
      false
  """
  @spec valid?(String.t) :: boolean
  def valid?(type) do
    is_list entry(type)
  end
  
  @doc """
  Returns a list of all known extensions associated with MIME types.
  """
  def extensions
  
  @doc """
  Returns the extensions associated with a given MIME type.
  ## Examples
      iex> MIME.extensions("text/html")
      ["html", "htm"]
      iex> MIME.extensions("application/json")
      ["json"]
      iex> MIME.extensions("foo/bar")
      []
  """
  @spec extensions(String.t) :: [String.t]
  def extensions(type) do
    entry(type) || []
  end
  
  @doc """
  Returns a list of all known MIME types.
  """
  def types
  
  @doc """
  Returns the MIME type associated with a file extension. If no MIME type is
  known for `file_extension`, `#{inspect @default_type}` is returned.
  ## Examples
      iex> MIME.type("txt")
      "text/plain"
      iex> MIME.type("foobarbaz")
      #{inspect @default_type}
  """
  @spec type(String.t) :: String.t
  def type(file_extension)
  
  for {type, exts} <- @type_mapping, ext <- exts do
    def type(unquote(ext)), do: unquote(type)
  end
  
  def type(_ext), do: @default_type
  
  @doc """
  Guesses the MIME type based on the path's extension. See `type/1`.
  ## Examples
      iex> MIME.path("index.html")
      "text/html"
  """
  @spec path(Path.t) :: String.t
  def path(path) do
    case Path.extname(path) do
      "." <> ext -> type(downcase(ext, ""))
      _ -> @default_type
    end
  end
  
  @nodoc """
  Efficiently downcases letters in extensions.
  """
  defp downcase(<<h, t::binary>>, acc) when h in ?A..?Z, do: downcase(t, <<acc::binary, h+32>>)
  defp downcase(<<h, t::binary>>, acc), do: downcase(t, <<acc::binary, h>>)
  defp downcase(<<>>, acc), do: acc
  
  # entry/1
  @spec entry(String.t) :: list(String.t)
  
  @nodoc """
  Looks up a MIME type extension from the mapping db.
  """
  for {type, extensions} <- @mapping do
    defp entry(unquote(type)), do: unquote(extensions)
  end
  
  defp entry(_type), do: nil
  
end