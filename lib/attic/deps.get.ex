defmodule Mix.Tasks.Nerves.Deps.Get do
  @moduledoc deprecated: "Tasks from :nerves should be used instead"
  use Mix.Task

  import Mix.Nerves.IO

  @impl Mix.Task
  def run(_argv) do
    debug_info("Nerves.Deps.Get Start")
    nerves_env_info()
    # We want to start Nerves.Env so it compiles `nerves`
    # but pass --disable to prevent it from compiling
    # the system and toolchain during this time.
    Mix.Tasks.Nerves.Env.run(["--disable"])
    Mix.Task.run("nerves.artifact.get", [])
    Nerves.Bootstrap.check_for_update()

    debug_info("Nerves.Deps.Get End")
  end
end
