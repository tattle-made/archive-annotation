defmodule Kosh.EAD.XML.Saxmap do
  @moduledoc """
  Parse xml file into Elixir map using saxmap
  """
  alias SAXMap

  def parse(doc) do
    SAXMap.from_string(doc, ignore_attribute: false)
  end

  def process_ead_map(nil), do: nil

  def process_ead_map(str) when is_binary(str), do: str

  def process_ead_map(%{"content" => value} = map)
      when map_size(map) == 1 and not is_map(value) and not is_list(value) do
    # Map has only "content" and it's a primitive — just return it
    value
  end

  def process_ead_map(list) when is_list(list) do
    Enum.map(list, &process_ead_map/1)
  end

  def process_ead_map(map) when is_map(map) do
    Enum.reduce(map, %{}, fn
      # Special “content” key: handle but don’t directly put under "content"
      {"content", v}, acc ->
        processed = process_ead_map(v)

        cond do
          processed == nil ->
            acc

          is_map(processed) ->
            Map.merge(acc, processed)

          true ->
            Map.put(acc, "content", processed)
        end

      # All other keys: put processed under its key, then ignore merging
      {k, v}, acc ->
        Map.put(acc, k, process_ead_map(v))
    end)
  end

  def runTest do
    test_map = %{
      "ead" => %{
        "content" => %{
          "archdesc" => %{
            "content" => %{
              "did" => %{
                "content" => %{
                  "repository" => %{
                    "content" => %{"corpname" => %{"content" => "Archives at NCBS"}}
                  }
                }
              }
            }
          },
          "eadheader" => %{
            "content" => %{
              "address" => %{
                "content" => %{
                  "addressline" => [
                    %{
                      "content" =>
                        "National Centre for Biological Sciences - Tata Institute of Fundamental Research"
                    },
                    %{"content" => "Bangalore, Karnataka 560065"},
                    %{"content" => "Business Number: +9180 6717 6010"},
                    %{"content" => "Business Number: +9180 6717 6011"},
                    %{"content" => "archives@ncbs.res.in"}
                  ]
                }
              },
              "eadid" => %{"_countrycode" => "IN", "content" => nil}
            }
          }
        }
      }
    }

    test_map4 = %{
      "ead" => %{
        "content" => %{
          "archdesc" => %{
            "content" => %{
              "controlaccess" => %{
                "content" => %{
                  "subject" => [
                    %{"content" => "Agriculture", "source" => "local"},
                    %{"content" => "Betel nut", "source" => "local"},
                    %{"content" => "Coffee berry borer", "source" => "local"},
                    %{"content" => "Coffee plantations", "source" => "local"},
                    %{"content" => "Colonial portraits", "source" => "local"},
                    %{"content" => "Colonial administrators", "source" => "local"},
                    %{"content" => "Colonies", "source" => "local"},
                    %{"content" => "Farm supplies", "source" => "local"},
                    %{"content" => "Field experiments", "source" => "local"}
                  ]
                }
              },
              "did" => %{
                "content" => %{
                  "repository" => %{
                    "content" => %{"corpname" => %{"content" => "Archives at NCBS"}}
                  }
                }
              }
            }
          },
          "eadheader" => %{
            "content" => %{
              "address" => %{
                "content" => %{
                  "addressline" => [
                    %{
                      "content" =>
                        "National Centre for Biological Sciences - Tata Institute of Fundamental Research"
                    },
                    %{"content" => "Bangalore, Karnataka 560065"},
                    %{"content" => "Business Number: +9180 6717 6010"},
                    %{"content" => "Business Number: +9180 6717 6011"},
                    %{"content" => "archives@ncbs.res.in"}
                  ]
                }
              },
              "eadid" => %{"content" => nil, "countrycode" => "IN"}
            }
          }
        }
      }
    }

    test_map2 = %{
      "a" => %{
        "content" => "hello",
        "b" => "bb"
      }
    }

    ans = process_ead_map(test_map4)
    # ans = processEadMap(test_map)
    IO.inspect(ans)
  end
end
