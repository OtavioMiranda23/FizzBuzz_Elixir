defmodule FizzBuzz do
  def start(file_name) when is_binary(file_name) do
    file_name
    |> File.read!
    |> String.split(",")
    |> to_list_fizz
  end
  defp to_list_fizz(list) do
    list
    |> Enum.map(fn number ->
      number
      |> String.trim
      |> String.to_integer
      |> fizz_buzz
    end )
  end
  defp fizz_buzz(num) do
    three =
      num
      |> rem(3) == 0
    five =
      num
      |> rem(5) == 0
    case {three, five} do
       {true, true} ->  {:ok, "#{num} is FizzBuzz"}
       {_, true} -> {:ok, "#{num} Buzz"}
       {true, _} -> {:ok, "#{num} Fizz"}
    end
  end
end
