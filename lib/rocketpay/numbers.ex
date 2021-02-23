defmodule Rocketpay.Numbers do
  def sum_from_file(file_name) do
    "#{file_name}.csv"
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, file}) do
    result =
      file
      |> String.split(",")
      |> Stream.map(fn number -> String.to_integer(number) end)
      |> Enum.sum()
    {:ok, %{result: result}}
  end
  defp handle_file({:error, _reason}), do: {:error, %{message: "Invalid file!"}}
end
