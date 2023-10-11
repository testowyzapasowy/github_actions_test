Mix.install([:json])

[issue_url, ticket_id_env] = System.argv() |> IO.inspect(label: "ARGV")

Process.sleep(1000)

{_collectable, 0} =
  IO.read(:stdio, :eof)
  |> IO.inspect(label: "STDIN STRING", limit: :infinity)
  |> JSON.decode!()
  |> IO.inspect(label: "PARSED JSON", pretty: true, limit: :infinity)
  |> Map.get("items")
  |> Enum.find(& &1["content"]["url"] == issue_url)
  |> Map.get("id")
  |> IO.inspect(label: "TICKET ID")
  |> then(& "export #{ticket_id_env}=\"#{&1}\"")
  |> System.shell()
