Mix.install([:json])

[issue_url] = System.argv() |> IO.inspect(label: "ARGV")

Process.sleep(1000)

:ok =
  IO.read(:stdio, :eof)
  |> JSON.decode!()
  |> Map.get("items")
  |> Enum.find(& &1["content"]["url"] == issue_url)
  |> Map.get("id")
  |> then(& "\n\nTICKET_ID #{&1}")
  |> IO.puts()
