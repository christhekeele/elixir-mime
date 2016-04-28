defmodule MIME.Types do
  
  @moduledoc """
  Builds a MIME type registry with common and custom types.
  
  To create your own MIME type registry:
  
      defmodule Mr.MIME do
        use MIME.Types, %{
          "application/vnd.api+json" => ["json-api"]
        }
      end
  
  This will build a registry of MIME types under `mapping/0`,
  and lists `types/0` and `extensions/0` for checking inclusion.
  
  If you change the custom mapping passed into the macro,
  your module will need to be recompiled.
  """
  
  defmacro __using__(custom_types \\ []) do
    quote do
      
      # MIME types source
      @mime_types_db unquote( Path.join([__DIR__, "types.db"]) )
      
      Module.register_attribute __MODULE__, :type_mapping, accumulate: true
      
      # Read all the MIME type mappings into the `@type_mapping` variable.
      @mime_types_db |> File.stream!([], :line) |> Stream.map(fn line ->
        unless String.starts_with?(line, ["#", "\n"]) do
          [ type | exts ] = line |> String.strip |> String.split
          @type_mapping { type, exts }
        end
      end ) |> Stream.run
      
      # Merge `custom_types` types into `@type_mapping` as `@mapping`
      @mapping unquote(custom_types) |> Enum.reduce(@type_mapping, fn {type, extensions}, mapping ->
        List.keystore(mapping, type, 0, { to_string(type), Enum.map(List.wrap(extensions), &to_string/1) })
      end ) |> List.keysort(0)
      
      # @compile :inline_list_funcs #?
      def mapping,    do: @mapping
      def types,      do: @mapping |> Enum.map(&(elem(&1, 0)))
      def extensions, do: @mapping |> Enum.map(&(elem(&1, 1))) |> List.flatten |> Enum.uniq |> Enum.sort
      
    end
  end
  
end