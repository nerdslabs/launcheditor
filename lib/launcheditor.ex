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

  def run(:darwin, params) do
    {processes, _} = System.cmd("ps", ["x"])

    Enum.find(Editors.osx(), fn {process, _executable} ->
      String.contains?(processes, process)
    end)
    |> case do
      nil ->
        {:error, "Don't found running supported editor."}

      {_process, executable} ->
        file = Map.get(params, :file)
        System.cmd(executable, [file])

        {:ok, "File \"#{file}\" opened in your editor."}
    end
  end

  def run(platform, _params) do
    {:error, "Platform #{Atom.to_string(platform)} not supported yet."}
  end
end
