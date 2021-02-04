#Elixir 1.10.2
defmodule Ugly_No do

    defmacro max_Divide_Macro(a,b) do
        quote do :erlang.rem(unquote(a), unquote(b) ) == 0 end
    end

    def max_Divide(a,b) when max_Divide_Macro(a,b) do trunc(a/b) |> max_Divide(b) end
    def max_Divide(a,_b) do a end

    def is_Ugly(a,0) do is_Ugly(max_Divide(a, 2), 2) end
    def is_Ugly(a,2) do is_Ugly(max_Divide(a, 3), 3) end
    def is_Ugly(a,3) do is_Ugly(max_Divide(a, 5), 5) end
    def is_Ugly(a,_b) do a == 1 end

    def get_Nth_Ugly_No(a,b,c) when c > a do b-1 end

    def get_Nth_Ugly_No(a,b,c) do
        case is_Ugly(b,0) do
            true -> get_Nth_Ugly_No(a,b+1,c+1)
            false -> get_Nth_Ugly_No(a,b+1,c)
        end
    end

    def start() do
      i = 10
      IO.puts("[INPUT] #{i}")
      o = get_Nth_Ugly_No(i,1,1)
      IO.puts("[OUTPUT] #{o}")
     end
 end
 Ugly_No.start
