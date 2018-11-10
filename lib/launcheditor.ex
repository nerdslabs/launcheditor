defmodule LaunchEditor do
  # __open-in-editor?file=ts/components/Popover.vue

  alias LaunchEditor.Editors

  def os() do
    :os.type()
  end

  def run(params) do
    {_os_family, os_name} = os()

    run(os_name, params)
  end

  def run(platform, params) when platform in [:darwin, :linux] do
    {processes, _} = System.cmd("ps", ["x"])

    Enum.find(Editors.osx(), fn {process, _exec} ->
      String.contains?(processes, process)
    end)
    |> case do
      nil ->
        {:error, "Don't found running supported editor."}

      {_process, exec} ->
        file = Map.get(params, :file)
        System.cmd(exec, [file])

        {:ok, "File \"#{file}\" opened in your editor."}
    end
  end

  def run(platform, params) when platform in [:nt] do
    {processes, _} =
      System.cmd("cmd.exe", ["/c", "powershell", "-Command", "Get-Process | Select-Object Path"])

    with editor when not is_nil(editor) <-
           Enum.find(Editors.windows(), &String.contains?(processes, &1)),
         processes when is_list(processes) <- String.split(processes, "\r\n"),
         exec when not is_nil(exec) <- Enum.find(processes, &String.contains?(&1, editor)) do
      file = Map.get(params, :file)
      System.cmd("cmd.exe", ["/c", String.trim(exec), file])
    else
      _ -> {:error, "Don't found running supported editor."}
    end
  end

  def run(platform, _params) do
    {:error, "Platform #{Atom.to_string(platform)} not supported yet."}
  end
end
