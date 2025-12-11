defmodule StringHelper do
  import Guards

  def sanitize(nil), do: nil

  def sanitize(value) when is_bitstring(value) do
    value
    |> String.normalize(:nfkc)
    |> String.trim()
  end

  def try_parse_uri(raw_uri) when is_not_nil_or_empty_string(raw_uri) do
    case URI.new(raw_uri) do
      {:ok, uri} -> {:ok, uri}
      {:error, _} -> :none
    end
  end

  def try_parse_uri(_raw_uri), do: :none
end
