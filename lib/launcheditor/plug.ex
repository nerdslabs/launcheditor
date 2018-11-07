defmodule LaunchEditor.Plug do
  import Plug.Conn
  alias Plug.Conn

  def init(options) do
    # initialize options

    %{
      assets_root: Keyword.get(options, :assets_root, "")
    }
  end

  def call(%Conn{method: "GET"} = conn, opts) do
    if allowed(conn.path_info) do
      launch_editor(conn, opts)
    else
      conn
    end
  end

  def allowed(["__open-in-editor"]), do: true
  def allowed(_), do: false

  def launch_editor(conn, opts) do
    query = Plug.Conn.Query.decode(conn.query_string)

    params = %{
      file: Map.get(opts, :assets_root) |> Path.join(Map.get(query, "file", "")),
      line: Map.get(query, "line", nil)
    }

    LaunchEditor.run(params)
    |> case do
      {:ok, message} ->
        conn
        |> put_resp_content_type("text/plain")
        |> send_resp(200, message)
        |> halt()

      {:error, message} ->
        conn
        |> put_resp_content_type("text/plain")
        |> send_resp(500, message)
        |> halt()
    end
  end
end
