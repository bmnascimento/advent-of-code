file_content = File.read!("test.txt")
pattern = "\n"
split_string =
  String.split(file_content, pattern) |>
  Enum.map(&({String.slice(&1, 0..div(String.length(&1),2)-1), String.slice(&1, div(String.length(&1),2)..-1)})) |>
  Enum.map(
    fn {parte1, parte2} -> Enum.reduce(
      String.codepoints(parte1),
      fn letraIter, letraFinal ->
        if letraIter == "" do
          if String.contains?(parte2, letra) do
            letra
          end
        else
          letra
        end
      end)
    end)
  #Enum.map(fn tupla -> Enum.map(String.codepoints(tupla[0]), fn letra -> String.contains?(tupla[1], letra) end) end)
IO.inspect split_string
