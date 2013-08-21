defmodule Streamers do
  defrecord M3U8, program_id: nil, bandwidth: nil, path: nil

  @doc """
  Find streaming index file in the given directory
  
  ## EXAMPLES

    iex> Streamers.find_index("buns/tastical")
    nil

  """

  def find_index(directory) do
    files = Path.join(directory, "*.m3u8")
    if file = Enum.find Path.wildcard(files), is_index?(&1) do 
      file
    end
  end

  def extract_m3u8(index_file) do
    File.open! index_file, fn(pid) ->
    # Discards #EXTM3U
    IO.readline(pid)
    do_extract_m3u8(pid, [])
  end

  def do_extraxt_m3u8(pid, acc)
    case IO.readline(pid) do
      :eof -> figure_this)out
      stream_inf ->
        path = IO.readline(pid)
        do_extract_m3u8(pid, stream_inf, path, acc)
    end
  end

  defp is_index?(file) do
    File.open! file, fn(pid) ->
      IO.read(pid, 25) == "#EXTM3U\n#EXT-X-STREAM-INF"
    end
  end
end
