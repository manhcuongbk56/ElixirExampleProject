defmodule KV.Bucket do
  use Agent
  @doc """
    Start a new bucket
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc"""
    Get value of `key` from `bucket`
  """
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key));
  end

  @doc """
    put `value` of `key` to `bucket`
  """
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end

  @doc """
    Delete the `key` from `bucket`
    return the current value of the `key` if `key` exists
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, &Map.pop(&1, key))
  end

end