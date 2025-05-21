defmodule Kosh.ProcessedEADMapsFixtures.LeslieLayout do
  @doc """
  Broad Layout of ms012_leslie EAD
  """
  def layout do
    %{
      ead: %{
        archdesc: %{
          level: "collection",
          accessrestrict: %{},
          acqinfo: %{},
          arrangement: %{},
          bioghist: %{},
          controlaccess: %{},
          did: %{
            container: [],
            langmaterial: %{
              language: %{
                content: "English",
                langcode: "eng",
                scriptcode: "Latin"
              }
            },
            origination: %{},
            physdesc: %{},
            repository: %{corpname: "Archives at NCBS"},
            unitdate: %{
              calendar: "gregorian",
              certainty: "inferred",
              content: "1913 - 2014",
              datechar: "creation",
              era: "ce",
              normal: "1913/2014",
              type: "bulk"
            },
            unitid: ["MS-012", %{content: "/repositories/2/resources/28", type: "aspace_uri"}],
            unittitle: "Leslie Coleman Papers"
          },
          dsc: %{
            c: [
              %{
                level: "series",
                id: "series-id",
                did: %{
                  container: [
                    %{
                      content: "MS-012 Box 1",
                      id: "aspace_c4d214723cd18b91f1bd6389a47bb823",
                      label: "Mixed Materials",
                      type: "box"
                    },
                    %{
                      content: "MS-012 Box 2",
                      id: "aspace_70bcf7a446f116e2989162348f8d02c1",
                      label: "Mixed Materials",
                      type: "box"
                    }
                  ],
                  unitid: [
                    "MS-012-1",
                    %{
                      content: "/repositories/2/archival_objects/9726",
                      type: "aspace_uri"
                    }
                  ],
                  unittitle: "Series 1: Correspondence"
                },
                c: [
                  %{
                    id: "sub-series1-id aspace_MS-012-1-1",
                    level: "subseries",
                    did: %{
                      container: %{
                        content: " MS-012 Box 1",
                        id: "aspace_e8053f55dcfbdbe5d53b4e7c28e8dff5",
                        label: "Mixed Materials",
                        type: "box"
                      },
                      unitid: [
                        "MS-0120101",
                        %{
                          content: "/repositories/2/archival_objects/9727",
                          type: "aspace_uri"
                        }
                      ],
                      unittitle: "Sub-Series 1: Letters to Leslie Coleman"
                    },
                    c: [
                      %{
                        id: "aspace_MS-012-1-1-1-1",
                        level: "file",
                        scopecontent: %{
                          head: "Scope and Contents",
                          id: "aspace_b49fc4841d06feb5b5430dd952914a0d",
                          p:
                            "From Students of Agriculture to Leslie Coleman, Director of Agriculture in Mysore, dated 17th April, 1915. The letter is printed on a silk cloth. Students express their gratitude to Coleman for his guidance."
                        },
                        bioghist: %{
                          head: "Biographical / Historical",
                          id: "aspace_2297577d46a3325e8f15ee6b0e84e13d"
                        },
                        did: %{
                          container: [
                            %{
                              content: "MS-012 Box 1",
                              id: "aspace_d845d81d014394355b5a3d734db07dce",
                              label: "Mixed Materials",
                              type: "box"
                            },
                            %{
                              content: "1",
                              id: "aspace_0b08a31fc73d1f8a1017d3cdc66bab8c",
                              parent: "aspace_d845d81d014394355b5a3d734db07dce",
                              type: "folder"
                            }
                          ],
                          daogrp: %{
                            :daodesc => %{
                              :p => "Students of agriculture, Mysore Director of Agriculture"
                            },
                            :daoloc => [
                              %{
                                :"xlink:href" =>
                                  "https://collections.archives.ncbs.res.in/handle/42412/3",
                                :"xlink:type" => "locator"
                              },
                              %{
                                :"xlink:href" =>
                                  "https://collections.archives.ncbs.res.in/bitstreams/ae424607-b422-4674-aea8-ac4091dd7bfd/download",
                                :"xlink:type" => "locator"
                              }
                            ],
                            :"xlink:title" =>
                              "Students of agriculture, Mysore Director of Agriculture",
                            :"xlink:type" => "extended"
                          },
                          unitdate: %{
                            content: "17 April 1915",
                            datechar: "creation"
                          },
                          unitid: [
                            "MS-012-1-1-1-1",
                            %{
                              content: "/repositories/2/archival_objects/9728",
                              type: "aspace_uri"
                            }
                          ],
                          unittitle: "Students of agriculture, Mysore Director of Agriculture"
                        }
                      }
                    ]
                  }
                ]
              }
            ]
          },
          prefercite: %{},
          scopecontent: %{},
          userestrict: %{}
        },
        eadheader: %{
          countryencoding: "iso3166-1",
          dateencoding: "iso8601",
          eadid: %{
            content: "MS-012",
            countrycode: "IN",
            mainagencycode: "IN-National Centre for Biological Sciences"
          },
          filedesc: %{}
          # other fields of eadheader
        }
      }
    }
  end
end
