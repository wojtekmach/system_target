defmodule SystemTarget do
  defstruct [
    :arch,
    :cpu,
    :os,
    :abi
  ]

  def get() do
    case :os.type() do
      {:unix, :linux} ->
        arch = :erlang.system_info(:system_architecture)
        [arch, cpu, os, abi] = arch |> List.to_string() |> String.split("-")
        %__MODULE__{arch: arch, cpu: cpu, os: os, abi: abi}

      {:unix, :darwin} ->
        parts = :erlang.system_info(:system_architecture) |> List.to_string() |> String.split("-")

        arch =
          case parts do
            ["arm" | _] -> "aarch64"
            [arch | _] -> arch
          end

        %__MODULE__{arch: arch, cpu: "apple", os: "darwin", abi: "gnu"}

      other ->
        raise "not yet supported: #{inspect(other)}"
    end
  end
end
