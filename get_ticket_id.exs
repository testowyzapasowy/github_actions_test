Mix.install([:json])

[issue_url] = System.argv()

Process.sleep(1000)

:ok =
  IO.read(:stdio, :eof)
  |> IO.inspect(label: "STDIN STRING", limit: :infinity)
  |> JSON.decode!()
  |> Map.get("items")
  |> Enum.find(& &1["content"]["url"] == issue_url)
  |> Map.get("id")
  |> IO.inspect(label: "TICKET ID")
  |> IO.binwrite()
