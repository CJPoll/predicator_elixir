defmodule Predicator.EvaluatorOperation.JumpTest do
  use ExUnit.Case
  import Predicator.Evaluator

  describe "[\"JUMP\"] operation" do
    test "true and true" do
      inst = [["lit", true], ["jfalse", 2], ["lit", true]]
      assert execute(inst) == true
    end

    test "true or false" do
      inst = [["lit", true], ["jtrue", 2], ["lit", false]]
      assert execute(inst) == true
    end

    test "false or integer equal integer" do
      inst = [["lit", false], ["jtrue", 4], ["lit", 1], ["lit", 1], ["compare", "EQ"]]
      assert execute(inst) == true
    end
  end
end
