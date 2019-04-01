defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  alias KV.Bucket

  @moduletag :capture_log

  doctest Bucket

  setup do
    {:ok, bucket} = KV.Bucket.start_link([])
    %{bucket: bucket}# => Merge this map to test context
  end


  test "stores values by key", %{bucket: bucket} do # => Pattern match with test context end
    assert KV.Bucket.get(bucket, "test") == nil
    KV.Bucket.put(bucket, "test", 22)
    assert KV.Bucket.get(bucket, "test") == 22
  end
end
