defmodule MIME.TypesTest do
  use ExUnit.Case, async: true

  import Mr.MIME

  doctest MIME.Types

  test "mapping" do
    assert {"custom_type",  ["single"]}            in mapping
    assert {"custom_types", ["multiple", "types"]} in mapping
    assert {"atom_type",    ["atom"]}              in mapping
  end

  test "types" do
    assert "custom_type"  in types
    assert "custom_types" in types
    assert "atom_type"    in types
  end

  test "extensions" do
    assert "single"   in extensions
    assert "multiple" in extensions
    assert "types"    in extensions
    assert "atom"     in extensions
  end
  
end
