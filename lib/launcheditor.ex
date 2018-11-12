defmodule LaunchEditor do
  alias LaunchEditor.Editors

  def os() do
    :os.type()
  end

  def run(file, line \\ 0) do
    {_os_family, os_name} = os()

    run(os_name, file, line)
  end

  defp run(platform, file, _line) when platform in [:darwin, :linux] do
    {processes, _} = System.cmd("ps", ["x"])

    Enum.find(Editors.osx(), fn {process, _exec} ->
      String.contains?(processes, process)
    end)
    |> case do
      nil ->
        {:error, "Don't found running supported editor."}

      {_process, exec} ->
        System.cmd(exec, [file])

        {:ok, "File \"#{file}\" opened in your editor."}
    end
  end

  defp run(platform, file, _line) when platform in [:nt] do
    {processes, _} =
      System.cmd("cmd.exe", ["/c", "powershell", "-Command", "Get-Process | Select-Object Path"])

    with editor when not is_nil(editor) <-
           Enum.find(Editors.windows(), &String.contains?(processes, &1)),
         processes when is_list(processes) <- String.split(processes, "\r\n"),
         exec when not is_nil(exec) <- Enum.find(processes, &String.contains?(&1, editor)) do
      System.cmd("cmd.exe", ["/c", String.trim(exec), file])
    else
      _ -> {:error, "Don't found running supported editor."}
    end
  end

  defp run(platform, _, _) do
    {:error,
     "Platform #{Atom.to_string(platform)} not supported yet. (You can report it here: https://github.com/nerdslabs/launcheditor/issues/new?template=editor-report.md)"}
  end
end
