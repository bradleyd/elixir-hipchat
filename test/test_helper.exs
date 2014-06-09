ExUnit.start()
HTTPotion.start

defmodule ExUint.Case do
    use ExUnit.CaseTemplate

def fixture_path do
  Path.expand("fixtures", __DIR__)
end

def fixture_path(extension) do
  Path.join fixture_path, extension
end

end
