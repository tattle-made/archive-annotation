defmodule Kosh.EADFixtures do
  def simple_xml_map( ) do
    %{
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
                      "content" => "National Centre for Biological Sciences - Tata Institute of Fundamental Research"
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
  end
end
