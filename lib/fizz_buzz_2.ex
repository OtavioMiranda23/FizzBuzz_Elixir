defmodule FizzBuzz_2 do
  def start(file_name) do
    file_name
    |> File.read()
    |> handle_file_read
  end

  defp handle_file_read({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(&parse_normalize/1)
    {:ok, result}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  defp parse_normalize(el) do
    el
    |> String.trim()
    |> String.to_integer()
    |> fizz_buzz
  end

  defp fizz_buzz(num) when rem(num, 3) == 0 and rem(num, 5) == 0, do: "FizzBuzz"
  defp fizz_buzz(num) when rem(num, 3) == 0, do: "Fizz"
  defp fizz_buzz(num) when rem(num, 5) == 0, do: "Buzz"
  defp fizz_buzz(num), do: num
end
