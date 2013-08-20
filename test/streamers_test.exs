defmodule StreamersTest do
  use ExUnit.Case

  test "find index file in a directory" do
    assert Streamers.find_index("tests/fixtures/emberjs") ==
      "9af0270acb795f9dcafb5c51b1907628.m38u"
  end
end
