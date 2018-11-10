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

  def run(platform, _params) do
    {:error, "Platform #{Atom.to_string(platform)} not supported yet."}
  end
end
