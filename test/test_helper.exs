defmodule Mr.MIME do
  use MIME.Types, %{
    "custom_type" => "single",
    "custom_types" => ["multiple", "types"],
    atom_type: :atom,
  }
end

ExUnit.start()