Code.require_file "../test_helper.exs", __FILE__

defmodule StreamersTest do
  use ExUnit.Case, async: true

  doctest Streamers
  alias Streamers.M3U8, as: M3U8

  @index_file "test/fixtures/emberjs/9af0270acb795f9dcafb5c51b1907628.m3u8"

  test "finds index file in a directory" do
    assert Streamers.find_index("test/fixtures/emberjs") ==
      "test/fixtures/emberjs/9af0270acb795f9dcafb5c51b1907628.m3u8"
  end

  test "returns nil for not available index file" do
    assert Streamers.find_index("test/fixtures/not_available") ==
      nil
  end

  test "extracts m3u8 from index file" do
    m3u8s = Streamers.extract_m3u8(@index_file)
    assert Enum.first(m3u8s) == 
      M3U8[program_id: 1, bandwidth: 110000, path: "test/fixtures/emberjs/8bda35243c7c0a7fc69ebe1383c6464c.m3u8"]
  end
end
