defmodule KinoCodePenTest do
  use ExUnit.Case
  doctest KinoCodePen

  test "greets the world" do
    assert KinoCodePen.hello() == :world
  end
end
