defmodule Kosh.EAD.XML.ProcessParsedEADMaps do
@moduledoc """
Various Test map examples of parsed maps generated from Saxmap library, to be tested in process_ead_map function of Kosh.EAD.XML.Saxmap module.
The paresed maps have nested "content" fields for every key.


TODO: Implement Test Cases.
"""

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

    test_map3 = %{
      "accessrestrict" => %{
        "content" => %{
          "head" => %{"content" => "Conditions Governing Access"},
          "p" => %{
            "content" => %{
              "content" => [
                "Collection is open for public access unless mentioned otherwise. In its capacity as an academic and educational centre, the Archives at NCBS is making digital objects available online for open viewing and research purposes. The Archives at NCBS makes no representation that it is the copyright owner in all of its collections. While there is open access, the user must obtain all necessary rights and clearances before any use, reproduction, or distribution of material. For details, please see Section 3 of our Access Policy: "
              ],
              "extreftref" => %{
                "content" => "https://archives.ncbs.res.in/access",
                "href" => "https://archives.ncbs.res.in/access"
              }
            }
          }
        },
        "id" => "aspace_9019844748d44b5aeaa65281effe9a7e"
      }
    }

    test_map4 = %{
      "bioghist" => %{
        "content" => %{
          "head" => %{"content" => "Biographical / Historical"},
          "p" => [
            %{
              "content" =>
                "Leslie Charles Coleman was an entomologist and plant pathologist, who was appointed as the first Director of Agriculture in Mysore State. He is renowned for setting up local agricultural and experimental unions and research institutions across the state which lead to the growth of agricultural schools and educational institutions in the region. He was born on 16th June, 1878 in Ontario, Canada. After his schooling, following in the footsteps of his brothers, Coleman became a primary school teacher. In 1900, he graduated in science from the University of Toronto. He spent the summer of 1904 studying oyster cultivation at a marine research station in Malpeque and at Georgian Bay. After which he moved to Germany to obtain a doctorate from University of Göttingen. He trained under Heinrich Klebahn in mycology. Adolf Lehmann, a German-Canadian chemist who worked as agricultural chemist in Mysore state, recruited  Coleman, who then moved to India in 1908, after he accepted the post of mycologist and entomologist in the State of Mysore. "
            },
            %{
              "content" =>
                "After Lehmann's unexpected departure, Coleman only after 10 months in India, found himself heading the Department of Agricultural Chemistry and a smaller Department of Mycology and Entomology. He worked primarily on plant protection, studying specific plant diseases and pests affecting cash crops in Mysore state such as Pellicularia koleroga in areca plantations and a pest Colemania sphenarioides which affected sorghum. He was known for implementing inexpensive solutions such as the Bordeaux mixture that cultivators could easily adapt. Coleman mentored a group of agricultural scientists in his department; K Kunhikannan, M J Narasimhan and Venkatrao K. Badami all worked with Coleman and studied plants and insects, researching areas such as low-cost pest management and experimental agricultural projects. "
            },
            %{
              "content" =>
                "Coleman believed that the role of agricultural sciences was to create solutions and practices that could easily be adapted by cultivators. His collaborative and practical approach led to the creation of Agricultural and Experimental Unions. The Mysore Agricultural and Experimental Union was set up in 1918. Its success led to the creation of many more across the state. These unions consisted of land-owning cultivators who were interested in carrying out experimental trails with crops. He also influenced government policies in the state in relation to agriculture and education. He was the founding principal of the Hebbal Agricultural School in 1913 which was integrated into the University of Agricultural Sciences, Bangalore in 1964. Similar schools were set up in Hassan and Chikkanhalli. His research and study on diseases affecting coffee influenced him to work towards implementing a Diseases and Pest Act (1917) which made it compulsory for planters to compact the coffee stem-borer disease. He was responsible for  the sericulture department in the 1920s and developed  civil veterinary units in districts. Coleman returned to Canada in 1925 due to ill health, but returned to India in 1927. He worked with plantation owners across Mysore state, acting as advisor and helping in setting up various projects such as the Coffee Research Station(1925) in Balehonnur and the Mysore Sugar Company (1933) in Mandya. Coleman left India to teach at the Toronto University in 1934. He returned to India in 1953 to visit his friends, and travelled across Mysore state as a 'State Guest'. He reviewed the agricultural practices and compiled it into a report for the government in 1954. Shortly after returning to Canada, Coleman died in a car accident while travelling to his lab in Saanichton. Coleman was married twice. His first wife Mary Urquhart died while in India in 1918 and is buried in the Ralph Morris' estate in Biligirirangan Hills. They had a son named John Coleman. He married Phebe Ropes in 1923 and had two daughters Louisa and Ann and one son, Leslie Coleman Jr. After his return from India, Coleman was writing about his experiences working in the Mysore state and was compiling his memoirs. "
            }
          ]
        },
        "id" => "aspace_2fa5441c7f39ae7f20acf45432d8d74a"
      }
    }

    ans = process_ead_map(test_map4)
    # ans = processEadMap(test_map)
    IO.inspect(ans)
  end

end
