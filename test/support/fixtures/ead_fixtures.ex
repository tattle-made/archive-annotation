defmodule Kosh.EADFixtures do
  def simple_xml_map() do
    # %{
    #   "ead" => %{
    #     "content" => %{
    #       "archdesc" => %{
    #         "content" => %{
    #           "did" => %{
    #             "content" => %{
    #               "repository" => %{
    #                 "content" => %{"corpname" => %{"content" => "Archives at NCBS"}}
    #               }
    #             }
    #           }
    #         }
    #       },
    #       "eadheader" => %{
    #         "content" => %{
    #           "address" => %{
    #             "content" => %{
    #               "addressline" => [
    #                 %{
    #                   "content" => "National Centre for Biological Sciences - Tata Institute of Fundamental Research"
    #                 },
    #                 %{"content" => "Bangalore, Karnataka 560065"},
    #                 %{"content" => "Business Number: +9180 6717 6010"},
    #                 %{"content" => "Business Number: +9180 6717 6011"},
    #                 %{"content" => "archives@ncbs.res.in"}
    #               ]
    #             }
    #           },
    #           "eadid" => %{"content" => nil, "countrycode" => "IN"}
    #         }
    #       }
    #     }
    #   }
    # }
    %{
      "ead" => %{
        "archdesc" => %{
          "controlaccess" => %{
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
          },
          "did" => %{"repository" => %{"corpname" => "Archives at NCBS"}}
        },
        "eadheader" => %{
          "address" => %{
            "addressline" => [
              "National Centre for Biological Sciences - Tata Institute of Fundamental Research",
              "Bangalore, Karnataka 560065",
              "Business Number: +9180 6717 6010",
              "Business Number: +9180 6717 6011",
              "archives@ncbs.res.in"
            ]
          },
          "eadid" => %{"countrycode" => "IN"}
        }
      }
    }
  end
end
