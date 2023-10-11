Mix.install([:json])

[issue_url] = System.argv() |> IO.inspect(label: "ARGV")

Process.sleep(1000)

# {_collectable, 0} =
  IO.read(:stdio, :eof)
  # |> IO.inspect(label: "STDIN STRING", limit: :infinity)
  |> JSON.decode!()
  # |> IO.inspect(label: "PARSED JSON", pretty: true, limit: :infinity)
  |> Map.get("items")
  |> Enum.find(& &1["content"]["url"] == issue_url)
  |> Map.get("id")
  |> then(& "\n\nTICKET_ID #{&1}")
  |> IO.puts()
  # |> IO.inspect(label: "TICKET_ID")
  # |> then(& "export #{ticket_id_env}=\"#{&1}\"")
  # |> System.shell(into: IO.stream())
