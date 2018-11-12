defmodule LaunchEditor.Plug do
  import Plug.Conn
  alias Plug.Conn

  def init(options) do
    %{
      assets_root: Keyword.get(options, :assets_root, "")
    }
  end

  def call(%Conn{method: "GET", path_info: ["__open-in-editor"]} = conn, opts) do
    query = Plug.Conn.Query.decode(conn.query_string)
    line = Map.get(query, "line", nil)

    Map.get(query, "file", "")
    |> get_file_path(opts)
    |> case do
      {:ok, path} ->
        LaunchEditor.run(path, line)
        |> send_response(conn)

      {:error, message} ->
        send_response({:error, message}, conn)
    end
  end

  def call(conn, _), do: conn

  def send_response(result, conn) do
    case result do
      {:ok, message} ->
        conn
        |> put_resp_content_type("text/plain")
        |> send_resp(200, message)
        |> halt()

      {:error, message} ->
        conn
        |> put_resp_content_type("text/plain")
        |> send_resp(400, message)
        |> halt()
    end
  end

  def get_file_path(file, opts) do
    relative_path = Path.relative_to_cwd(file)
    assets_path = Map.get(opts, :assets_root) |> Path.join(relative_path)

    cond do
      File.exists?(relative_path) -> {:ok, relative_path}
      File.exists?(assets_path) -> {:ok, assets_path}
      true -> {:error, "File \"#{relative_path}\" not exists"}
    end
  end
end
