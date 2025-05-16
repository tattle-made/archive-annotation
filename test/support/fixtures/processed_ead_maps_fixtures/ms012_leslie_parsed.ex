defmodule Kosh.ProcessedEADMapsFixtures.LeslieMapParsed do
  @moduledoc false

  @doc """
  Paresed Map of ms012 leslie. It has nested "contents" field for every key in the map
  """

  def get_map do
    %{
      "ead" => %{
        "content" => %{
          "archdesc" => %{
            "content" => %{
              "accessrestrict" => %{
                "content" => %{
                  "head" => %{"content" => "Conditions Governing Access"},
                  "p" => %{
                    "content" =>
                      "Collection is open for public access unless mentioned otherwise. In its capacity as an academic and educational centre, the Archives at NCBS is making digital objects available online for open viewing and research purposes. The Archives at NCBS makes no representation that it is the copyright owner in all of its collections. While there is open access, the user must obtain all necessary rights and clearances before any use, reproduction or distribution of material. For details, please see Section 3 of our Access Policy: https://archives.ncbs.res.in/access"
                  }
                },
                "id" => "aspace_7d31834420b2360a2a4a6fd1267bd4d6"
              },
              "acqinfo" => %{
                "content" => %{
                  "head" => %{"content" => "Immediate Source of Acquisition"},
                  "p" => %{
                    "content" =>
                      "The collection draws from material related to Leslie Coleman donated by Dr. B. Mallik, Retired dean, GKVK. Coleman was appointed by the Maharaja of Mysore as Entomologist and Mycologist. He worked in Mysore from 1908 to 1933. When the Agriculture Department was established in 1913, he was appointed as its Director, a charge he held till 1933. Mallik received Coleman's archival documents from Coleman's family residing in Canada. Mallick wrote to Tom Widdowson informing him about the transfer of the Coleman material to NCBS Archives. Tom Widdowson consented to the transfer via email. Physical material was received on Feb 28, 2022 by Venkat Srinivasan, Archives at NCBS."
                  }
                },
                "id" => "aspace_9e5edbda1efba6042796f49ae6515040"
              },
              "arrangement" => %{
                "content" => %{
                  "head" => %{"content" => "Arrangement"},
                  "p" => %{
                    "content" =>
                      "The intellectual arrangement strives to preserve provenance and original order of the papers. Where an original order could not be found, the Archives has applied an order, and folders within sub-series are arranged usually in chronological or alphabetical order. See Scope and Content section for details."
                  }
                },
                "id" => "aspace_5a8964f34a1de1d0a9f1f25bdce0abaa"
              },
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
              },
              "controlaccess" => %{
                "content" => %{
                  "famname" => %{"content" => "Coleman"},
                  "geogname" => [
                    %{
                      "content" => "Bangalore -- Karnataka -- India",
                      "source" => "lcsh"
                    },
                    %{
                      "content" => "Bombay -- British Raj -- India",
                      "source" => "local"
                    },
                    %{"content" => "Channapatna -- India", "source" => "local"},
                    %{"content" => "Karachi -- British Raj", "source" => "local"},
                    %{"content" => "London -- United Kingdom", "source" => "lcsh"},
                    %{
                      "content" => "Kingdom of Mysore -- British Raj -- India",
                      "source" => "local"
                    },
                    %{
                      "content" => "Tiptur -- Karnataka -- India",
                      "source" => "lcsh"
                    },
                    %{
                      "content" => "Halebidu -- Karnataka -- India",
                      "source" => "local"
                    },
                    %{
                      "content" => "Sravana Belagola -- Karnataka -- India",
                      "source" => "local"
                    },
                    %{
                      "content" => "Srirangapatna -- Karnataka -- India",
                      "source" => "local"
                    },
                    %{"content" => "Attikan -- Karnataka", "source" => "local"},
                    %{
                      "content" => "BR Hills -- Biligiri Rangana Betta -- Karnataka",
                      "source" => "local"
                    },
                    %{"content" => "Balehonnur -- Karnataka", "source" => "local"},
                    %{
                      "content" => "Bellary -- Karnataka -- India",
                      "source" => "local"
                    },
                    %{
                      "content" => "Carlton House -- Bangalore",
                      "source" => "local"
                    },
                    %{
                      "content" => "Chamundi Hills -- Karnataka",
                      "source" => "local"
                    },
                    %{"content" => "Coorg -- Karnataka", "source" => "local"},
                    %{
                      "content" => "Danvers -- Massachusetts -- United States of America",
                      "source" => "lcsh"
                    },
                    %{
                      "content" => "Darjeeling -- British Raj -- India",
                      "source" => "local"
                    },
                    %{
                      "content" => "Doddaballapur -- Karnataka -- India",
                      "source" => "local"
                    },
                    %{
                      "content" => "Farewell Rock -- Wales -- United Kingdom",
                      "source" => "local"
                    },
                    %{
                      "content" =>
                        "Fatehpur Sikri -- Agra -- United Provinces -- British Raj -- India",
                      "source" => "local"
                    },
                    %{
                      "content" => "Gander -- Newfoundland and Labrador -- Canada",
                      "source" => "local"
                    },
                    %{
                      "content" => "Gauribidanur -- Goridibinur -- Karnataka",
                      "source" => "local"
                    },
                    %{"content" => "Honnametti -- Karnataka", "source" => "local"},
                    %{"content" => "Hoskote -- Karnataka", "source" => "local"},
                    %{
                      "content" => "Kolar -- Karnataka -- India",
                      "source" => "local"
                    },
                    %{
                      "content" => "Krishna Raja Sagara -- Karnataka",
                      "source" => "local"
                    },
                    %{
                      "content" => "Lalbagh -- Bangalore -- Karnataka",
                      "source" => "local"
                    },
                    %{
                      "content" => "Lalitha Mahal -- Mysore -- Karnataka",
                      "source" => "local"
                    },
                    %{
                      "content" => "Magadi -- Karnataka -- India",
                      "source" => "local"
                    },
                    %{
                      "content" => "Mysore Zoo -- Karnataka -- India",
                      "source" => "local"
                    },
                    %{
                      "content" => "Ooty -- Ootacamund -- Udhagamandalam",
                      "source" => "local"
                    },
                    %{
                      "content" => "Nilgiris -- Karnataka -- Tamil Nadu",
                      "source" => "local"
                    },
                    %{
                      "content" => "Qutb Minar -- Delhi -- India",
                      "source" => "local"
                    },
                    %{
                      "content" => "Saanichton -- British Columbia -- Canada",
                      "source" => "local"
                    },
                    %{
                      "content" => "Shivanasamudra -- Sivasamudram -- Karnataka",
                      "source" => "local"
                    },
                    %{
                      "content" => "Somanathapura -- Karnataka",
                      "source" => "local"
                    },
                    %{
                      "content" => "Thirthahalli -- Shimoga -- Karnataka",
                      "source" => "local"
                    },
                    %{
                      "content" => "Taj Mahal -- Agra -- India",
                      "source" => "local"
                    },
                    %{"content" => "Adivasi", "source" => "local"}
                  ],
                  "occupation" => %{
                    "content" => "Traditional farming",
                    "source" => "local"
                  },
                  "persname" => [
                    %{"content" => "Coleman, L C (Leslie Charles) (1878-1954)"},
                    %{"content" => "Coleman, Ann"},
                    %{"content" => "Coleman, Louisa"},
                    %{"content" => "Coleman, Phebe"},
                    %{"content" => "Palmer, Luella C"},
                    %{
                      "content" => "Morris, Randolph \"Ralph\" Camroux, Colonel, 1895-1977"
                    },
                    %{"content" => "Nasiruddin, Syed"},
                    %{"content" => "Rao, D G Ramachandra"},
                    %{"content" => "Krishnayya, HV"},
                    %{"content" => "K.H., Srinivasan"},
                    %{"content" => "Kunhikannan, K"},
                    %{"content" => "Coleman, Leslie, Jr."}
                  ],
                  "subject" => [
                    %{"content" => "Agricultural implements", "source" => "local"},
                    %{"content" => "Agricultural innovations", "source" => "local"},
                    %{"content" => "Agricultural instruments", "source" => "local"},
                    %{"content" => "Agricultural policy", "source" => "local"},
                    %{"content" => "Agricultural students", "source" => "local"},
                    %{"content" => "Agriculture", "source" => "local"},
                    %{"content" => "Betel nut", "source" => "local"},
                    %{"content" => "Coffee berry borer", "source" => "local"},
                    %{"content" => "Coffee plantations", "source" => "local"},
                    %{"content" => "Colonial portraits", "source" => "local"},
                    %{"content" => "Colonial administrators", "source" => "local"},
                    %{"content" => "Colonies", "source" => "local"},
                    %{"content" => "Farm supplies", "source" => "local"},
                    %{"content" => "Field experiments", "source" => "local"},
                    %{"content" => "Grasshopper", "source" => "local"},
                    %{"content" => "Malabar squirrel", "source" => "local"},
                    %{"content" => "Sugar factories", "source" => "local"},
                    %{"content" => "Sugar plantations", "source" => "local"}
                  ],
                  "title" => [
                    %{
                      "content" => "Agricultural and Experimental Union",
                      "source" => "local"
                    },
                    %{
                      "content" => "Botanical Society of Central College",
                      "source" => "local"
                    },
                    %{
                      "content" => "Canada Lab of Plant Pathology",
                      "source" => "local"
                    },
                    %{"content" => "Coffee Research Station", "source" => "local"},
                    %{"content" => "Director of Agriculture", "source" => "local"},
                    %{
                      "content" => "Director of Public Health, Mysore",
                      "source" => "local"
                    },
                    %{"content" => "Government of Mysore", "source" => "local"},
                    %{"content" => "Institute of Technology", "source" => "local"},
                    %{
                      "content" => "Mysore Agricultural Department",
                      "source" => "local"
                    },
                    %{
                      "content" => "Mysore Planters Association",
                      "source" => "local"
                    },
                    %{"content" => "Mysore Sugar Company", "source" => "local"},
                    %{
                      "content" => "United Planters Association of South India",
                      "source" => "local"
                    }
                  ]
                }
              },
              "did" => %{
                "content" => %{
                  "container" => [
                    %{
                      "content" => "MS-012 Box 1",
                      "id" => "aspace_74f1ce16bc4323f504cf9c69d9bb5986",
                      "label" => "Mixed Materials",
                      "type" => "box"
                    },
                    %{
                      "content" => "MS-012 Box 2",
                      "id" => "aspace_904f4695be92fbcd4fee1ff4c997fd0f",
                      "label" => "Mixed Materials",
                      "type" => "box"
                    },
                    %{
                      "content" => "MS-012 Box 3",
                      "id" => "aspace_1cdc4fb91121f61a88e26715cf9b9cdc",
                      "label" => "Mixed Materials",
                      "type" => "box"
                    },
                    %{
                      "content" => "MS-012 Box 4",
                      "id" => "aspace_ac33dfb740cecb2d37ae4e60bc2b64f4",
                      "label" => "Mixed Materials",
                      "type" => "box"
                    },
                    %{
                      "content" => "MS-012 Box 5",
                      "id" => "aspace_3820feeb374762418151f916ce62cee2",
                      "label" => "Mixed Materials",
                      "type" => "box"
                    }
                  ],
                  "langmaterial" => %{
                    "content" => %{
                      "language" => %{
                        "content" => "English",
                        "langcode" => "eng",
                        "scriptcode" => "Latn"
                      }
                    }
                  },
                  "origination" => %{
                    "content" => %{
                      "persname" => %{
                        "content" => "Srinivasan, Venkat",
                        "role" => "Processing Archivist",
                        "rules" => "local",
                        "source" => "local"
                      }
                    },
                    "label" => "Creator"
                  },
                  "physdesc" => %{
                    "altrender" => "whole",
                    "content" => %{
                      "extent" => [
                        %{
                          "altrender" => "materialtype spaceoccupied",
                          "content" => "2.5 Linear Feet"
                        },
                        %{
                          "altrender" => "carrier",
                          "content" => "5 Hollinger style archive-boxes and 1 oversize container"
                        }
                      ]
                    }
                  },
                  "repository" => %{
                    "content" => %{"corpname" => %{"content" => "Archives at NCBS"}}
                  },
                  "unitdate" => %{
                    "calendar" => "gregorian",
                    "certainty" => "inferred",
                    "content" => "1913 - 2014",
                    "datechar" => "creation",
                    "era" => "ce",
                    "normal" => "1913/2014",
                    "type" => "bulk"
                  },
                  "unitid" => [
                    %{"content" => "MS-012"},
                    %{
                      "content" => "/repositories/2/resources/28",
                      "type" => "aspace_uri"
                    }
                  ],
                  "unittitle" => %{"content" => "Leslie Coleman Papers"}
                }
              },
              "dsc" => %{
                "content" => %{
                  "c" => [
                    %{
                      "content" => %{
                        "c" => [
                          %{
                            "content" => %{
                              "c" => [
                                %{
                                  "content" => %{
                                    "bioghist" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Biographical / Historical"
                                        }
                                      },
                                      "id" => "aspace_2297577d46a3325e8f15ee6b0e84e13d"
                                    },
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_d845d81d014394355b5a3d734db07dce",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "1",
                                            "id" => "aspace_0b08a31fc73d1f8a1017d3cdc66bab8c",
                                            "parent" => "aspace_d845d81d014394355b5a3d734db07dce",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Students of agriculture, Mysore Director of Agriculture"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/3",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/ae424607-b422-4674-aea8-ac4091dd7bfd/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Students of agriculture, Mysore Director of Agriculture",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "17 April 1915",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-1-1-1"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9728",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Students of agriculture, Mysore Director of Agriculture"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "From Students of Agriculture to Leslie Coleman, Director of Agriculture in Mysore, dated 17th April, 1915. The letter is printed on a silk cloth. Students express their gratitude to Coleman for his guidance."
                                        }
                                      },
                                      "id" => "aspace_b49fc4841d06feb5b5430dd952914a0d"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-1-1-1",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_4d208c4a7d50452ba2e1dd602896dc0f",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "2",
                                            "id" => "aspace_50e5851698bf8ca6cd1baf7a657eb944",
                                            "parent" => "aspace_4d208c4a7d50452ba2e1dd602896dc0f",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Dr. h c .W Ruhland"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/4",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/f172686c-f2f4-4cba-9062-3942805cd497/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Dr. h c .W Ruhland",
                                          "xlink:type" => "extended"
                                        },
                                        "origination" => %{
                                          "content" => %{
                                            "persname" => %{
                                              "content" =>
                                                "Ruhland, Eugen Otto Wilhelm, 1878-1960",
                                              "role" => "aut"
                                            }
                                          },
                                          "label" => "Creator"
                                        },
                                        "unitdate" => %{
                                          "content" => "3 July 1951",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-1-1-2"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9729",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Dr. h c .W Ruhland"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "From Wilhelm Ruhland, Botanist, to Leslie Coleman, dated 3rd July, 1951. Concerning shipment of fava beans that Coleman had requested."
                                        }
                                      },
                                      "id" => "aspace_9078cb274f954ebc455913b4a3e24973"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-1-1-2",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_164229a69585865256a5728b1a5b5b53",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "3",
                                            "id" => "aspace_dd137bfc7b748943720f7c20a1ebb98a",
                                            "parent" => "aspace_164229a69585865256a5728b1a5b5b53",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Rau, K.Venkatagiri, 10 December 1951"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/5",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/2c5b72cf-0077-4fcd-9d0e-f2e1b4c8c6da/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Rau, K.Venkatagiri, 10 December 1951",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "10 December 1951",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-1-1-3"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9730",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Rau, K.Venkatagiri"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "From K. Venkatagiri Rau to Leslie Coleman, dated 10th December, 1951. Rau reports on his duties as an Agricultural Inspector at Tiptur."
                                        }
                                      },
                                      "id" => "aspace_f304a56f3ce3f55a747550adb68f485a"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-1-1-3",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_b503653d91c8e24b82bce2f6a1743ec0",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "4",
                                            "id" => "aspace_17f9d69aa5ca79f99f389264b7868eea",
                                            "parent" => "aspace_b503653d91c8e24b82bce2f6a1743ec0",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Srinivasan, K H"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/6",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/08051176-204f-4526-bf08-37382a19c4cf/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Srinivasan, K H",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "25 February 1952",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-1-1-4"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9731",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Srinivasan, K H"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Copy of a letter from K. H. Srinivasan to Leslie Coleman, dated 25th February, 1952. Discussing whereabouts of mutual acquaintances from Mysore Agricultural Department."
                                        }
                                      },
                                      "id" => "aspace_e43c9716d288c893e6b503dfe0e8ea31"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-1-1-4",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_f70cff3a9da9c98112f6b9492d0842c9",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "5",
                                            "id" => "aspace_0d2f952e29534744d2c57e35bffcbf5b",
                                            "parent" => "aspace_f70cff3a9da9c98112f6b9492d0842c9",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Krishnayya, H V"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/7",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/a97deeb9-3ffa-4ef9-b9c5-735dfd1f1b45/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Krishnayya, H V",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "3 March 1952",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-1-1-5"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9732",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Krishnayya, H V"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "From H. V. Krishnayya to Leslie Coleman, dated 3rd March, 1952. Pleasantries and reminiscences of time spent together in India."
                                        }
                                      },
                                      "id" => "aspace_67554cc691d4cd731162dee01e467204"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-1-1-5",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_e8f4288cba2175d3f678da18046d26a7",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "6",
                                            "id" => "aspace_06f61d876808a856e251a0fa7f3f576d",
                                            "parent" => "aspace_e8f4288cba2175d3f678da18046d26a7",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{"content" => "Bennur, S H"}
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/8",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/f0e5dd66-e3f0-45aa-b2fb-fa89deedb00c/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Bennur, S H",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "18 March 1952",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-1-1-6"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9733",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{"content" => "Bennur, S H"}
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Letter from S H Bennur to Leslie Coleman, dated 18th March, 1952. Pleasantries and update on the status of Mysore sugar company at Mandya, Mysore."
                                        }
                                      },
                                      "id" => "aspace_41f08acf39094c2a70b7435cef0bb89f"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-1-1-6",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_991351cb7e4e2f9d4b1e00b6ea2b3dc5",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "7",
                                            "id" => "aspace_67647551137e439c50f205f93aeb1bb3",
                                            "parent" => "aspace_991351cb7e4e2f9d4b1e00b6ea2b3dc5",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Krishna Rao, M.B."
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/9",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/c38f361b-cabc-4e92-be2d-a8e31833f4a4/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Krishna Rao, M.B.",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "4 April 1952",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-1-1-7"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9734",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Krishna Rao, M.B."
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "From M. B. Krishna Rao to Leslie Coleman, dated 4th April, 1952. Pleasantries and reminiscences about the time spent together in India."
                                        }
                                      },
                                      "id" => "aspace_68855eb7592ebcba72e5abde20f98d52"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-1-1-7",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_5b9eec7aba1bdacfcc17c240ba596b70",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "8",
                                            "id" => "aspace_c0676e5c8e5c00da94058a7258d44460",
                                            "parent" => "aspace_5b9eec7aba1bdacfcc17c240ba596b70",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Krishnayya, H V"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/10",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/613ebd47-e465-4efe-b168-fa35de0967da/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Krishnayya, H V",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "7 April 1952",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-1-1-8"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9735",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Krishnayya, H V"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Letter from H. V. Krishnayya to Leslie Coleman, dated 7th April, 1952. Pleasantries and reports on whereabouts of mutual acquaintances like M Visvesvaraya and Sakamma."
                                        }
                                      },
                                      "id" => "aspace_c083080dec85180767b1f6c0fc0978d7"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-1-1-8",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_b16fefa114cb74c59c337cd919d8a3c9",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "9",
                                            "id" => "aspace_95d802cd5cd9014a44a4c0a2ac73bd5a",
                                            "parent" => "aspace_b16fefa114cb74c59c337cd919d8a3c9",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{"content" => "Bennur, S H"}
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/11",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/81021266-2946-46ab-9d69-66f49cb31211/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Bennur, S H",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "25 April 1952",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-1-1-9"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9736",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{"content" => "Bennur, S H"}
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "From S H Bennur to Leslie Coleman, dated 25th April, 1952. Pleasantries and references to Mysore Sugar Factory."
                                        }
                                      },
                                      "id" => "aspace_efb308e0b33f0307d940e5bfb8614fab"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-1-1-9",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_c732734cbf73d403165efde2653f3a2a",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "10",
                                            "id" => "aspace_fe815a8d779abe81ebcab227976e519d",
                                            "parent" => "aspace_c732734cbf73d403165efde2653f3a2a",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Krishnayya, H V"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/12",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/bbfb8935-2205-4f93-8ca0-cd60a27d4f49/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Krishnayya, H V",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "20 May 1952",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-1-1-10"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9737",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Krishnayya, H V"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "From H. V. Krishnayya to Leslie Coleman, dated 20th May, 1952. Pleasantries and reports on the whereabouts of mutual acquaintances including P. M. N. Naidu."
                                        }
                                      },
                                      "id" => "aspace_0218465c0e7d9242913ded8230ccc72b"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-1-1-10",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_020da79d60c1361101d560d11d54d5ed",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "11",
                                            "id" => "aspace_cd579753807ba7fafbcc41e5a05e2577",
                                            "parent" => "aspace_020da79d60c1361101d560d11d54d5ed",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Krishnayya, H V"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/13",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/34d947a9-1294-4b79-9a7f-ce9a013ce794/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Krishnayya, H V",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "8 October 1952",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-1-1-11"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9738",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Krishnayya, H V"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "From H. V. Krishnayya to Leslie Coleman, dated 8th October, 1952. Pleasantries and discussion on P. M. N. Naidu's research into cattle and poultry."
                                        }
                                      },
                                      "id" => "aspace_99a9a20c7302e8bf78238bac5f7d2c88"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-1-1-11",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_367a8b83c75f20ccf295c541325f3cda",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "12",
                                            "id" => "aspace_e4996bdef579e04a6b213e59e5a87fd6",
                                            "parent" => "aspace_367a8b83c75f20ccf295c541325f3cda",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Krishnayya, H V"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/14",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/1a4432c9-58de-407e-9fad-1075e215a586/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Krishnayya, H V",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "10 November 1952",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-1-1-12"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9739",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Krishnayya, H V"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "From H. V. Krishnayya to Leslie Coleman, dated 10th November, 1952. Pleasantries plus a reference to Coleman's articles about Indian agriculture on 'Canadian Forum'."
                                        }
                                      },
                                      "id" => "aspace_168d2e1b08f632739c6a4dd9c9fc2eee"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-1-1-12",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_ed50006c85affdafe63a52d779d101f3",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "13",
                                            "id" => "aspace_ccc2044f0076b5be7901fd4782be9343",
                                            "parent" => "aspace_ed50006c85affdafe63a52d779d101f3",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Penning, C J H"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/15",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/0f4df288-4331-43e2-8a05-f01c6215c700/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Penning, C J H",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "3 January 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-1-1-13"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9740",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Penning, C J H"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "From C. J. H. Penning, Ex General Manager of Mysore Sugar Company to Leslie Coleman, dated 3rd January, 1953. Refers to his travels to several sugar plantations across the colonies. Also includes references to Col W. L.Crawford, V. P. Madhav Rao and Arcot Ramaswamy Mudaliar."
                                        }
                                      },
                                      "id" => "aspace_4f74fc8ba61670be400dc5ea4c961238"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-1-1-13",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_2ad99c0c96e2c3d1db753266f5ca8561",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "14",
                                            "id" => "aspace_1216dd53ec9a46eb6d0ef73aaa23de1a",
                                            "parent" => "aspace_2ad99c0c96e2c3d1db753266f5ca8561",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Krishnayya, H V"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/16",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/acf8b0b4-cf54-4e2c-9352-838b0709987b/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Krishnayya, H V",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "29 January 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-1-1-14"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9741",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Krishnayya, H V"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "From H. V. Krishnayya to Leslie Coleman, dated 29th January, 1953. Discusses Coleman's articles about Indian agriculture on 'Canadian Forum'."
                                        }
                                      },
                                      "id" => "aspace_d6b33b84c6b8c25b2672289853a0e414"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-1-1-14",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_354eeaaf436edd16923b0941d589d70d",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "15",
                                            "id" => "aspace_3bf156b846624f8ffdd73928c71e6402",
                                            "parent" => "aspace_354eeaaf436edd16923b0941d589d70d",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Bonarjee, D I"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/17",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/2b12ef8c-b51b-414e-b180-bb4725c7dcde/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Bonarjee, D I",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "10 February 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-1-1-15"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9742",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Bonarjee, D I"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "From D. I. Bonarjee to Leslie Coleman, dated 10th February, 1953. Concerning Payment Forms."
                                        }
                                      },
                                      "id" => "aspace_7fc239124885d989553588291fc6de47"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-1-1-15",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_cfb693d32c27d387b0689467573d894f",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "16",
                                            "id" => "aspace_d808a3dfd8e8445e62973abefbf55287",
                                            "parent" => "aspace_cfb693d32c27d387b0689467573d894f",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{"content" => "Untitled"}
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/18",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/3f45c706-4aaa-4d69-b92f-dc1ceffab9a2/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Untitled",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "15 February 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-1-1-16"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9743",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{"content" => "Untitled"}
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "To Leslie Coleman, dated 15th February, 1953. From a practising doctor who was the Director of Public Health in Mandya. Including references to an anti-malaria programme that is being carried out in Mysore state."
                                        }
                                      },
                                      "id" => "aspace_47469ed8293350da80cf1ec6de44c926"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-1-1-16",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_6200543b7811e26f2573c633b98c9a2b",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "17",
                                            "id" => "aspace_c2170e83a9ee7752a5ced29f50f0366f",
                                            "parent" => "aspace_6200543b7811e26f2573c633b98c9a2b",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Morris, Ralph"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/19",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/9299c586-9e5e-4e0f-9ea3-389705f1c0c6/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Morris, Ralph",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "29 April 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-1-1-17"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9744",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Morris, Ralph"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Pleasantries and whereabouts of mutual acquaintances. Includes a reference to coffee berry borer treatment with 'agrocide'."
                                        }
                                      },
                                      "id" => "aspace_b98ac97284edf0bfaab9f96a6a942173"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-1-1-17",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_79c90a69c3df8589ce1aba8d444728d5",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "18",
                                            "id" => "aspace_7ab4fca586459deb2a4f48d4c289838d",
                                            "parent" => "aspace_79c90a69c3df8589ce1aba8d444728d5",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Krishnayya, H V"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/20",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/ecaace89-507e-4673-8bdc-655872bc1a3e/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Krishnayya, H V",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "31 May 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-1-1-18"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9745",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Krishnayya, H V"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Discusses Coleman's article on village life in India. Includes references to issues such as temple-entry, conversion and mistreatment of lower caste groups."
                                        }
                                      },
                                      "id" => "aspace_6af8067e3323078637057e150032cfed"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-1-1-18",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_052a802e52340f9dc581646438dc1949",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "19",
                                            "id" => "aspace_c54502e34b1f82b64a590a46a3dcd008",
                                            "parent" => "aspace_052a802e52340f9dc581646438dc1949",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Srinivasan, K H"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/21",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/d02f760e-e51b-461e-bbef-1aea5018dcf5/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Srinivasan, K H",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "2 July 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-1-1-19"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9746",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Srinivasan, K H"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Concerning Coleman's planned visit to India to advise on 'Coffee matters'."
                                        }
                                      },
                                      "id" => "aspace_17e658b8c070058acd594bdad9034d10"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-1-1-19",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "controlaccess" => %{
                                      "content" => %{
                                        "persname" => %{
                                          "content" => "Hanumanthaiah, K (Kengal), 1908-1980"
                                        }
                                      }
                                    },
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_f2e6c6f5bcb66cafa0887fa6b2381fa7",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "20",
                                            "id" => "aspace_b28ca0169fb437c266b1a9bcaedf037f",
                                            "parent" => "aspace_f2e6c6f5bcb66cafa0887fa6b2381fa7",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Hanumanthaiya, K"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/22",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/7141f665-29f8-493e-adc0-9e455efbfbc6/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Hanumanthaiya, K",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "9 July 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-1-1-20"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9747",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Hanumanthaiya, K"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "From K Hanumanthaiya, Chief Minister, Mysore state, to Leslie Coleman dated 9th July, 1954. Concerning Coleman's visit to the state and his recommendations regarding the Agricultural Department in Mysore State."
                                        }
                                      },
                                      "id" => "aspace_4f12de675acf80848cec6cbeb47cdc78"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-1-1-20",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_f867ea398cfd93bfb51d8a9436f2f78f",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "21",
                                            "id" => "aspace_7526500549f25b346cf04716b14bfd82",
                                            "parent" => "aspace_f867ea398cfd93bfb51d8a9436f2f78f",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Rao, B.Ganapath"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/23",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/3ae2336f-090f-4c66-b367-19afac702c63/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Rao, B.Ganapath",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "18 August 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-1-1-21"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9748",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Rao, B.Ganapath"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Pleasantries and reports on the whereabouts of B Ganapath Rao's family."
                                        }
                                      },
                                      "id" => "aspace_d4d78afabc36891c03aa2d1c27e04253"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-1-1-21",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_cc24c9d0b87bdd50afbfb966cc04e089",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "22",
                                            "id" => "aspace_5db8df7a2cfd7b8de72b427f1c498d00",
                                            "parent" => "aspace_cc24c9d0b87bdd50afbfb966cc04e089",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Rau, M.N.Krishna"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/24",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/770b3e47-fc46-42bb-9b98-813dd4ca8ba9/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Rau, M.N.Krishna",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "27 August 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-1-1-22"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9749",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Rau, M.N.Krishna"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Pleasantries and reports on events in Mysore state."
                                        }
                                      },
                                      "id" => "aspace_eb0c181f4a0448e5b1e3b0cedf12f1cf"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-1-1-22",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_7e4b105f69fa4d259316b088b125b0d1",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "23",
                                            "id" => "aspace_38a12b1a0216d7300d62798bf972787a",
                                            "parent" => "aspace_7e4b105f69fa4d259316b088b125b0d1",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Srinivasan, K H"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/25",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/5f71306f-9e7c-4f5b-b8b1-b42c9b9bee5d/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Srinivasan, K H",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "27 August 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-1-1-23"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9750",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Srinivasan, K H"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Discusses Coleman's visit to Mysore State. Includes Coleman's recommendations regarding the Agricultural Department in Mysore State."
                                        }
                                      },
                                      "id" => "aspace_a8fe3173f09c4e400ffa999b6dcc58d5"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-1-1-23",
                                  "level" => "file"
                                }
                              ],
                              "did" => %{
                                "content" => %{
                                  "container" => %{
                                    "content" => "MS-012 Box 1",
                                    "id" => "aspace_e8053f55dcfbdbe5d53b4e7c28e8dff5",
                                    "label" => "Mixed Materials",
                                    "type" => "box"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-1-1"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9727",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" => "Sub-Series 1: Letters to Leslie Coleman"
                                  }
                                }
                              }
                            },
                            "id" => "aspace_MS-012-1-1",
                            "level" => "subseries"
                          },
                          %{
                            "content" => %{
                              "c" => [
                                %{
                                  "content" => %{
                                    "controlaccess" => %{
                                      "content" => %{
                                        "famname" => %{"content" => "Coleman"}
                                      }
                                    },
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_b9971d1bb4a010c00f7f72e1cac0b47f",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "24",
                                            "id" => "aspace_b881bc41ac111a5a2e372bc855e074ab",
                                            "parent" => "aspace_b9971d1bb4a010c00f7f72e1cac0b47f",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/26",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/1dbe855d-f027-447c-9fc1-4b96b8598bec/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "16 November 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-24"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9752",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Discusses his journey from Gander to London."
                                        }
                                      },
                                      "id" => "aspace_e26a0265fb579347920daf0f53cbbef1"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-24",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "controlaccess" => %{
                                      "content" => %{
                                        "famname" => %{"content" => "Coleman"}
                                      }
                                    },
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_c138803b9e4e2ac8edd82dd745a7c06b",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "25",
                                            "id" => "aspace_d2d2859c4f3bc8c715414e342331146c",
                                            "parent" => "aspace_c138803b9e4e2ac8edd82dd745a7c06b",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/27",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/25a8f7a8-550c-4317-940b-e6713ec45c05/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "18 November 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-25"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9753",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" => "Discusses his journey to Karachi."
                                        }
                                      },
                                      "id" => "aspace_c623735dbf5b766a5f6de2f1e98ca1ca"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-25",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "controlaccess" => %{
                                      "content" => %{
                                        "famname" => %{"content" => "Coleman"}
                                      }
                                    },
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_ae6682433d4f927898f9ffaa5945e32a",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "26",
                                            "id" => "aspace_89ee03748d5f267657e0a3b397dd8dbd",
                                            "parent" => "aspace_ae6682433d4f927898f9ffaa5945e32a",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/28",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/483478b8-2384-45a3-8e33-f2dfb3ce2259/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "18 November 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-26"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9754",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" => "Discusses his journey to Bombay."
                                        }
                                      },
                                      "id" => "aspace_197ace127751a232c0a4fff0c90ae28c"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-26",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "controlaccess" => %{
                                      "content" => %{
                                        "famname" => %{"content" => "Coleman"}
                                      }
                                    },
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_6a12b15a7165a1b836f273e457897f9f",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "27",
                                            "id" => "aspace_50d472bc01a825787c6eeb86a55ecda7",
                                            "parent" => "aspace_6a12b15a7165a1b836f273e457897f9f",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/29",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/f61a9080-321f-4cea-b099-829dd98c18de/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "19 November 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-27"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9755",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Discusses his welcome and stay at Bangalore."
                                        }
                                      },
                                      "id" => "aspace_933fb7d05c1e9ca0b1a2d956dcbf1f60"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-27",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "controlaccess" => %{
                                      "content" => %{
                                        "famname" => %{"content" => "Coleman"}
                                      }
                                    },
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_ea8cab9c73caf81a95dc6b42c6ead27b",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "28",
                                            "id" => "aspace_6e642d3b2ebde87a5c1ff60af634f546",
                                            "parent" => "aspace_ea8cab9c73caf81a95dc6b42c6ead27b",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/30",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/eb7eee36-76f3-4a23-830b-e41de171d6a5/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "20 November 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-28"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9756",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" => "Concerning his stay in Mysore State."
                                        }
                                      },
                                      "id" => "aspace_2719ade1efe8a9664a382826d343ac69"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-28",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "controlaccess" => %{
                                      "content" => %{
                                        "persname" => %{
                                          "content" => "Coleman, Louisa"
                                        }
                                      }
                                    },
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_46f0ba1cd63cf56c30e214fa90d04e5e",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "29",
                                            "id" => "aspace_06bbf30ea921ca0c97513252b0f0711b",
                                            "parent" => "aspace_46f0ba1cd63cf56c30e214fa90d04e5e",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman, Louisa"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/31",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/67796ebb-53e0-4861-a67c-ab79ef2be130/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman, Louisa",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "23 November 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-29"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9757",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman, Louisa"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Detailing events and anecdotes about his stay in Mysore state."
                                        }
                                      },
                                      "id" => "aspace_74c8102a656835984e6f17a4b7033198"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-29",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "controlaccess" => %{
                                      "content" => %{
                                        "famname" => %{"content" => "Coleman"}
                                      }
                                    },
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_e28124f4fd46458d22e25c721efbec22",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "30",
                                            "id" => "aspace_9ee033c2a59864a6845761a956ef820c",
                                            "parent" => "aspace_e28124f4fd46458d22e25c721efbec22",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/32",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/142c4457-3c7a-41f1-8a42-5496889ae997/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "24 November 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-30"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9758",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Anecdotes about his stay as 'State Guest'. Mentions meeting with the Chief Minister and Robert Lake, Chairman of the Mysore Planters Association."
                                        }
                                      },
                                      "id" => "aspace_5587de86045294e8725f41ce4951d71d"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-30",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "controlaccess" => %{
                                      "content" => %{
                                        "persname" => %{
                                          "content" => "Coleman, Louisa"
                                        }
                                      }
                                    },
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_aa53b49a13b63d9c557967292ee2cacf",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "31",
                                            "id" => "aspace_c3bf4a1e766ee1c4d4e5ce6a95c1a031",
                                            "parent" => "aspace_aa53b49a13b63d9c557967292ee2cacf",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman, Louisa"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/33",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/ec5ab0a3-e953-4c4c-a364-3aee1364150e/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman, Louisa",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "26 November 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-31"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9759",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman, Louisa"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Detailing events and anecdotes about his stay in Mysore state. Mentions Vice President Nixon's visit to India."
                                        }
                                      },
                                      "id" => "aspace_a28e4e0d9a6b9d52b7e2cb286810f5dc"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-31",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_6de1f63accafb33677c0fda97d6ffedd",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "32",
                                            "id" => "aspace_25e2e87f6f2efe8f94906d16cc5de767",
                                            "parent" => "aspace_6de1f63accafb33677c0fda97d6ffedd",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/34",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/63f94f3f-bcfa-4dda-a386-e7849ebff10c/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "26 November 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-32"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9760",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" => "Anecdotes about his stay in Mysore state."
                                        }
                                      },
                                      "id" => "aspace_06d0c4500250d5cce6ac80d79b60924c"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-32",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_945f9f6a9f056076337736be3d15be5c",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "33",
                                            "id" => "aspace_b55e7394ea2f2339855ffa6a54508d23",
                                            "parent" => "aspace_945f9f6a9f056076337736be3d15be5c",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/35",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/7c8094da-b5d7-4595-a73b-2b0df74bee5c/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "30 November 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-33"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9761",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Detailing events and anecdotes about his stay in Mysore state. Mentions a meeting with Chairman of Mysore Sugar Company and the Bangalore Literary Union."
                                        }
                                      },
                                      "id" => "aspace_3983c928e292431604eeabcc75792a89"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-33",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_0c70231dce9bb0edf3a5257d82299d45",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "34",
                                            "id" => "aspace_b2c4d3157e6d657c880c8c19910619e7",
                                            "parent" => "aspace_0c70231dce9bb0edf3a5257d82299d45",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/36",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/08cf4a5a-cb49-4023-b976-85664e744dae/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "2 December 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-34"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9762",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Detailing events and anecdotes about his stay in Mysore state. Mentions a meeting with Ralph Morris."
                                        }
                                      },
                                      "id" => "aspace_f8778d5b1562392b6e17dc01735e1d90"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-34",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_be8c4a5ad3480f4926c1f8e8a09c12c4",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "35",
                                            "id" => "aspace_1d47c76fa77920b54008c6d68b0fab8d",
                                            "parent" => "aspace_be8c4a5ad3480f4926c1f8e8a09c12c4",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/37",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/af7ddbc5-7ede-4c14-bc3c-c35083705a45/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "3 December 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-35"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9763",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Detailing events and anecdotes about his stay in Bangalore, including a shopping trip to Commercial Street in Bangalore."
                                        }
                                      },
                                      "id" => "aspace_dca681d0decf978b8c15463470631a0d"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-35",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_dadb594e964ec19decdb7b13eaef1b23",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "36",
                                            "id" => "aspace_24fa1ab3d7ccf266af39ce219dd8d8b8",
                                            "parent" => "aspace_dadb594e964ec19decdb7b13eaef1b23",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/38",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/b56c703b-6aa8-4308-aaa2-8f67e9a249ac/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "5 December 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-36"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9764",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Detailing events and anecdotes about his stay in Mysore state. Mentions inauguration of a new glass house at Lal Bagh in Bangalore."
                                        }
                                      },
                                      "id" => "aspace_cd75dc3dc0b70490b6384906a3c6641a"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-36",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_14d931f0a21ffbd2ad5271c52a087345",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "37",
                                            "id" => "aspace_291a598f30b32d7261aab9bc000545c4",
                                            "parent" => "aspace_14d931f0a21ffbd2ad5271c52a087345",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/39",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/0251e0a5-8a51-4f32-b549-1d49094aae41/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "10 December 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-37"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9765",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Detailing events during his tour of villages in the Mysore state in India to evaluate agricultural practices and departments."
                                        }
                                      },
                                      "id" => "aspace_340083008bd53893011b7234b8afdf5e"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-37",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_16799d4a76d7757a33bc232dc2f27471",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "38",
                                            "id" => "aspace_ff8fb1d60aa9a72b6d42107de526e9f2",
                                            "parent" => "aspace_16799d4a76d7757a33bc232dc2f27471",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman, Louisa"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/40",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/f3115171-0998-4c33-bf8c-fe13eb77f995/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman, Louisa",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "11 December 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-38"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9766",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman, Louisa"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Detailing sights and events during his tour of villages in the Mysore state in India to evaluate agricultural practices and departments."
                                        }
                                      },
                                      "id" => "aspace_fcf6c77b6d3534ced4c78bafa3ee3d4a"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-38",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_39b836b2baa756afdfe0364cf2aae4fc",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "39",
                                            "id" => "aspace_1c6d9749a1bbe9c143f1017ff498482f",
                                            "parent" => "aspace_39b836b2baa756afdfe0364cf2aae4fc",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/41",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/7e7c6304-471b-4d78-90e8-a8ccc7cd4e30/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "14 December 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-39"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9767",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Detailing events during his tour of Marathahalli in the Mysore state in India to evaluate agricultural practices and departments. Refers to an anti-malaria drive in Mysore state."
                                        }
                                      },
                                      "id" => "aspace_ce6d27ccff0f5a1cab9717c8393b397d"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-39",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_08a79754811aa62ef98b88407827a212",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "40",
                                            "id" => "aspace_4a2a451faad2b8dd774f3ac44cc0d6c7",
                                            "parent" => "aspace_08a79754811aa62ef98b88407827a212",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/42",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/bc899852-b5c9-4bd7-b4be-b2916db742ca/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => " Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "17 December 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-40"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9768",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Detailing events during his stay at Coffee Research Station, Balehonnur in the Mysore state in India to evaluate agricultural practices."
                                        }
                                      },
                                      "id" => "aspace_a7f2b9bafd6644ee57f82ee992f3e9dd"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-40",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_fd54f17392400d94bc3795936d4b002a",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "41",
                                            "id" => "aspace_065811651fb18486188e3c08b0191aae",
                                            "parent" => "aspace_fd54f17392400d94bc3795936d4b002a",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman, Ann"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/43",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/52ffb94e-39a5-48fe-ae63-3edb70903c7c/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman, Ann",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "18 December 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-41"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9769",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman, Ann"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Detailing events during his stay at Coffee Research Station, Balehonnur in the Mysore state in India to evaluate agricultural practices."
                                        }
                                      },
                                      "id" => "aspace_3afcaf2ec9ba966d48b94402c2280d71"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-41",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_da6f15d23d3ee7627c826dd945f7eb1b",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "42",
                                            "id" => "aspace_378697e8bce0deebbee13ccf2ea291d2",
                                            "parent" => "aspace_da6f15d23d3ee7627c826dd945f7eb1b",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman, Louisa"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/44",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/08a2e875-28a9-49ce-9ab5-71e26e6856e9/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman, Louisa",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "18 December 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-42"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9770",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman, Louisa"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Detailing events during his stay at Coffee Research Station, Balehonnur in the Mysore state in India to evaluate agricultural practices."
                                        }
                                      },
                                      "id" => "aspace_53145b8612a65549871db63c878c0ad0"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-42",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_d2ee4906cf2d1dde221a49a1c5488283",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "43",
                                            "id" => "aspace_ec15d115d6e6506bae8a8a0243048b56",
                                            "parent" => "aspace_d2ee4906cf2d1dde221a49a1c5488283",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman, Louisa"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/45",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/629ba1a4-1b7e-4d39-8c54-15cae5d0db32/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman, Louisa",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "25 December 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-43"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9771",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman, Louisa"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Detailing events during his stay at Honnametti with the Morris' in the Mysore state in India to evaluate agricultural practices."
                                        }
                                      },
                                      "id" => "aspace_c84b0bd84a6536d3a9a3f093f36926e0"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-43",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_31417da7545469146ed6d01335162bb0",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "44",
                                            "id" => "aspace_646c42bdceda3ccd20b6bdcdf385b8e4",
                                            "parent" => "aspace_31417da7545469146ed6d01335162bb0",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/46",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/1ca343a2-6845-4a43-8d14-c3ca1fc5a306/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "29 December 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-44"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9772",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Detailing events during his stay at Mysore. Includes references to Mrs Irvine and Mrs McGann, attached as companions to Dowager Maharani of Mysore."
                                        }
                                      },
                                      "id" => "aspace_eb853f8de5e8b129419f776371039dad"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-44",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_e7c7305ed027ec7a827a9d55075523b3",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "45",
                                            "id" => "aspace_96d3855c75488bd5c9fa19aa5b23b8df",
                                            "parent" => "aspace_e7c7305ed027ec7a827a9d55075523b3",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/47",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/dee93cd3-22d7-4c7f-8caa-512971310ed0/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "31 December 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-45"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9773",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Detailing events during his stay at Mandya. Mentions a commemoration ceremony for Coleman held at Mysore Sugar Company, also refers to the Krishnarajasagara dam."
                                        }
                                      },
                                      "id" => "aspace_d854fe9462d977f8d65da8f65cf61e1c"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-45",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_7c43d803045918144d85a5a320dbdc57",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "46",
                                            "id" => "aspace_471cda4dce059c01778668e909bf0b09",
                                            "parent" => "aspace_7c43d803045918144d85a5a320dbdc57",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/48",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/ce20a7f0-9a5f-427b-8d28-eb583f969b84/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "6 January 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-46"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9774",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "A summary of events during his stay in Mysore state. Attached is a typewritten copy of the letter."
                                        }
                                      },
                                      "id" => "aspace_7d922951fef30852b7b7339e57ba0269"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-46",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_707fe2b7d7298bd1189a1b3af9fe489b",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "47",
                                            "id" => "aspace_2a770b133826c1de72d04bdc372c1a8c",
                                            "parent" => "aspace_707fe2b7d7298bd1189a1b3af9fe489b",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman, Louisa"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/49",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/466618f2-64e4-4b59-97ee-8c3741cefebd/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman, Louisa",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "8 January 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-47"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9775",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman, Louisa"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions W W Mayne, former coffee scientific officer at United Planters Association of South India."
                                        }
                                      },
                                      "id" => "aspace_0a30a03c8f2ed399148ab8a6adceafab"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-47",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_b2158d6570ab34b7789ec96b8fcb52af",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "48",
                                            "id" => "aspace_8dce5aafa421a666ff2b462eb60dac3b",
                                            "parent" => "aspace_b2158d6570ab34b7789ec96b8fcb52af",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/50",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/0524430f-bbb4-4733-909a-89d242307f83/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "10 January 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-48"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9776",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions W W Mayne, Hebbal farm and Agricultural College. Attached is a typewritten version of the letter."
                                        }
                                      },
                                      "id" => "aspace_e76d4967948b3d03a62eb8eeede2a1c9"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-48",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_29a6f7a3c650b2c689dc1abddf31a59b",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "49",
                                            "id" => "aspace_225f85881dd6d15f6b32d93fd74d8342",
                                            "parent" => "aspace_29a6f7a3c650b2c689dc1abddf31a59b",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman, Ann"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/51",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/a9c20bb3-69a0-436e-acfb-d88be19e0231/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman, Ann",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "12 January 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-49"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9777",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman, Ann"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "From Leslie Coleman to Ann Coleman, dated 12th January, 1954. Detailing events during his stay in the Mysore state in India. Mentions Robert J. Flaherty, Van Ingen taxidermists."
                                        }
                                      },
                                      "id" => "aspace_1a2fd167ac51b873907b5a9802ad318c"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-49",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_b91c63a9bd29a42673b18574eeb88579",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "50",
                                            "id" => "aspace_f1b3dbffc4e688dbf7a6dbf470be1e8e",
                                            "parent" => "aspace_b91c63a9bd29a42673b18574eeb88579",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman, Louisa"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/52",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/48e3f780-29e0-4322-bb48-e2f3be336d9f/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman, Louisa",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "13 January 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-50"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9778",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman, Louisa"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Detailing events during his stay in Mysore state. Mentions the Srinivasans."
                                        }
                                      },
                                      "id" => "aspace_f1c37b3855ea553c8b95a7bdf33d0bbe"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-50",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_630589d90c414c17352a08c5376d1f6d",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "51",
                                            "id" => "aspace_ae501fbc66559de270c27078954a9fda",
                                            "parent" => "aspace_630589d90c414c17352a08c5376d1f6d",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/53",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/491f91af-9e97-43cb-aa1f-24141f3522c4/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "14 January 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-51"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9779",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Detailing events during his stay in Mysore state. Mentions the M N Krishna Rao, Botanical Society of Central College."
                                        }
                                      },
                                      "id" => "aspace_8b4ad3f9aa2288287a3a8ecd13150ca3"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-51",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_e102d75ae38c1d020ef02ef4b6976785",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "52",
                                            "id" => "aspace_0a72c699ed97db444dbb9a6bbaa84865",
                                            "parent" => "aspace_e102d75ae38c1d020ef02ef4b6976785",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/54",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/aeb8d803-63f6-4901-81d2-c6a231c8d6d4/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "25 January 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-52"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9780",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Detailing visit to Bellary during his tour of the Mysore state"
                                        }
                                      },
                                      "id" => "aspace_a8e0519ea2fb3674954296f928cc03d8"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-52",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_131cee12a557d78a8af53596e4e67d87",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "53",
                                            "id" => "aspace_a0c77bdc37ba29a18c5f40a666761107",
                                            "parent" => "aspace_131cee12a557d78a8af53596e4e67d87",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/55",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/2bc0290b-8eab-4cf7-93ce-ec9c89e6db28/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "31 January 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-53"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9781",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions Coffee Research Station, Balehonnur. Details the itinerary of the rest of Coleman's stay in Mysore state."
                                        }
                                      },
                                      "id" => "aspace_1431ce18d7ae5a46097a44a9fa421003"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-53",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_65488146a1042bb137732ae6d4c3491b",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "54",
                                            "id" => "aspace_856a0261aad9f571646b908332fcc5d2",
                                            "parent" => "aspace_65488146a1042bb137732ae6d4c3491b",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/56",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/60f429e5-eab5-49e6-8257-5151b07c10a8/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "3 February 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-54"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9782",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Includes itinerary for the last half of Coleman's stay in Mysore state. Mentions difficulties of getting any business done in India."
                                        }
                                      },
                                      "id" => "aspace_22e5a82bff90c1dc41df7cf41d5befda"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-54",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_d684e08ce73d8117dde1bc3fac3fe323",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "55",
                                            "id" => "aspace_026696a96b6129ac45422c805bf3af50",
                                            "parent" => "aspace_d684e08ce73d8117dde1bc3fac3fe323",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/57",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/03398a6b-e00d-48b5-bbd0-3fed6d6d732d/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "9 February 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-55"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9783",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions coffee planters of Coorg and Canadian Prime Minister Louis St. Laurent."
                                        }
                                      },
                                      "id" => "aspace_29cf6dd7a5d647c0beeafb7448921263"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-55",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_6a547e3d4a22874750e0b19f142d87c5",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "56",
                                            "id" => "aspace_c2299f882d69a58c6b56fdedbbed3d42",
                                            "parent" => "aspace_6a547e3d4a22874750e0b19f142d87c5",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/58",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/c0d50721-4864-4937-b4dd-a73c4c492da6/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "12 February 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-56"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9784",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Detailing his visit to Spun Silk Mills at Channapatna. Mentions the Maharaja of Mysore state."
                                        }
                                      },
                                      "id" => "aspace_844918b21795101257f79db1534b7ac2"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-56",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_f35e04253c0c7dea58a5e425bfe275c9",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "57",
                                            "id" => "aspace_8558caa4a4c2c951c45327f615383d2e",
                                            "parent" => "aspace_f35e04253c0c7dea58a5e425bfe275c9",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/59",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/adb06138-deb6-40b5-9839-55fb1dc25921/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "13 February 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-57"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9785",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions last leg of Coleman's tour in Bangalore."
                                        }
                                      },
                                      "id" => "aspace_48e184ef544edc92298261f9d65c2854"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-57",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_3deb683cc0c362b77a928bfb9f00273b",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "58",
                                            "id" => "aspace_cd76a1a48e949d20167bc367e53975df",
                                            "parent" => "aspace_3deb683cc0c362b77a928bfb9f00273b",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman, Ann"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/60",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/ec1adb74-17e6-4393-abc9-d75c0ad6d6ff/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman, Ann",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "14 February 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-58"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9786",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman, Ann"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Observations about villages that Coleman had visited during his tour of Mysore state."
                                        }
                                      },
                                      "id" => "aspace_b3db7fd22fe5b07ef7f08763a9291c2e"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-58",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_d5bbf31109450ad8fd17ac2d99f6c1d5",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "59",
                                            "id" => "aspace_6b8ccb2b1a0f76ae67ca80528f272adf",
                                            "parent" => "aspace_d5bbf31109450ad8fd17ac2d99f6c1d5",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman, Louisa"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/61",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/4d83f316-012a-48d2-a876-1275a9b2e792/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman, Louisa",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "14 February 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-59"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9787",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman, Louisa"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions Principal of Institute of Technology, Kharagpur and Rama Reddy, a friend of Coleman's."
                                        }
                                      },
                                      "id" => "aspace_f703a68be7b0d581a51f6d6461667edd"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-59",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_7ab0b453870f6052a14d12f604d7423d",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "60",
                                            "id" => "aspace_a9192951f7a48cee083b187d25894fcb",
                                            "parent" => "aspace_7ab0b453870f6052a14d12f604d7423d",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Palmer, Luella C"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/62",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/643eca61-a0f7-49f0-963b-f3b0b5aa25db/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Palmer, Luella C",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "17 February 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-60"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9788",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Palmer, Luella C"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions a report on agricultural practices that Coleman was commissioned to write by the government."
                                        }
                                      },
                                      "id" => "aspace_d69e72d13e4b7598cb4a337d87e7495f"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-60",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_d12677563605a16923b8d0502b07d1f0",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "61",
                                            "id" => "aspace_375c35983081193c4e716e013fb7fefa",
                                            "parent" => "aspace_d12677563605a16923b8d0502b07d1f0",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/63",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/0467fd58-6bff-47dd-919f-1d5a4428636d/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "19 February 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-61"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9789",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" => "Details his tour of Hoskote and Kolar."
                                        }
                                      },
                                      "id" => "aspace_5febb90711023f4415a63e7955bd1d7e"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-61",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_27cb95c3aeefea7f9aa819979cb6fd4c",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "62",
                                            "id" => "aspace_b7d829bb119623df5221620aea371f5a",
                                            "parent" => "aspace_27cb95c3aeefea7f9aa819979cb6fd4c",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/64",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/1dc61364-9512-4e3b-a911-13d34813b797/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "3 March 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-62"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9790",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions a report on agricultural practices that Coleman was writing for the government. Also includes mention of 17 framed addresses given to Coleman in India."
                                        }
                                      },
                                      "id" => "aspace_c68c0a8ba470b9afa7538421c8a94fc9"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-62",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_e5e387ff959ec1f99846a6158d17cb56",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "63",
                                            "id" => "aspace_839d3b97d6af4d21fdfba57f110e6150",
                                            "parent" => "aspace_e5e387ff959ec1f99846a6158d17cb56",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman, Louisa"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/65",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/6c6031a2-6a6e-40bb-9184-b466c64dea81/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman, Louisa",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "6 March 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-63"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9791",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman, Louisa"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Regarding journey back to Canada. Mentions Morris' and Davisons of Oakville."
                                        }
                                      },
                                      "id" => "aspace_8edca4b9406dc2e548208f7a1b5a721f"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-63",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_383dadc335d8d8839c87f48a82da9897",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "64",
                                            "id" => "aspace_86b601bec8e48cd6211ebc2017f5a6ef",
                                            "parent" => "aspace_383dadc335d8d8839c87f48a82da9897",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/66",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/c0ed4942-6f34-43b4-abac-08253bb15cc7/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "21 March 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-64"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9792",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions A R Gopala Ayengar, K Hanumanthaiya, Chief Minister, Mysore state and R Nagan Gowda, Minister of Agriculture. Includes references to M J Narasimhan, and H V Krishnayya."
                                        }
                                      },
                                      "id" => "aspace_b99086f1d72efd31a7c6d4bb5188f021"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-64",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 1",
                                            "id" => "aspace_6663a7aa09fe7f2b2ca3844be46e416f",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "65",
                                            "id" => "aspace_5129a921ecd1658c9f9432fd14daab72",
                                            "parent" => "aspace_6663a7aa09fe7f2b2ca3844be46e416f",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Coleman, Louisa"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/67",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/02d43e52-4397-4fae-8b7e-13f5233c0a2a/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Coleman, Louisa",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "22 March 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-2-1-65"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9793",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman, Louisa"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Regarding plans for London during journey back to Canada"
                                        }
                                      },
                                      "id" => "aspace_98e72b2ff57abe3346f7ac45f013ac36"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-2-1-65",
                                  "level" => "file"
                                }
                              ],
                              "did" => %{
                                "content" => %{
                                  "container" => %{
                                    "content" => "MS-012 Box 1",
                                    "id" => "aspace_37283605ed4ccc4ea57bd1aeb36d31f4",
                                    "label" => "Mixed Materials",
                                    "type" => "box"
                                  },
                                  "origination" => %{
                                    "content" => %{
                                      "persname" => %{
                                        "content" => "Coleman, L C (Leslie Charles) (1878-1954)",
                                        "role" => "aut"
                                      }
                                    },
                                    "label" => "Creator"
                                  },
                                  "unitdate" => %{
                                    "calendar" => "gregorian",
                                    "certainty" => "inferred",
                                    "content" => "1953-1954",
                                    "datechar" => "creation",
                                    "era" => "ce",
                                    "normal" => "1953/1954",
                                    "type" => "inclusive"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-1-2"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9751",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" =>
                                      "Sub-Series 2: Letters from Leslie Coleman - Visit to India"
                                  }
                                }
                              }
                            },
                            "id" => "aspace_MS-012-1-2",
                            "level" => "subseries"
                          },
                          %{
                            "content" => %{
                              "c" => [
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "Oversized 6",
                                            "id" => "aspace_99b974242c418fa2881c188e481c403e",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "2",
                                            "id" => "aspace_7b1f7b480516bba50f276ba814b40139",
                                            "parent" => "aspace_99b974242c418fa2881c188e481c403e",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Bangalore District Sericulture Conference"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/68",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/39f22dd3-7344-4ac4-9e1a-fd6868251217/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Bangalore District Sericulture Conference",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "21 December 1924",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-3-OS-6-2"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9795",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Bangalore District Sericulture Conference"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "A commemorative address printed on silk given to Coleman at the Bangalore District Sericulture Conference in Channapatna. Includes a song about silk and sericulture in Kannada."
                                        }
                                      },
                                      "id" => "aspace_b64131f7bf9e6737c3f9d2cb0521d33a"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-3-OS-6-2",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 2",
                                            "id" => "aspace_79f6ec6a51d4bc114cb0379f4913ea66",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "1",
                                            "id" => "aspace_9796c23f1f8d8ab78401e052449d6e55",
                                            "parent" => "aspace_79f6ec6a51d4bc114cb0379f4913ea66",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{"content" => "Tai Nadu"}
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/69",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/28e51a8e-13a9-48e7-94e9-eef099449118/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Tai Nadu",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "18 November 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-3-2-1"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9796",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{"content" => "Tai Nadu"}
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Titled 'Tai Nadu' (Motherland). Welcomes Coleman back to Mysore state and details his achievements during his service in India."
                                        }
                                      },
                                      "id" => "aspace_3ae5765c44a2f46efc978ffef5cfa208"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-3-2-1",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 2",
                                            "id" => "aspace_5335158da7f9f16e088189498e930188",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "2",
                                            "id" => "aspace_1cad0dcada65468d6c4aea261189fbed",
                                            "parent" => "aspace_5335158da7f9f16e088189498e930188",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Taluk Agricultural and Experimental Union, Thirthahalli"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/70",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/bc3791f4-3eb9-4c47-a183-fba159039afe/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Taluk Agricultural and Experimental Union, Thirthahalli",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "16 December 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-3-2-2"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9797",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Taluk Agricultural and Experimental Union, Thirthahalli"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions Coleman's role in protecting areca crop from the ravages of 'Koleroga' disease using Bordeaux mixture."
                                        }
                                      },
                                      "id" => "aspace_eacbf6e959d69c16916882cd23b0f458"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-3-2-2",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 2",
                                            "id" => "aspace_774856aa4a27b4a50168597752f95db3",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "3",
                                            "id" => "aspace_4c4f4af13c52207daee730a3279fa28d",
                                            "parent" => "aspace_774856aa4a27b4a50168597752f95db3",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Chikmagalur District Agricultural and Experimental Union"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/71",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/695f75e1-7a48-4be8-98df-9b442ce56ee0/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Chikmagalur District Agricultural and Experimental Union",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "21 December 1953",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-3-2-3"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9798",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Chikmagalur District Agricultural and Experimental Union"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions Coleman's contributions in setting up Coffee Research Station at Balehonnur, a cattle breeding station at Ajjampur, an Agricultural and Experimental Union and an Agricultural School in Chikamagalur"
                                        }
                                      },
                                      "id" => "aspace_03c8c9ae947572e55ecfdea465bb864e"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-3-2-3",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 2",
                                            "id" => "aspace_d1aecf7288be429c5d2492e003b4ee2b",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "4",
                                            "id" => "aspace_398d8caf5e8515c5aa0b93f425c9108a",
                                            "parent" => "aspace_d1aecf7288be429c5d2492e003b4ee2b",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Mysore Sugar Company Limited, Mandya"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/72",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/cb18eca8-e4d0-4822-a01f-dde751b9ef96/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Mysore Sugar Company Limited, Mandya",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "5 January 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-3-2-4"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9799",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Mysore Sugar Company Limited, Mandya"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions Coleman's role in setting up the Mysore Sugar Company at Mandya in 1933, and the groundwork he laid for a molasses distillery which was set up in 1935. Includes details about production rates at the factory."
                                        }
                                      },
                                      "id" => "aspace_0e2cef9c8ccc77e2e15996b230d6015a"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-3-2-4",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 2",
                                            "id" => "aspace_a195b9e3777a9dc86c3d504e3875b99f",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "5",
                                            "id" => "aspace_8ce39c97785ff6795e86b4fbca91352e",
                                            "parent" => "aspace_a195b9e3777a9dc86c3d504e3875b99f",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Mysore Agricultural and Experimental Union, Yelahanka"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/73",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/b60a2548-6378-4c6d-bd8f-be0207a3fa91/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Mysore Agricultural and Experimental Union, Yelahanka",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "9 January 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-3-2-5"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9800",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Mysore Agricultural and Experimental Union, Yelahanka"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions Coleman's role in making an improved plough, and breeding of ragi and sugarcane varieties to improve yield. Includes references to Mysore Agricultural Journal and Coleman's article titled ' After twenty years' and refers to the Agricultural and Experimental Union."
                                        }
                                      },
                                      "id" => "aspace_39d05887fbbebae8a7ee3e738faf5fb7"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-3-2-5",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 2",
                                            "id" => "aspace_a689f06ac2a783fcbfaa2cf54d573c89",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "6",
                                            "id" => "aspace_3fd26aab89edc48897c75d6e76bfbe87",
                                            "parent" => "aspace_a689f06ac2a783fcbfaa2cf54d573c89",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Chitradurga Taluk, Lakshmisagar Village Farmers"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/74",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/35ceed5a-a632-43ef-882a-c7b94ff4a039/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Chitradurga Taluk, Lakshmisagar Village Farmers",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "19 January 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-3-2-6"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9801",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Chitradurga Taluk, Lakshmisagar Village Farmers"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions government supported use of 'jarsa' breed of ragi during drought years. Includes issues regarding a well at the local school."
                                        }
                                      },
                                      "id" => "aspace_86504c3ac9a66c789d30c4fd89502f95"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-3-2-6",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 2",
                                            "id" => "aspace_ee8e0eadfd5e4c74287d450b14eaf993",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "7",
                                            "id" => "aspace_71633889f0a2d90ba5524db623d0b24a",
                                            "parent" => "aspace_ee8e0eadfd5e4c74287d450b14eaf993",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Mysore Agricultural and Experimental Union, Goridibinur"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/75",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/fd2d92ce-b2a0-4449-abf4-b00e36f04334/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Mysore Agricultural and Experimental Union, Goridibinur",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "24 January 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-3-2-7"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9802",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Mysore Agricultural and Experimental Union, Goridibinur"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions name of some of the farmers of Goribidinur taluk who worked with Coleman. Includes references to sugarcane and tobacco, Acharya high school, and the requirement of an artificial insemination centre and poultry demonstration unit in the district."
                                        }
                                      },
                                      "id" => "aspace_853b4e5fc5b89f632175c8797da11f7b"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-3-2-7",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 2",
                                            "id" => "aspace_675c143f2ffdc3335bd714efd6160e0f",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "8",
                                            "id" => "aspace_6bed8ffe83a24983d0413df0ce8177fc",
                                            "parent" => "aspace_675c143f2ffdc3335bd714efd6160e0f",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Mysore Agricultural and Experimental Union, Channapatna Taluk"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/76",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://iiif.archives.ncbs.res.in/iiif/2/89fc4c10-7697-4ce2-8227-c77c5edd8e45/full/1454,/0/default.jpg?download=true",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Mysore Agricultural and Experimental Union, Channapatna Taluk",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "13 February 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-3-2-8"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9803",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Mysore Agricultural and Experimental Union, Channapatna Taluk"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions activities of the Channapatna Agricultural and Experimental Union, including use of a Japanese system of paddy cultivation"
                                        }
                                      },
                                      "id" => "aspace_8da9d13507bcd35e2149e4736fc3226f"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-3-2-8",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 2",
                                            "id" => "aspace_e84b03269586d614916ff70d7d4a29d5",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "9",
                                            "id" => "aspace_df429d14f7a45aa415898b94b8d958d4",
                                            "parent" => "aspace_e84b03269586d614916ff70d7d4a29d5",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Mysore Agricultural and Experimental Union Ryots of Ramanagaram Taluk"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/77",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/b264c2d9-e65a-4c15-88c3-27b2c90a822b/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Mysore Agricultural and Experimental Union Ryots of Ramanagaram Taluk",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "13 February 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-3-2-9"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9804",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Mysore Agricultural and Experimental Union Ryots of Ramanagaram Taluk"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Includes references to crop breeds, Ragi H22 and Sugarcane H M 320. Also includes a list of requirements provided by farmers of Ramanagaram Agricultural and Experimental Union."
                                        }
                                      },
                                      "id" => "aspace_1b1a28c694f063d24aee79c7cf8595f3"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-3-2-9",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 2",
                                            "id" => "aspace_610ec75bd4bc9cbbd766bbe9dee1cb13",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "10",
                                            "id" => "aspace_19215dac5524ee4ef6cff53d7c425def",
                                            "parent" => "aspace_610ec75bd4bc9cbbd766bbe9dee1cb13",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Taluk Agricultural Union, Magadi"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/78",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/913b16e9-a122-408f-8dd3-8e9798e9b040/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Taluk Agricultural Union, Magadi",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "16 February 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-3-2-10"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9805",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Taluk Agricultural Union, Magadi"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions activities of the Taluk Agricultural and Experimental Union, Magadi."
                                        }
                                      },
                                      "id" => "aspace_3b59f89a411a504128c97d7b1b363743"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-3-2-10",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 2",
                                            "id" => "aspace_8cfdb0b3ec676ef5c5d3547164080e56",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "11",
                                            "id" => "aspace_30a235ec8ecc956de1ed841ef4923c30",
                                            "parent" => "aspace_8cfdb0b3ec676ef5c5d3547164080e56",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Kolar District Agricultural and Experimental Union"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/79",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/03ed0b26-5901-441b-94bf-dbdaa87043a5/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Kolar District Agricultural and Experimental Union",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "19 February 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-3-2-11"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9806",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Kolar District Agricultural and Experimental Union"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions mixed farming methods in dry tracts in the arid Kolar district. Includes reference to Mokshagundam Visweswaraiah."
                                        }
                                      },
                                      "id" => "aspace_696cc5729c3d80c66e4969618cc4a578"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-3-2-11",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 2",
                                            "id" => "aspace_fa2d938ae7f90956f192f659bf3338e2",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "12",
                                            "id" => "aspace_40c3ae1f51cce6ec0f28eb1996f0b191",
                                            "parent" => "aspace_fa2d938ae7f90956f192f659bf3338e2",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Mysore Agricultural and Experimental Union, Bangarpet Taluk"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/80",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/a9fa30eb-ef43-4591-ab09-b07f8ef51f71/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Mysore Agricultural and Experimental Union, Bangarpet Taluk",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "20 February 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-3-2-12"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9807",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Mysore Agricultural and Experimental Union, Bangarpet Taluk"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions H22 Ragi breed, and requirement for a ragi variant to be grown through July to October, which is the sparse rainfall season in Kolar district."
                                        }
                                      },
                                      "id" => "aspace_654a317074871ba23d7ff62b9d4514c6"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-3-2-12",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 2",
                                            "id" => "aspace_07a429946057f50f2d001a382536b7e3",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "13",
                                            "id" => "aspace_320ed2c13025e1f986dc78489755b8e6",
                                            "parent" => "aspace_07a429946057f50f2d001a382536b7e3",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Mysore Agricultural and Experimental Union, Chintamani Taluk"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/81",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/server/api/core/bitstreams/791a0fdf-2b13-4a0e-869f-71bcdbd5e7d1/content",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Mysore Agricultural and Experimental Union, Chintamani Taluk",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "21 February 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-3-2-13"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9808",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Mysore Agricultural and Experimental Union, Chintamani Taluk"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions H 22 Ragi breed, 'Koleroga' and measures against grasshopper attack implemented by Coleman. Also lists requirements of the Agricultural and Experimental Union of Chintamani Taluk."
                                        }
                                      },
                                      "id" => "aspace_80045061d9238491df801ef14601b8b7"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-3-2-13",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 2",
                                            "id" => "aspace_bab1a9f6e1ce220423074791983573e6",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "14",
                                            "id" => "aspace_84ab6b018d0ec2176f1a0f42c99de8cb",
                                            "parent" => "aspace_bab1a9f6e1ce220423074791983573e6",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Unknown Title"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/82",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/ab9fec8a-61ed-4294-bb4a-a10f919d3e66/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Unknown Title",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "21 February 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-3-2-14"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9809",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Unknown Title"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions cattle veterinary centre in Malur town. Includes names of dignitaries present at the event and unveiling of the donor's statue at the veterinary centre."
                                        }
                                      },
                                      "id" => "aspace_7b8cb156584638d9f73434d99dc024c9"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-3-2-14",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 2",
                                            "id" => "aspace_9d87e1a270a951b17d173d22d2601198",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "15",
                                            "id" => "aspace_70a4a8d3f454a5a471eb4b1b89655fe2",
                                            "parent" => "aspace_9d87e1a270a951b17d173d22d2601198",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Mandya District Mahajans"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/83",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/514c2604-eba0-46c8-a5e0-4001ce12af0a/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Mandya District Mahajans",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "25 February 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-3-2-15"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9810",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Mandya District Mahajans"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions Coleman's contribution in setting up of Coffee Research Station at Balehonnur and Visvesvaraya canal in Mandya."
                                        }
                                      },
                                      "id" => "aspace_1bf8afb0411e2b67d01a8b317d452589"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-3-2-15",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 2",
                                            "id" => "aspace_9d4172dededc7d512b1b6a594f299a5a",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "16",
                                            "id" => "aspace_f051e7923a2f69f1a78af364acfd8fc4",
                                            "parent" => "aspace_9d4172dededc7d512b1b6a594f299a5a",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Village Panchayat, Bidadi, Ramanagaram Taluk"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/84",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/a41667dd-4661-4868-a190-9a72c31c2869/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Village Panchayat, Bidadi, Ramanagaram Taluk",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "10 March 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-1-3-2-16"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9811",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Village Panchayat, Bidadi, Ramanagaram Taluk"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions Coleman's contribution in setting up a Veterinary Department in the taluk."
                                        }
                                      },
                                      "id" => "aspace_c6c624c519a6dee149a3eb8725d8a623"
                                    }
                                  },
                                  "id" => "aspace_MS-012-1-3-2-16",
                                  "level" => "file"
                                }
                              ],
                              "did" => %{
                                "content" => %{
                                  "container" => %{
                                    "content" => "MS-012 Box 2",
                                    "id" => "aspace_b1a51b31ee472a7bd14960955e76e817",
                                    "label" => "Mixed Materials",
                                    "type" => "box"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-1-3"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9794",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" => "Sub-Series 3: Tributes"
                                  }
                                }
                              }
                            },
                            "id" => "aspace_MS-012-1-3",
                            "level" => "subseries"
                          }
                        ],
                        "did" => %{
                          "content" => %{
                            "container" => [
                              %{
                                "content" => "MS-012 Box 1",
                                "id" => "aspace_c4d214723cd18b91f1bd6389a47bb823",
                                "label" => "Mixed Materials",
                                "type" => "box"
                              },
                              %{
                                "content" => "MS-012 Box 2",
                                "id" => "aspace_70bcf7a446f116e2989162348f8d02c1",
                                "label" => "Mixed Materials",
                                "type" => "box"
                              }
                            ],
                            "unitid" => [
                              %{"content" => "MS-012-1"},
                              %{
                                "content" => "/repositories/2/archival_objects/9726",
                                "type" => "aspace_uri"
                              }
                            ],
                            "unittitle" => %{
                              "content" => "Series 1: Correspondence"
                            }
                          }
                        }
                      },
                      "id" => "aspace_MS-012-1",
                      "level" => "series"
                    },
                    %{
                      "content" => %{
                        "c" => [
                          %{
                            "content" => %{
                              "did" => %{
                                "content" => %{
                                  "container" => [
                                    %{
                                      "content" => "MS-012 Box 3",
                                      "id" => "aspace_d1a541e7c76da476bf606eb97245e07b",
                                      "label" => "Mixed Materials",
                                      "type" => "box"
                                    },
                                    %{
                                      "content" => "1",
                                      "id" => "aspace_89a94248612a30b776a0ef049ec4b92c",
                                      "parent" => "aspace_d1a541e7c76da476bf606eb97245e07b",
                                      "type" => "folder"
                                    }
                                  ],
                                  "unitdate" => %{
                                    "content" => "Undated",
                                    "datechar" => "creation"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-2-0-3-1"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9813",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" =>
                                      "Reflections on work as mycologist and entomologist to Government of Mysore in early 20th century, and life in India"
                                  }
                                }
                              },
                              "scopecontent" => %{
                                "content" => %{
                                  "head" => %{"content" => "Scope and Contents"},
                                  "p" => %{
                                    "content" =>
                                      "Handwritten document by Coleman detailing his life and work in India."
                                  }
                                },
                                "id" => "aspace_f9ef49621f53d48bc8f6528e097dcb32"
                              }
                            },
                            "id" => "aspace_MS-012-2-0-3-1",
                            "level" => "file"
                          },
                          %{
                            "content" => %{
                              "did" => %{
                                "content" => %{
                                  "container" => [
                                    %{
                                      "content" => "MS-012 Box 3",
                                      "id" => "aspace_e3dccfdecf3c70fed5a3241b5ba5a852",
                                      "label" => "Mixed Materials",
                                      "type" => "box"
                                    },
                                    %{
                                      "content" => "2",
                                      "id" => "aspace_85570281e0ce08869584d79d004624c0",
                                      "parent" => "aspace_e3dccfdecf3c70fed5a3241b5ba5a852",
                                      "type" => "folder"
                                    }
                                  ],
                                  "daogrp" => %{
                                    "content" => %{
                                      "daodesc" => %{
                                        "content" => %{
                                          "p" => %{
                                            "content" =>
                                              "Cattle in the Indian agricultural economy"
                                          }
                                        }
                                      },
                                      "daoloc" => [
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/handle/42412/86",
                                          "xlink:type" => "locator"
                                        },
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/bitstreams/bc983900-bee9-4fe9-b920-3b65d76be4d3/download",
                                          "xlink:type" => "locator"
                                        }
                                      ]
                                    },
                                    "xlink:title" => "Cattle in the Indian agricultural economy",
                                    "xlink:type" => "extended"
                                  },
                                  "unitdate" => %{
                                    "content" => "Undated",
                                    "datechar" => "creation"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-2-0-3-2"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9814",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" => "Cattle in the Indian agricultural economy"
                                  }
                                }
                              },
                              "scopecontent" => %{
                                "content" => %{
                                  "head" => %{"content" => "Scope and Contents"},
                                  "p" => %{
                                    "content" =>
                                      "Handwritten document by Coleman on the various ways cattle is used in farming in the Mysore state."
                                  }
                                },
                                "id" => "aspace_608c4c64dc6d2d27dd5d623dfd94be51"
                              }
                            },
                            "id" => "aspace_MS-012-2-0-3-2",
                            "level" => "file"
                          },
                          %{
                            "content" => %{
                              "did" => %{
                                "content" => %{
                                  "container" => [
                                    %{
                                      "content" => "MS-012 Box 3",
                                      "id" => "aspace_40ad33df17739f4d847a7168892e5433",
                                      "label" => "Mixed Materials",
                                      "type" => "box"
                                    },
                                    %{
                                      "content" => "3",
                                      "id" => "aspace_6de92e45e8bc9ef5e303774080211403",
                                      "parent" => "aspace_40ad33df17739f4d847a7168892e5433",
                                      "type" => "folder"
                                    }
                                  ],
                                  "daogrp" => %{
                                    "content" => %{
                                      "daodesc" => %{
                                        "content" => %{
                                          "p" => %{
                                            "content" =>
                                              "Reflections on visit to India in 1953-1954"
                                          }
                                        }
                                      },
                                      "daoloc" => [
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/handle/42412/87",
                                          "xlink:type" => "locator"
                                        },
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/bitstreams/a80c53de-3a06-4ed7-a012-b064e3cbbe65/download",
                                          "xlink:type" => "locator"
                                        }
                                      ]
                                    },
                                    "xlink:title" =>
                                      " Reflections on visit to India in 1953-1954",
                                    "xlink:type" => "extended"
                                  },
                                  "unitdate" => %{
                                    "content" => "Undated",
                                    "datechar" => "creation"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-2-0-3-3"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9815",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" => "Reflections on visit to India in 1953-1954"
                                  }
                                }
                              },
                              "scopecontent" => %{
                                "content" => %{
                                  "head" => %{"content" => "Scope and Contents"},
                                  "p" => %{
                                    "content" =>
                                      "Handwritten document by Coleman commenting upon 'western know-how' in Indian agriculture."
                                  }
                                },
                                "id" => "aspace_5f9f2b71d300a97a360e32a3be016cd4"
                              }
                            },
                            "id" => "aspace_MS-012-2-0-3-3",
                            "level" => "file"
                          },
                          %{
                            "content" => %{
                              "did" => %{
                                "content" => %{
                                  "container" => [
                                    %{
                                      "content" => "MS-012 Box 3",
                                      "id" => "aspace_d6c75da44d9fe5db1ce49614e54b3cf9",
                                      "label" => "Mixed Materials",
                                      "type" => "box"
                                    },
                                    %{
                                      "content" => "4",
                                      "id" => "aspace_6761905cfcae09e3a98ad03f66e67d26",
                                      "parent" => "aspace_d6c75da44d9fe5db1ce49614e54b3cf9",
                                      "type" => "folder"
                                    }
                                  ],
                                  "daogrp" => %{
                                    "content" => %{
                                      "daodesc" => %{
                                        "content" => %{
                                          "p" => %{
                                            "content" => "The South Indian Village"
                                          }
                                        }
                                      },
                                      "daoloc" => [
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/handle/42412/88",
                                          "xlink:type" => "locator"
                                        },
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/bitstreams/94b2b000-757c-461e-b0ba-124d14aabf5a/download",
                                          "xlink:type" => "locator"
                                        }
                                      ]
                                    },
                                    "xlink:title" => "The South Indian Village",
                                    "xlink:type" => "extended"
                                  },
                                  "unitdate" => %{
                                    "content" => "Undated",
                                    "datechar" => "creation"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-2-0-3-4"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9816",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" => "The South Indian Village"
                                  }
                                }
                              },
                              "scopecontent" => %{
                                "content" => %{
                                  "head" => %{"content" => "Scope and Contents"},
                                  "p" => %{
                                    "content" =>
                                      "Typewritten note on the 'South Indian Village' with minor handwritten corrections. Includes two handwritten critiques and analyses of the piece."
                                  }
                                },
                                "id" => "aspace_5d760a1216dbbf8663b9df500ef35e94"
                              }
                            },
                            "id" => "aspace_MS-012-2-0-3-4",
                            "level" => "file"
                          }
                        ],
                        "did" => %{
                          "content" => %{
                            "container" => %{
                              "content" => "MS-012 Box 3",
                              "id" => "aspace_17d916188cd386fa10ac173528e31a98",
                              "label" => "Mixed Materials",
                              "type" => "box"
                            },
                            "unitid" => [
                              %{"content" => "MS-012-2"},
                              %{
                                "content" => "/repositories/2/archival_objects/9812",
                                "type" => "aspace_uri"
                              }
                            ],
                            "unittitle" => %{"content" => "Series 2: Writings"}
                          }
                        }
                      },
                      "id" => "aspace_MS-012-2",
                      "level" => "series"
                    },
                    %{
                      "content" => %{
                        "c" => [
                          %{
                            "content" => %{
                              "did" => %{
                                "content" => %{
                                  "container" => [
                                    %{
                                      "content" => "MS-012 Box 3",
                                      "id" => "aspace_126ba2d0c80af334016b818adc7f4504",
                                      "label" => "Mixed Materials",
                                      "type" => "box"
                                    },
                                    %{
                                      "content" => "5",
                                      "id" => "aspace_7dc549dd28f0d6cbfddae4e1754d2265",
                                      "parent" => "aspace_126ba2d0c80af334016b818adc7f4504",
                                      "type" => "folder"
                                    }
                                  ],
                                  "daogrp" => %{
                                    "content" => %{
                                      "daodesc" => %{
                                        "content" => %{
                                          "p" => %{
                                            "content" =>
                                              "India Director of Agriculture visits Danvers"
                                          }
                                        }
                                      },
                                      "daoloc" => [
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/handle/42412/89",
                                          "xlink:type" => "locator"
                                        },
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/bitstreams/c1db727f-aa59-4fe5-8a7a-12b4ba3a804e/download",
                                          "xlink:type" => "locator"
                                        }
                                      ]
                                    },
                                    "xlink:title" =>
                                      "India Director of Agriculture visits Danvers",
                                    "xlink:type" => "extended"
                                  },
                                  "unitdate" => %{
                                    "content" => "28 September 1923",
                                    "datechar" => "creation"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-3-0-3-5"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9818",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" => "India Director of Agriculture visits Danvers"
                                  }
                                }
                              },
                              "scopecontent" => %{
                                "content" => %{
                                  "head" => %{"content" => "Scope and Contents"},
                                  "p" => %{
                                    "content" =>
                                      "Title: \"India Director of Agriculture visits Danvers\". Sub-title: \"Dr LC Coleman has made great progress in crop development during 15 years of experimental service.\" Handwritten note at bottom: \"Salem Sept 28, 1923\""
                                  }
                                },
                                "id" => "aspace_92c550c122fe155b9d5beb001fc5e9c2"
                              }
                            },
                            "id" => "aspace_MS-012-3-0-3-5",
                            "level" => "file"
                          },
                          %{
                            "content" => %{
                              "did" => %{
                                "content" => %{
                                  "container" => [
                                    %{
                                      "content" => "MS-012 Box 3",
                                      "id" => "aspace_5ff6960db3c896881997ac022d8514fe",
                                      "label" => "Mixed Materials",
                                      "type" => "box"
                                    },
                                    %{
                                      "content" => "6",
                                      "id" => "aspace_ac149ec0d0a629bae8a549cb53c98a00",
                                      "parent" => "aspace_5ff6960db3c896881997ac022d8514fe",
                                      "type" => "folder"
                                    }
                                  ],
                                  "daogrp" => %{
                                    "content" => %{
                                      "daodesc" => %{
                                        "content" => %{
                                          "p" => %{
                                            "content" =>
                                              "Dr Leslie Coleman -- Services to Mysore Agriculture"
                                          }
                                        }
                                      },
                                      "daoloc" => [
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/handle/42412/90",
                                          "xlink:type" => "locator"
                                        },
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/bitstreams/9926d781-a169-416c-8fde-26ce18d17c07/download",
                                          "xlink:type" => "locator"
                                        }
                                      ]
                                    },
                                    "xlink:title" =>
                                      "Dr Leslie Coleman -- Services to Mysore Agriculture",
                                    "xlink:type" => "extended"
                                  },
                                  "unitdate" => %{
                                    "content" => "ca 1933",
                                    "datechar" => "creation"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-3-0-3-6"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9819",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" =>
                                      "Dr Leslie Coleman -- Services to Mysore Agriculture"
                                  }
                                }
                              },
                              "scopecontent" => %{
                                "content" => %{
                                  "head" => %{"content" => "Scope and Contents"},
                                  "p" => %{
                                    "content" =>
                                      "Title: \" Dr. Leslie Coleman. Subtitle: \" Services to Mysore Agriculture.\""
                                  }
                                },
                                "id" => "aspace_ea5d2b9d11808cd60cc9b86e3ce7c434"
                              }
                            },
                            "id" => "aspace_MS-012-3-0-3-6",
                            "level" => "file"
                          },
                          %{
                            "content" => %{
                              "did" => %{
                                "content" => %{
                                  "container" => [
                                    %{
                                      "content" => "MS-012 Box 3",
                                      "id" => "aspace_e849eaa66534a75ef8ea1d53f0db1b16",
                                      "label" => "Mixed Materials",
                                      "type" => "box"
                                    },
                                    %{
                                      "content" => "7",
                                      "id" => "aspace_111ebe3937a64f335772821ba75b7856",
                                      "parent" => "aspace_e849eaa66534a75ef8ea1d53f0db1b16",
                                      "type" => "folder"
                                    }
                                  ],
                                  "daogrp" => %{
                                    "content" => %{
                                      "daodesc" => %{
                                        "content" => %{
                                          "p" => %{
                                            "content" =>
                                              "An Investiture Ceremony, held at the Residency"
                                          }
                                        }
                                      },
                                      "daoloc" => [
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/handle/42412/91",
                                          "xlink:type" => "locator"
                                        },
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/bitstreams/6550c5a2-e597-49cd-b932-6ca845baf8c3/download",
                                          "xlink:type" => "locator"
                                        }
                                      ]
                                    },
                                    "xlink:title" =>
                                      "An Investiture Ceremony, held at the Residency",
                                    "xlink:type" => "extended"
                                  },
                                  "unitdate" => %{
                                    "content" => "ca 1933",
                                    "datechar" => "creation"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-3-0-3-7"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9820",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" => "An Investiture Ceremony, held at the Residency"
                                  }
                                }
                              },
                              "scopecontent" => %{
                                "content" => %{
                                  "head" => %{"content" => "Scope and Contents"},
                                  "p" => %{
                                    "content" =>
                                      "Coleman honoured by the Resident in Mysore at an Institute Ceremony, in recognition of his work of agricultural development of Mysore State, discovery of the cause of 'Ring' disease in potatoes in India, control of disease in sericulture, design of a plough adopted across India, and other work."
                                  }
                                },
                                "id" => "aspace_e2fd52b7de5894d4c46a5540838455fb"
                              }
                            },
                            "id" => "aspace_MS-012-3-0-3-7",
                            "level" => "file"
                          },
                          %{
                            "content" => %{
                              "did" => %{
                                "content" => %{
                                  "container" => [
                                    %{
                                      "content" => "MS-012 Box 3",
                                      "id" => "aspace_56bb941263d6d2b2d1f837641b7742e0",
                                      "label" => "Mixed Materials",
                                      "type" => "box"
                                    },
                                    %{
                                      "content" => "8",
                                      "id" => "aspace_4781b0680e16921e78119ec48e5a9410",
                                      "parent" => "aspace_56bb941263d6d2b2d1f837641b7742e0",
                                      "type" => "folder"
                                    }
                                  ],
                                  "daogrp" => %{
                                    "content" => %{
                                      "daodesc" => %{
                                        "content" => %{
                                          "p" => %{
                                            "content" => "A Delightful Ceremony"
                                          }
                                        }
                                      },
                                      "daoloc" => [
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/handle/42412/92",
                                          "xlink:type" => "locator"
                                        },
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/bitstreams/7f626429-7a7b-4743-b268-cc2177b8822c/download",
                                          "xlink:type" => "locator"
                                        }
                                      ]
                                    },
                                    "xlink:title" => "A Delightful Ceremony",
                                    "xlink:type" => "extended"
                                  },
                                  "unitdate" => %{
                                    "content" => "Undated",
                                    "datechar" => "creation"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-3-0-3-8"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9821",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" => "A Delightful Ceremony"
                                  }
                                }
                              },
                              "scopecontent" => %{
                                "content" => %{
                                  "head" => %{"content" => "Scope and Contents"},
                                  "p" => %{
                                    "content" =>
                                      "Title: \"A Delightful Ceremony\". Sub-title: \"Dr Coleman entertained on his recent honour\""
                                  }
                                },
                                "id" => "aspace_bffe25aad78806d1ffacbffcca815fa9"
                              }
                            },
                            "id" => "aspace_MS-012-3-0-3-8",
                            "level" => "file"
                          }
                        ],
                        "did" => %{
                          "content" => %{
                            "container" => %{
                              "content" => "MS-012 Box 3",
                              "id" => "aspace_c24a03390cdce84857cb904859ebf239",
                              "label" => "Mixed Materials",
                              "type" => "box"
                            },
                            "unitid" => [
                              %{"content" => "MS-012-3"},
                              %{
                                "content" => "/repositories/2/archival_objects/9817",
                                "type" => "aspace_uri"
                              }
                            ],
                            "unittitle" => %{
                              "content" => "Series 3: Media coverage"
                            }
                          }
                        }
                      },
                      "id" => "aspace_MS-012-3",
                      "level" => "series"
                    },
                    %{
                      "content" => %{
                        "c" => [
                          %{
                            "content" => %{
                              "did" => %{
                                "content" => %{
                                  "container" => [
                                    %{
                                      "content" => "MS-012 Box 3",
                                      "id" => "aspace_027f980042e789ee77002422fb2bb78c",
                                      "label" => "Mixed Materials",
                                      "type" => "box"
                                    },
                                    %{
                                      "content" => "9",
                                      "id" => "aspace_252a147a6564cad843a02e73f213d629",
                                      "parent" => "aspace_027f980042e789ee77002422fb2bb78c",
                                      "type" => "folder"
                                    }
                                  ],
                                  "daogrp" => %{
                                    "content" => %{
                                      "daodesc" => %{
                                        "content" => %{
                                          "p" => %{
                                            "content" =>
                                              "The Ring Disease of Potatoes (A Preliminary Report)"
                                          }
                                        }
                                      },
                                      "daoloc" => [
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/handle/42412/93",
                                          "xlink:type" => "locator"
                                        },
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/bitstreams/b41cff99-c303-4f9a-96a1-a65fee8bdc78/download",
                                          "xlink:type" => "locator"
                                        }
                                      ]
                                    },
                                    "xlink:title" =>
                                      "The Ring Disease of Potatoes (A Preliminary Report)",
                                    "xlink:type" => "extended"
                                  },
                                  "unitdate" => %{
                                    "content" => "1909",
                                    "datechar" => "creation"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-4-0-3-9"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9823",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" =>
                                      "The Ring Disease of Potatoes (A Preliminary Report)"
                                  }
                                }
                              },
                              "scopecontent" => %{
                                "content" => %{
                                  "head" => %{"content" => "Scope and Contents"},
                                  "p" => %{
                                    "content" =>
                                      "The Ring Disease of Potatoes (A Preliminary Report) -- Mycological Series. Bulletin No. 1. Department of Agriculture, Mysore State. Printed at the Government Press, Bangalore."
                                  }
                                },
                                "id" => "aspace_808c2ceb6fe608187087552da834cb75"
                              }
                            },
                            "id" => "aspace_MS-012-4-0-3-9",
                            "level" => "file"
                          },
                          %{
                            "content" => %{
                              "did" => %{
                                "content" => %{
                                  "container" => [
                                    %{
                                      "content" => "MS-012 Box 3",
                                      "id" => "aspace_d93e45a6ce3bee4ef3eae3342dbf03b0",
                                      "label" => "Mixed Materials",
                                      "type" => "box"
                                    },
                                    %{
                                      "content" => "10",
                                      "id" => "aspace_3fb6e169e94f57cf137dd21085907c04",
                                      "parent" => "aspace_d93e45a6ce3bee4ef3eae3342dbf03b0",
                                      "type" => "folder"
                                    }
                                  ],
                                  "daogrp" => %{
                                    "content" => %{
                                      "daodesc" => %{
                                        "content" => %{
                                          "p" => %{
                                            "content" =>
                                              "The Rice Grasshopper (Hieroglyphus banian, Fabr.)"
                                          }
                                        }
                                      },
                                      "daoloc" => [
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/handle/42412/94",
                                          "xlink:type" => "locator"
                                        },
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/bitstreams/a23997ad-ee8b-448a-b9ba-b5d3e3a1d697/download",
                                          "xlink:type" => "locator"
                                        }
                                      ]
                                    },
                                    "xlink:title" =>
                                      "The Rice Grasshopper (Hieroglyphus banian, Fabr.)",
                                    "xlink:type" => "extended"
                                  },
                                  "unitdate" => %{
                                    "content" => "1911",
                                    "datechar" => "creation"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-4-0-3-10"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9824",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" =>
                                      "The Rice Grasshopper (Hieroglyphus banian, Fabr.)"
                                  }
                                }
                              },
                              "scopecontent" => %{
                                "content" => %{
                                  "head" => %{"content" => "Scope and Contents"},
                                  "p" => %{
                                    "content" =>
                                      "The Rice Grasshopper (Hieroglyphus banian, Fabr.). Entomological Series. Bulletin No. 1. Department of Agriculture, Mysore State. Assisted by K Kunhi Kannan, M.A., Assistant Entomologist. Printed at the Government Press, Bangalore."
                                  }
                                },
                                "id" => "aspace_0a5531d671067678ee963e10224eb92d"
                              }
                            },
                            "id" => "aspace_MS-012-4-0-3-10",
                            "level" => "file"
                          },
                          %{
                            "content" => %{
                              "did" => %{
                                "content" => %{
                                  "container" => [
                                    %{
                                      "content" => "MS-012 Box 3",
                                      "id" => "aspace_fecc565878715aa5a1e14410bafaaf24",
                                      "label" => "Mixed Materials",
                                      "type" => "box"
                                    },
                                    %{
                                      "content" => "11",
                                      "id" => "aspace_2f587bcff73493ebbaafb3c9448a3ad9",
                                      "parent" => "aspace_fecc565878715aa5a1e14410bafaaf24",
                                      "type" => "folder"
                                    }
                                  ],
                                  "daogrp" => %{
                                    "content" => %{
                                      "daodesc" => %{
                                        "content" => %{
                                          "p" => %{
                                            "content" =>
                                              "Experiments on Paddy Cultivation during the years 1909-11"
                                          }
                                        }
                                      },
                                      "daoloc" => [
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/handle/42412/95",
                                          "xlink:type" => "locator"
                                        },
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/bitstreams/c35aa08f-08bd-4a39-80bb-2dfb9f1ea39d/download",
                                          "xlink:type" => "locator"
                                        }
                                      ]
                                    },
                                    "xlink:title" =>
                                      " Experiments on Paddy Cultivation during the years 1909-11",
                                    "xlink:type" => "extended"
                                  },
                                  "unitdate" => %{
                                    "content" => "1912",
                                    "datechar" => "creation"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-4-0-3-11"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9825",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" =>
                                      "Experiments on Paddy Cultivation during the years 1909-11"
                                  }
                                }
                              },
                              "scopecontent" => %{
                                "content" => %{
                                  "head" => %{"content" => "Scope and Contents"},
                                  "p" => %{
                                    "content" =>
                                      "Experiments on Paddy Cultivation during the years 1909-11. General Series. Bulletin No. 2. Department of Agriculture, Mysore State. Written by Coleman and DG Ramachandra Rao, Farmer Manager. Printed at the Government Press, Bangalore. Two copies."
                                  }
                                },
                                "id" => "aspace_4c2f656aa266c22819b32449ba829c86"
                              }
                            },
                            "id" => "aspace_MS-012-4-0-3-11",
                            "level" => "file"
                          },
                          %{
                            "content" => %{
                              "did" => %{
                                "content" => %{
                                  "container" => [
                                    %{
                                      "content" => "MS-012 Box 3",
                                      "id" => "aspace_69d11111be74f2bf4f6fb3df99d8661e",
                                      "label" => "Mixed Materials",
                                      "type" => "box"
                                    },
                                    %{
                                      "content" => "12",
                                      "id" => "aspace_1dac4caa3d47f9cfc60467025e190471",
                                      "parent" => "aspace_69d11111be74f2bf4f6fb3df99d8661e",
                                      "type" => "folder"
                                    }
                                  ],
                                  "daogrp" => %{
                                    "content" => %{
                                      "daodesc" => %{
                                        "content" => %{
                                          "p" => %{
                                            "content" =>
                                              "The Dead Arm Disease of Grapes in Ontario - A Preliminary Study"
                                          }
                                        }
                                      },
                                      "daoloc" => [
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/handle/42412/96",
                                          "xlink:type" => "locator"
                                        },
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/bitstreams/fdd4a675-b88b-4aee-b8b3-dee69a7dffdb/download",
                                          "xlink:type" => "locator"
                                        }
                                      ]
                                    },
                                    "xlink:title" =>
                                      "The Dead Arm Disease of Grapes in Ontario - A Preliminary Study",
                                    "xlink:type" => "extended"
                                  },
                                  "unitdate" => %{
                                    "content" => "1928",
                                    "datechar" => "creation"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-4-0-3-12"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9826",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" =>
                                      "The Dead Arm Disease of Grapes in Ontario - A Preliminary Study"
                                  }
                                }
                              },
                              "scopecontent" => %{
                                "content" => %{
                                  "head" => %{"content" => "Scope and Contents"},
                                  "p" => %{
                                    "content" =>
                                      "The Dead Arm Disease of Grapes in Ontario - A Preliminary Study. Reprinted from Scientific Agriculture, Vol. VIII., No. 5, January 1928, for the Ontario Department of Agriculture, Horticultural Experiment Station, Vineland, Ontario."
                                  }
                                },
                                "id" => "aspace_c30b3068e116f89fb8eaf6b101c1d1d2"
                              }
                            },
                            "id" => "aspace_MS-012-4-0-3-12",
                            "level" => "file"
                          },
                          %{
                            "content" => %{
                              "did" => %{
                                "content" => %{
                                  "container" => [
                                    %{
                                      "content" => "MS-012 Box 3",
                                      "id" => "aspace_d512450bb2f0da2b288205b769865907",
                                      "label" => "Mixed Materials",
                                      "type" => "box"
                                    },
                                    %{
                                      "content" => "13",
                                      "id" => "aspace_e0a71543eb7846ad427a8b280afa4c10",
                                      "parent" => "aspace_d512450bb2f0da2b288205b769865907",
                                      "type" => "folder"
                                    }
                                  ],
                                  "daogrp" => %{
                                    "content" => %{
                                      "daodesc" => %{
                                        "content" => %{
                                          "p" => %{
                                            "content" =>
                                              "Report on the coffee berry borer, Stephanoderes Hampei, Ferr in Java"
                                          }
                                        }
                                      },
                                      "daoloc" => [
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/handle/42412/97",
                                          "xlink:type" => "locator"
                                        },
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/bitstreams/9b51c748-13c0-4be7-9393-ddef9a661b76/download",
                                          "xlink:type" => "locator"
                                        }
                                      ]
                                    },
                                    "xlink:title" =>
                                      "Report on the coffee berry borer, Stephanoderes Hampei, Ferr in Java",
                                    "xlink:type" => "extended"
                                  },
                                  "unitdate" => %{
                                    "content" => "1931",
                                    "datechar" => "creation"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-4-0-3-13"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9827",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" =>
                                      "Report on the coffee berry borer, Stephanoderes Hampei, Ferr in Java"
                                  }
                                }
                              },
                              "scopecontent" => %{
                                "content" => %{
                                  "head" => %{"content" => "Scope and Contents"},
                                  "p" => %{
                                    "content" =>
                                      "Report on the coffee berry borer, Stephanoderes Hampei, Ferr in Java. General Series - Bulletin No. 16. Department of Agriculture, Mysore State. Printed at the Government Press, Bangalore."
                                  }
                                },
                                "id" => "aspace_4de8b06dc06196a9076d9fdd7fc6f10e"
                              }
                            },
                            "id" => "aspace_MS-012-4-0-3-13",
                            "level" => "file"
                          },
                          %{
                            "content" => %{
                              "did" => %{
                                "content" => %{
                                  "container" => [
                                    %{
                                      "content" => "MS-012 Box 3",
                                      "id" => "aspace_2f925dedcfc978893c9b47b7fad3fee2",
                                      "label" => "Mixed Materials",
                                      "type" => "box"
                                    },
                                    %{
                                      "content" => "14",
                                      "id" => "aspace_3aa2f5b1cc882997f06f3e2503241965",
                                      "parent" => "aspace_2f925dedcfc978893c9b47b7fad3fee2",
                                      "type" => "folder"
                                    }
                                  ],
                                  "daogrp" => %{
                                    "content" => %{
                                      "daodesc" => %{
                                        "content" => %{
                                          "p" => %{
                                            "content" =>
                                              "Chromosome abnormalities in an individual of chorthippus longicornis (acrididae)"
                                          }
                                        }
                                      },
                                      "daoloc" => [
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/handle/42412/98",
                                          "xlink:type" => "locator"
                                        },
                                        %{
                                          "content" => nil,
                                          "xlink:href" =>
                                            "https://collections.archives.ncbs.res.in/bitstreams/738426c2-0b45-47e3-abc7-9a164cfedde4/download",
                                          "xlink:type" => "locator"
                                        }
                                      ]
                                    },
                                    "xlink:title" =>
                                      "Chromosome abnormalities in an individual of chorthippus longicornis (acrididae)",
                                    "xlink:type" => "extended"
                                  },
                                  "unitdate" => %{
                                    "content" => "1947",
                                    "datechar" => "creation"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-4-0-3-14"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9828",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" =>
                                      "Chromosome abnormalities in an individual of chorthippus longicornis (acrididae)"
                                  }
                                }
                              },
                              "scopecontent" => %{
                                "content" => %{
                                  "head" => %{"content" => "Scope and Contents"},
                                  "p" => %{
                                    "content" =>
                                      "Chromosome abnormalities in an individual of chorthippus longicornis (acrididae). Reprinted from Genetics 32: 435-447. Two copies."
                                  }
                                },
                                "id" => "aspace_91b98da5f41c79766162b64c5e3cf83d"
                              }
                            },
                            "id" => "aspace_MS-012-4-0-3-14",
                            "level" => "file"
                          }
                        ],
                        "did" => %{
                          "content" => %{
                            "container" => %{
                              "content" => "MS-012 Box 3",
                              "id" => "aspace_0687b8e7db762542a806aa83a7b7b18e",
                              "label" => "Mixed Materials",
                              "type" => "box"
                            },
                            "unitid" => [
                              %{"content" => "MS-012-4"},
                              %{
                                "content" => "/repositories/2/archival_objects/9822",
                                "type" => "aspace_uri"
                              }
                            ],
                            "unittitle" => %{
                              "content" => "Series 4: Research reprints"
                            }
                          }
                        }
                      },
                      "id" => "aspace_MS-012-4",
                      "level" => "series"
                    },
                    %{
                      "content" => %{
                        "c" => [
                          %{
                            "content" => %{
                              "c" => [
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "Oversized 6",
                                            "id" => "aspace_6d345063c4a6ddf290d81e6ce3efb84b",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "1",
                                            "id" => "aspace_8a9e1b31d11a093f83e4be7a53716549",
                                            "parent" => "aspace_6d345063c4a6ddf290d81e6ce3efb84b",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Family photo album -- travels in south India, north India, Europe and others"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/99",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/4033e39d-727e-4f7d-9e40-b63534af78e6/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Family photo album -- travels in south India, north India, Europe and others",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "1913, ca 1928-1931",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-1-OS-6-1"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9831",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Family photo album -- travels in south India, north India, Europe and others"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Oversize family photo album with over 100 photographs stuck on sheets. Some loose sheets. Includes: Mysore Dasara procession, Chamundi, Halebid, Belur, Biligiriranga Hills (B.R. Hills), Sivasamudram, Mysore Darbar Silver Jubilee, Lalitha Mahal, Carlton House in Bangalore, Srirangapatna, Sravana Belagola Jain Shrine, Bangalore race course, Stupa in Benares, Darjeeling, Qutab Minar in Delhi, Doddaballapur, Mandya, Mysore Zoo, Bachelors' Ball in Bangalore in 1913, Photos from 'Pier 48' in likely European or English landscape with unknown family/friends, Photos from unknown (likely) East Asian country and shipping docks, unknown hilly landscape (likely in India)"
                                        }
                                      },
                                      "id" => "aspace_c01c41357717380e12e45d9214d3fed4"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-1-OS-6-1",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 3",
                                            "id" => "aspace_6b0714fec0bda6358b59952b1fb0dda9",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "15",
                                            "id" => "aspace_7ba3b52b586780975606f263e587d452",
                                            "parent" => "aspace_6b0714fec0bda6358b59952b1fb0dda9",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Family photo album, loose sheets -- Bangalore home, Nilgiris, Mysore -- Part 1 of 4"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/100",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/702aea1b-9686-4d56-bdf0-f9b2c6dcbc76/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Family photo album, loose sheets -- Bangalore home, Nilgiris, Mysore -- Part 1 of 4",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "ca 1924-1929",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-1-3-15"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9832",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Family photo album, loose sheets -- Bangalore home, Nilgiris, Mysore -- Part 1 of 4"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Appears to cover 1924-1929. Includes house on Ali Asker Road; Attikan estate; Rayankere; Palace dairy\" -- Part 1: Photos from Ooty, Wellington; Lumbani Dance; Wedding feast of sister of Doraswamy; Phebe R with dogs; Mysore dasara; Kodanad tea estate; Toda home; Keladi; Jog falls."
                                        }
                                      },
                                      "id" => "aspace_dff843f5a80ae053e4ea60a029216bdc"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-1-3-15",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 3",
                                            "id" => "aspace_29d4ca6b5224aa87548ac3090fb387c4",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "16",
                                            "id" => "aspace_7779ab88eea01c9a7d881e132e4828a4",
                                            "parent" => "aspace_29d4ca6b5224aa87548ac3090fb387c4",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Family photo album, loose sheets -- Bangalore home, Nilgiris, Mysore -- Part 2 of 4"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/101",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/2085b9e4-6045-487d-972a-102817637596/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Family photo album, loose sheets -- Bangalore home, Nilgiris, Mysore -- Part 2 of 4",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "ca 1924-1929",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-1-3-16"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9833",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Family photo album, loose sheets -- Bangalore home, Nilgiris, Mysore -- Part 2 of 4"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "In envelope titled \"Shyamal 2019-09-26. appears to cover 1924-1929. Includes house on Ali Asker Road; Attikan estate; Rayankere; Palace dairy\" -- Part 2: Lambanis; Marikanive 1925; Snake charmer; Band; Board of Agriculture meeting 1924; Century Club; Hudugur; 7 Ali Asker Road House in Bangalore."
                                        }
                                      },
                                      "id" => "aspace_b3777efc6a903e761ded9fd3ce26d5e7"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-1-3-16",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 3",
                                            "id" => "aspace_3f8bb710db218b702e8495ff8f65d4eb",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "17",
                                            "id" => "aspace_d168a579f3fd89f29c1676cd4f366b32",
                                            "parent" => "aspace_3f8bb710db218b702e8495ff8f65d4eb",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Family photo album, loose sheets -- Bangalore home, Nilgiris, Mysore -- Part 3 of 4"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/102",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/18fab348-3000-4f20-a49a-f384ade9ef64/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Family photo album, loose sheets -- Bangalore home, Nilgiris, Mysore -- Part 3 of 4",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "ca 1924-1929",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-1-3-17"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9834",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Family photo album, loose sheets -- Bangalore home, Nilgiris, Mysore -- Part 3 of 4"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "In envelope titled \"Shyamal 2019-09-26. appears to cover 1924-1929. Includes house on Ali Asker Road; Attikan estate; Rayankere; Palace dairy\" -- Part 3: Somnathpur temple; \"LCC and Jock\" - dog; Mysore dasara elephant \"Salaam!!\"; Mysore Palace lighting; Chamundi Hill temple; Phebe at Rayankere in June 1924; wedding of daughter of third princess, Mysore, June 1924;"
                                        }
                                      },
                                      "id" => "aspace_4ccd5ad279fabdc5343ac0d9ee5fe4e3"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-1-3-17",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 3",
                                            "id" => "aspace_a772da3002248562efc43074e75db780",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "18",
                                            "id" => "aspace_a373df1b6c7c215752e809abec567883",
                                            "parent" => "aspace_a772da3002248562efc43074e75db780",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Family photo album, loose sheets -- Bangalore home, Nilgiris, Mysore -- Part 4 of 4"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/103",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/97d3a0f6-f908-489e-9317-8c2e3cf099e2/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Family photo album, loose sheets -- Bangalore home, Nilgiris, Mysore -- Part 4 of 4",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "ca 1924-1929",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-1-3-18"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9835",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Family photo album, loose sheets -- Bangalore home, Nilgiris, Mysore -- Part 4 of 4"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "In envelope titled \"Shyamal 2019-09-26. appears to cover 1924-1929. Includes house on Ali Asker Road; Attikan estate; Rayankere; Palace dairy\" -- Part 4: Single album page with family photos of Phebe, LCC, children, and family dogs."
                                        }
                                      },
                                      "id" => "aspace_27231e0401bb14e93c34d754628a8bbb"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-1-3-18",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 3",
                                            "id" => "aspace_3e988c187e19a93f45dff5c0bb0c856b",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "19",
                                            "id" => "aspace_a0ebbce000ad16083618caee63ddd749",
                                            "parent" => "aspace_3e988c187e19a93f45dff5c0bb0c856b",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Family photo album, loose sheets -- Tea gatherings, visits to hills and historic sites across Mysore, LCC's children. Part 1 of 3"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/104",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/7eb8cfa5-e25e-41c4-8411-925a70ea77af/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Family photo album, loose sheets -- Tea gatherings, visits to hills and historic sites across Mysore, LCC's children. Part 1 of 3",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "ca 1924-1928, Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-1-3-19"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9836",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Family photo album, loose sheets -- Tea gatherings, visits to hills and historic sites across Mysore, LCC's children. Part 1 of 3"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Loose sheets approx. 25 pp, over 100 photographs, mostly 2x3 inches. Includes: Sumarthpur Temple, Srirangapatna, Tipu Sultan's Summer Palace, Bazaar Scenes, Nandi, Mysore Palace Courtyard, Postcards from Egypt, Mysore Dasara (1924), Mysore Palace elephant stables, Chamundi, Photos of Livestock."
                                        }
                                      },
                                      "id" => "aspace_b9dd20fa255f4079ba4817561aa82bee"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-1-3-19",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 3",
                                            "id" => "aspace_4d2e4633d051092b22c854314a28720a",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "20",
                                            "id" => "aspace_e5e3e35e641cceccde308f87325d92c7",
                                            "parent" => "aspace_4d2e4633d051092b22c854314a28720a",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Family photo album, loose sheets -- Tea gatherings, visits to hills and historic sites across Mysore, LCC's children. Part 2 of 3"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/105",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/01b424bb-901d-4b1e-8ffa-8e9e26a7c521/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Family photo album, loose sheets -- Tea gatherings, visits to hills and historic sites across Mysore, LCC's children. Part 2 of 3",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "ca 1924-1928, Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-1-3-20"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9837",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Family photo album, loose sheets -- Tea gatherings, visits to hills and historic sites across Mysore, LCC's children. Part 2 of 3"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Loose sheets approx. 25 pp, over 100 photographs, mostly 2x3 inches. Includes: Field sites and paddy granaries, ragi field, Experimental Union Field Day, \"Tea in our Compound, 1928\", LCC on tractor, Taj Mahal and Fatehpur Sikri, LCC and Phebe playing a game on a ship, Butler's family, Coffee growing and drying processes, Attikan Pulp House, Bellagi Hills, Trekking trip to Farewell Rock, photos of LCC's children - Louisa and Leslie Jr., with Phebe and the children's caretakers/ayah."
                                        }
                                      },
                                      "id" => "aspace_9d2a587466974814cc0d2bd50573487c"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-1-3-20",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 3",
                                            "id" => "aspace_9849676e94c485fd3b7ba061403ed0e4",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "21",
                                            "id" => "aspace_8886766ce67d2e18c2fb400e8e2ea86b",
                                            "parent" => "aspace_9849676e94c485fd3b7ba061403ed0e4",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Family photo album, loose sheets -- Tea gatherings, visits to hills and historic sites across Mysore, LCC's children. Part 3 of 3"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/106",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://iiif.archives.ncbs.res.in/iiif/2/ae7b9c8d-1806-4ffb-ab7c-59f28584d6ef/full/1374,/0/default.jpg?download=true",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Family photo album, loose sheets -- Tea gatherings, visits to hills and historic sites across Mysore, LCC's children. Part 3 of 3",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "ca 1924-1928, Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-1-3-21"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9838",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Family photo album, loose sheets -- Tea gatherings, visits to hills and historic sites across Mysore, LCC's children. Part 3 of 3"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Loose sheets approx. 25 pp, over 100 photographs, mostly 2x3 inches. Includes: Photos of LCC's children - Louisa and Leslie Jr., with Phebe and the children's caretakers/ayah, street scenes, 'Scenes at Tea for the Agriculture Department, 1928'."
                                        }
                                      },
                                      "id" => "aspace_433b5cfb1255c7badfd4a7ad7f69072b"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-1-3-21",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_5b12ad06d07b792f5099b3eb34706eae",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "1",
                                            "id" => "aspace_bfcae9f646e0b2c0866c7f76fc70938b",
                                            "parent" => "aspace_5b12ad06d07b792f5099b3eb34706eae",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Mysore Sericulture Department"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/107",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/b1f27118-f8f4-4bb9-a18e-9d8c30b97ab1/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Mysore Sericulture Department",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "1925",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-1-4-1"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9839",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Mysore Sericulture Department"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Photos documenting the entire process of the sericulture department in Channapatna."
                                        }
                                      },
                                      "id" => "aspace_ae770b89d7e456771ef86e0daf550ffb"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-1-4-1",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_65a3d31875a5fd1eb16891bf9fde75bd",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "2",
                                            "id" => "aspace_069f841a81d92ca2de6af65069b970bc",
                                            "parent" => "aspace_65a3d31875a5fd1eb16891bf9fde75bd",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Family photo album, loose sheets -- Toda, Lambani, Somnathpur, Halebid, Mysore"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/108",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/3a86d0ec-3cec-4426-9793-3aedc76247ce/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Family photo album, loose sheets -- Toda, Lambani, Somnathpur, Halebid, Mysore",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-1-4-2"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9840",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Family photo album, loose sheets -- Toda, Lambani, Somnathpur, Halebid, Mysore"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Family photo album, loose sheets -- Toda, Lambani, Somnathpur, Halebid, Mysore. Photos from older black paper photo album stapled on brown sheets and envelopes. Includes sensitive colonial portraits of individuals from the Toda community, and photographs of Toda Temple."
                                        }
                                      },
                                      "id" => "aspace_5f1c4dec620a77db49aaf4270fdaafca"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-1-4-2",
                                  "level" => "file"
                                }
                              ],
                              "did" => %{
                                "content" => %{
                                  "container" => [
                                    %{
                                      "content" => "MS-012 Box 3",
                                      "id" => "aspace_46b204b257f4f87c28025882e9e94be7",
                                      "label" => "Mixed Materials",
                                      "type" => "box"
                                    },
                                    %{
                                      "content" => "MS-012 Box 4",
                                      "id" => "aspace_445c6435bc130a2fcfe257e08dde5de9",
                                      "label" => "Mixed Materials",
                                      "type" => "box"
                                    }
                                  ],
                                  "unitid" => [
                                    %{"content" => "MS-012-5-1"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9830",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" =>
                                      "Sub-Series 1: Family albums and work site albums"
                                  }
                                }
                              }
                            },
                            "id" => "aspace_MS-012-5-1",
                            "level" => "subseries"
                          },
                          %{
                            "content" => %{
                              "c" => [
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_b9197fcb3b773e886e47853302f89429",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "3",
                                            "id" => "aspace_93519685af47116397a6064a350a6a0a",
                                            "parent" => "aspace_b9197fcb3b773e886e47853302f89429",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Group photograph: Leslie C Coleman, Davison and others"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/109",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/ea67bb52-f266-4a0b-8f91-754573aa14b9/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Group photograph: Leslie C Coleman, Davison and others",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-2-4-3"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9842",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Group photograph: Leslie C Coleman, Davison and others"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Group photo with over 50 people, with Leslie Coleman and Davison seated and garlanded in centre. Rest appear to be from India."
                                        }
                                      },
                                      "id" => "aspace_da4ff847226aad8c88fb03726d873a66"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-2-4-3",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_ba6d3382e8b7cec083e6b32c7cf264f4",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "4",
                                            "id" => "aspace_e0e974eb7e3d9695506628dbb6b8880b",
                                            "parent" => "aspace_ba6d3382e8b7cec083e6b32c7cf264f4",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Group photograph: Leslie C Coleman and others"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/110",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/c68d0178-5615-464e-a52a-97782445ebed/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Group photograph: Leslie C Coleman and others",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-2-4-4"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9843",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Group photograph: Leslie C Coleman and others"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Seated, L to R: Phebe R Coleman, Leslie C Coleman, Davison. Standing, L to R: Four individuals of Indian origin, signatures on photograph, not decipherable."
                                        }
                                      },
                                      "id" => "aspace_c12fe932089b3c9d073a215bf2bbfc36"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-2-4-4",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_dd2a6a54581bb494e049882b703e909e",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "5",
                                            "id" => "aspace_1de748cdb9ee927435c763994dfda5d9",
                                            "parent" => "aspace_dd2a6a54581bb494e049882b703e909e",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Group photograph: LCC and others"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/111",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/2b8c5537-65e4-47cd-9b6b-9611a94020b7/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Group photograph: LCC and others",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-2-4-5"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9844",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Group photograph: LCC and others"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Group photo with 8 people, with Leslie Coleman and Phebe Coleman seated in centre."
                                        }
                                      },
                                      "id" => "aspace_cd522484549443875f91115aaadc0507"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-2-4-5",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_509c91781518f431c7622350e91723e1",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "6",
                                            "id" => "aspace_f05756598a25b7c5de91f81bb73ca21c",
                                            "parent" => "aspace_509c91781518f431c7622350e91723e1",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Group photograph: LCC and others"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/112",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/92db6233-d9c9-4cde-b350-b6620a5bcd25/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Group photograph: LCC and others",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-2-4-6"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9845",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Group photograph: LCC and others"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Group photo with over 100 people. Leslie Coleman and Phebe Coleman seated and garlanded in centre."
                                        }
                                      },
                                      "id" => "aspace_76a4fb64447a4f1c9bd7d18d4c3fb665"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-2-4-6",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_2025bcf29654d3408409e2c8e1f2920b",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "7",
                                            "id" => "aspace_139af0c6d34a962538a1c3fd5423ba26",
                                            "parent" => "aspace_2025bcf29654d3408409e2c8e1f2920b",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Group photograph: LCC and others"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/113",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/4dbf0612-170b-4b73-b766-36e5ac6cc743/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Group photograph: LCC and others",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-2-4-7"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9846",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Group photograph: LCC and others"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Group photo with 28 people, with Leslie Coleman and another person from India seated and garlanded in centre."
                                        }
                                      },
                                      "id" => "aspace_667380677c45c1405e6d56bd1403320a"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-2-4-7",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_5d808051b1d46d23320d49c6902b37cf",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "8",
                                            "id" => "aspace_009ce105b580b7d1e1c87cba0f0962fd",
                                            "parent" => "aspace_5d808051b1d46d23320d49c6902b37cf",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Group photograph: LCC and others"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/114",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/6de61314-415d-4f5f-a1fd-a7e21fe71278/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Group photograph: LCC and others",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-2-4-8"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9847",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Group photograph: LCC and others"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Group photo with 45 people, with Leslie Coleman and another person from India seated and garlanded in centre."
                                        }
                                      },
                                      "id" => "aspace_8770d6a785d9320512fa91405e17b82c"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-2-4-8",
                                  "level" => "file"
                                }
                              ],
                              "did" => %{
                                "content" => %{
                                  "container" => %{
                                    "content" => "MS-012 Box 4",
                                    "id" => "aspace_bf2930c4f9e2b350ff0fd0edfd0834b5",
                                    "label" => "Mixed Materials",
                                    "type" => "box"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-5-2"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9841",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" => "Sub-Series 2: Group photographs with colleagues"
                                  }
                                }
                              }
                            },
                            "id" => "aspace_MS-012-5-2",
                            "level" => "subseries"
                          },
                          %{
                            "content" => %{
                              "c" => [
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_e941a6225a80f4c3669216bf430b63f9",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "9",
                                            "id" => "aspace_73378a934584da69056673cb552427e9",
                                            "parent" => "aspace_e941a6225a80f4c3669216bf430b63f9",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "The Palace, Mysore (Illuminated) -- Season's Greetings from Krishnaraja Wadiyar (Wodeyar)"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/115",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/7a3a2460-48f9-4f7e-819c-ba4a4a8c6cf8/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "The Palace, Mysore (Illuminated) -- Season's Greetings from Krishnaraja Wadiyar (Wodeyar)",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "1932-1933",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-3-4-9"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9849",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "The Palace, Mysore (Illuminated) -- Season's Greetings from Krishnaraja Wadiyar (Wodeyar)"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Greeting card with photograph of palace, and royal seal in silk and gold"
                                        }
                                      },
                                      "id" => "aspace_f22daa1fe97a5f6f0949318dacb1348c"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-3-4-9",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_bfda9fcae3c716e2f58cfbfed72c567f",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "10",
                                            "id" => "aspace_ec5e02244bd96d21fc034ba3d8542137",
                                            "parent" => "aspace_bfda9fcae3c716e2f58cfbfed72c567f",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Statue Square, Mysore, at night -- Season's Greetings from Krishnaraja Wadiyar (Wodeyar)"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/116",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/95499c7c-6a59-4dfc-891f-4dafc12689d8/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Statue Square, Mysore, at night -- Season's Greetings from Krishnaraja Wadiyar (Wodeyar)",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "1933-1934",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-3-4-10"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9850",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Statue Square, Mysore, at night -- Season's Greetings from Krishnaraja Wadiyar (Wodeyar)"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Greeting card with photograph of statue square and royal seal in silk and gold"
                                        }
                                      },
                                      "id" => "aspace_f5d1e8d8de70d54cd3e6d413ada9ca62"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-3-4-10",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_3d81698d71d6393b6d2d872cb113db75",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "11",
                                            "id" => "aspace_dd4734d86fdb5e823d28234c945b9f0e",
                                            "parent" => "aspace_3d81698d71d6393b6d2d872cb113db75",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "The Palace, Mysore -- Season's Greetings from Krishnaraja Wadiyar (Wodeyar)"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/117",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/3742a527-1761-4405-90fb-394953c7e270/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "The Palace, Mysore -- Season's Greetings from Krishnaraja Wadiyar (Wodeyar)",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "1937-1938",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-3-4-11"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9851",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "The Palace, Mysore -- Season's Greetings from Krishnaraja Wadiyar (Wodeyar)"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Greeting card with photograph of the Mysore palace."
                                        }
                                      },
                                      "id" => "aspace_6d3e470eaae9d129911e0f3f3356a7af"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-3-4-11",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_c9e1ee2ae328d5b0fe1d1e5ce4514656",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "12",
                                            "id" => "aspace_6d585db56266e8579649077d749d7256",
                                            "parent" => "aspace_c9e1ee2ae328d5b0fe1d1e5ce4514656",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Indian Officer, Mysore Lancers -- Christmas and New Year's Greetings"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/118",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/854b83f1-1d92-4c08-aa2d-4fa14bf30bd6/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Indian Officer, Mysore Lancers -- Christmas and New Year's Greetings",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-3-4-12"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9852",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Indian Officer, Mysore Lancers -- Christmas and New Year's Greetings"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Postcard sized greeting. Unknown sender, indecipherable signature"
                                        }
                                      },
                                      "id" => "aspace_a47af86aa666232f755d5e2e2896d0ad"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-3-4-12",
                                  "level" => "file"
                                }
                              ],
                              "did" => %{
                                "content" => %{
                                  "container" => %{
                                    "content" => "MS-012 Box 4",
                                    "id" => "aspace_c366cfd2969a17b97da9163941ee6ab9",
                                    "label" => "Mixed Materials",
                                    "type" => "box"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-5-3"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9848",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" => "Sub-Series 3: Greeting cards"
                                  }
                                }
                              }
                            },
                            "id" => "aspace_MS-012-5-3",
                            "level" => "subseries"
                          },
                          %{
                            "content" => %{
                              "c" => [
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_1564d257d661562230c5a19cfb909887",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "13",
                                            "id" => "aspace_a69463acc7c44807a202f5ab62f9b210",
                                            "parent" => "aspace_1564d257d661562230c5a19cfb909887",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Loose Photos -- Part 1 of 7 -- Research and farm / field visits"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/119",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/dfa72889-ca9a-4154-bd22-a774b3955f68/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Loose Photos -- Part 1 of 7 -- Research and farm / field visits",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "1920, 1932",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-4-4-13"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9854",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Loose Photos -- Part 1 of 7 -- Research and farm / field visits"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "\"Loose Photos with some ID, mostly in Phebe Ropes Coleman's hand, some seem to be in the hand of her niece, Constance (Connie) Williams\" -- Part 1: Mysore Imperial Transport Bullock in Residency Grounds (1920), Trenches for sugarcane in J C Farm (1932) [5 photos, approx 4x6 in]"
                                        }
                                      },
                                      "id" => "aspace_171624c57fb0714daa993285bec04b2a"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-4-4-13",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_9a11549074667076102171c924efe4fe",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "14",
                                            "id" => "aspace_98667730338e99e4bdc4f6a61a3f50cd",
                                            "parent" => "aspace_9a11549074667076102171c924efe4fe",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Loose Photos -- Part 2 of 7 -- Family and home in India, ca 1928-1933"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/120",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/server/api/core/bitstreams/f6497f33-92c9-4f57-b4de-e7f233a62cf5/content",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:role" => "representative",
                                          "xlink:title" =>
                                            "Loose Photos -- Part 2 of 7 -- Family and home in India, ca 1928-1933",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "ca 1928-1933, Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-4-4-14"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9855",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Loose Photos -- Part 2 of 7 -- Family and home in India"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "\"Loose Photos with some ID, mostly in Phebe Ropes Coleman's hand, some seem to be in the hand of her niece, Constance (Connie) Williams\" -- Part 2: Family: Leslie Coleman, Phebe Coleman, Louisa, Leslie Jr, Family dogs (Patrick and Bubbles), Aruldas, Miss Laybourne, Honnametti Bungalow, Yeluval Bungalow, Lecily (?) Gemmell, Hillside in Bangalore [21 photos, 2x3 in]"
                                        }
                                      },
                                      "id" => "aspace_2b8129cab9cdc4587ebe29c5fa0823fe"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-4-4-14",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_6d229001d8bd72d24ab54c68a282b4c0",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "15",
                                            "id" => "aspace_f605ed057f69fe0d7fe9d641e7409496",
                                            "parent" => "aspace_6d229001d8bd72d24ab54c68a282b4c0",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Loose Photos -- Part 3 of 7 -- Family and home in India"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/121",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/a67e33e9-87cb-4d05-af34-5d77681635dd/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Loose Photos -- Part 3 of 7 -- Family and home in India",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "ca 1928-1933, Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-4-4-15"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9856",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Loose Photos -- Part 3 of 7 -- Family and home in India"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "\"Loose Photos with some ID, mostly in Phebe Ropes Coleman's hand, some seem to be in the hand of her niece, Constance (Connie) Williams\" -- Part 3: Family: Leslie Coleman, Phebe Coleman, Louisa, Leslie Jr, Family dogs (Patrick and Bubbles), Elizabeth Ayah, Constance (Connie), Chicky (Malabar squirrel) [16 photos, approx. 2x3 in]."
                                        }
                                      },
                                      "id" => "aspace_96df3ff2e51ea79671818bfdbbfd1945"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-4-4-15",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_facd372f5b9268f23e64ddd82bdd82ee",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "16",
                                            "id" => "aspace_d8a0ab4136f79464a918de08b8615d31",
                                            "parent" => "aspace_facd372f5b9268f23e64ddd82bdd82ee",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Loose Photos -- Part 4 of 7 -- Research and farm / field visits, Undated"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/122",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/716fd076-52f2-475c-89de-2c0986d4d49e/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Loose Photos -- Part 4 of 7 -- Research and farm / field visits, Undated",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-4-4-16"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9857",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Loose Photos -- Part 4 of 7 -- Research and farm / field visits"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "\"Loose Photos with some ID, mostly in Phebe Ropes Coleman's hand, some seem to be in the hand of her niece, Constance (Connie) Williams\" -- Part 4: Sugarcane cultivation, paddy experimental plots in Chikkanahalli, jaggery processing, cattle breeding station, cane car for transporting cane, slip point shares, Mysore plough, Kirloskar plough, Eureka plough, Meston plough, Kolar mission plough, manure transportation, field trip with Ralph Morris and Sholigas, Chamarajanagar State Forest, photo of LCC in field. [18 photos. Approx. 4x6 in, some 2x3 in]"
                                        }
                                      },
                                      "id" => "aspace_bd76643d6851652818efa59a7af02ca3"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-4-4-16",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_07ab5e521df9c99ca00ac14204f370fb",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "17",
                                            "id" => "aspace_824af8a71b8d1496b98302f0b88ca4fb",
                                            "parent" => "aspace_07ab5e521df9c99ca00ac14204f370fb",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Loose Photos -- Part 5 of 7 -- Research, farm / field visits, agricultural work"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/123",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/3d4e793d-f912-4cb6-82a4-71b497251bd8/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Loose Photos -- Part 5 of 7 -- Research, farm / field visits, agricultural work",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-4-4-17"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9858",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Loose Photos -- Part 5 of 7 -- Research, farm / field visits, agricultural work"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "\"Loose Photos with some ID, mostly in Phebe Ropes Coleman's hand, some seem to be in the hand of her niece, Constance (Connie) Williams\" -- Part 5: Sugarcane fields, most others unidentified [11 photos. Approx. 3x5 in, some 2x3 in]"
                                        }
                                      },
                                      "id" => "aspace_610e75382cbfdb451c59e7248ac1f7f5"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-4-4-17",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_820260c7ba0bb8c7c91e649e1ba87a17",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "18",
                                            "id" => "aspace_5d266cc9a908c1db933230fd0a993ce9",
                                            "parent" => "aspace_820260c7ba0bb8c7c91e649e1ba87a17",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Loose Photos -- Part 6 of 7 -- Work and related individuals"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/124",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/1eaa2b3f-9aba-4de9-8505-72bb61f6bc8f/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Loose Photos -- Part 6 of 7 -- Work and related individuals",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-4-4-18"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9859",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Loose Photos -- Part 6 of 7 -- Work and related individuals"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "\"Loose Photos with some ID, mostly in Phebe Ropes Coleman's hand, some seem to be in the hand of her niece, Constance (Connie) Williams\" -- Part 6: Work related gathering with unidentified people, postcard of Krishnaraja Wadiyar [2 photos, approx 3x5 in]"
                                        }
                                      },
                                      "id" => "aspace_03db6947cdd9d93b4a45444f4ecfa3c0"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-4-4-18",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_1b140f73f98037943df9e676aa3eba5f",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "19",
                                            "id" => "aspace_a2e0f54d097e88292355a046a881b06d",
                                            "parent" => "aspace_1b140f73f98037943df9e676aa3eba5f",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Loose Photos -- Part 7 of 7 -- Travels"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/125",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/90aab8bd-665f-42b5-b51e-8b4b38fdfa8b/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Loose Photos -- Part 7 of 7 -- Travels",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-4-4-19"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9860",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Loose Photos -- Part 7 of 7 -- Travels"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "\"Loose Photos with some ID, mostly in Phebe Ropes Coleman's hand, some seem to be in the hand of her niece, Constance Williams\" -- Part 7: Travel: Sravana Belagola Jain Shrine, Belur Temple, Sivasamudram, Jog Falls, Halebid, Machan stay [12 photos, approx. 2x3 in]"
                                        }
                                      },
                                      "id" => "aspace_269d605f1f03f032b04688e50588cd9c"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-4-4-19",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_ae8034193ce85332dff34301adba09ea",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "20",
                                            "id" => "aspace_80db9ebef5740c285bab8b80b8dffec4",
                                            "parent" => "aspace_ae8034193ce85332dff34301adba09ea",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Loose Photos -- Profile photographs of Coleman, field visit, train station, village scene"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/126",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/968de7ac-3e30-4e80-ba09-3579ebdceece/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Loose Photos -- Profile photographs of Coleman, field visit, train station, village scene",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "1925, Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-4-4-20"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9861",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Loose Photos -- Profile photographs of Coleman, field visit, train station, village scene"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Five photos (undated unless stated otherwise): LCC on field visit in India, LCC with two people at train station in 1925, two profile photographs of LCC (likely ca 1910s or 1920s), one torn village scene photograph."
                                        }
                                      },
                                      "id" => "aspace_8bd2d2daca157649efd0889669b2971c"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-4-4-20",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_21757c89bbbc106ecaede899683e9543",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "21",
                                            "id" => "aspace_5d5c85b350d069d6bc083fc48ee55636",
                                            "parent" => "aspace_21757c89bbbc106ecaede899683e9543",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Mysore royal family (Wadiyar) procession"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/127",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/22cbae63-f88b-416c-b38e-f9a05c24e83e/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Mysore royal family (Wadiyar) procession",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-4-4-21"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9862",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Mysore royal family (Wadiyar) procession"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Krishnaraja Wadiyar on horse, in a procession."
                                        }
                                      },
                                      "id" => "aspace_8a37a511740a90ba3a067bfbf767a62f"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-4-4-21",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_fd2b624209e5836c7d8f03a0eeb615df",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "22",
                                            "id" => "aspace_f929333fe527957a43c46aca56042ebe",
                                            "parent" => "aspace_fd2b624209e5836c7d8f03a0eeb615df",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Print of digital photograph of tombstone of \"Mary MacDonald, beloved wife of Dr Leslie Coleman\""
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/128",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/35c96882-ec45-4214-ade3-bfd139756a0a/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Print of digital photograph of tombstone of \"Mary MacDonald, beloved wife of Dr Leslie Coleman\"",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-4-4-22"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9863",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Print of digital photograph of tombstone of \"Mary MacDonald, beloved wife of Dr Leslie Coleman\""
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Text on tombstone reads \"… Of Mary MacDonald, beloved wife of Dr Leslie Coleman, Director of Agriculture in Mysore. Born in Oakville, Canada on the 19th October, 1882. Died at Attikan on the 10th May, 1918\"."
                                        }
                                      },
                                      "id" => "aspace_68e810d9399aea71789e80bb35a063e7"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-4-4-22",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_18ba647d54fe35dcab6d6da313d51ed9",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "23",
                                            "id" => "aspace_54f03158c798c93bf38644d2ce5a5a0b",
                                            "parent" => "aspace_18ba647d54fe35dcab6d6da313d51ed9",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Unknown profile photograph (military attire)"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/129",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/b764b31a-156d-4fb3-b74e-466109752656/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Unknown profile photograph (military attire)",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-4-4-23"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9864",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Unknown profile photograph (military attire)"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Barton Son and Co Ltd Photographers. Bangalore and Ootacamund (Ooty). Reg. No. 10620."
                                        }
                                      },
                                      "id" => "aspace_1424a429d3196b61b7b10e13eb91ef2f"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-4-4-23",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_8c88567f398b9563d3b0920da188f956",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "24",
                                            "id" => "aspace_93cdefe1faad6809b0ff3bbe688ca138",
                                            "parent" => "aspace_8c88567f398b9563d3b0920da188f956",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Unknown profile photograph (military attire)"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/130",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/9a53528a-04f1-44d0-a326-fe50462037fe/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Unknown profile photograph (military attire)",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-4-4-24"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9865",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Unknown profile photograph (military attire)"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" => "Scribbled on back: \"Colonel Crawford??\""
                                        }
                                      },
                                      "id" => "aspace_367c507b57ae51a19e051bda86a12410"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-4-4-24",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_f0fb84644e3f0beb81337a35e5839e2a",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "25",
                                            "id" => "aspace_eec86dfe10c88f77e3adc24770f8d208",
                                            "parent" => "aspace_f0fb84644e3f0beb81337a35e5839e2a",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Field site, unidentified"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/131",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/04c66e29-e18d-4caa-8e29-10f5804ad4c5/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Field site, unidentified",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-4-4-25"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9866",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Field site, unidentified"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Foreground with two men walking. Background with industrial site and chimney with smoke."
                                        }
                                      },
                                      "id" => "aspace_eb1beff7098abf6a0735278a9f9155f6"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-4-4-25",
                                  "level" => "file"
                                }
                              ],
                              "did" => %{
                                "content" => %{
                                  "container" => %{
                                    "content" => "MS-012 Box 4",
                                    "id" => "aspace_72ef94b28ceb79bf0adfa21ae0c5419b",
                                    "label" => "Mixed Materials",
                                    "type" => "box"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-5-4"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9853",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" =>
                                      "Sub-Series 4: Miscellaneous loose photographs - family, field work, research tools, public events, profiles"
                                  }
                                }
                              }
                            },
                            "id" => "aspace_MS-012-5-4",
                            "level" => "subseries"
                          },
                          %{
                            "content" => %{
                              "c" => [
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_922811ab6a3f60235e9526bf9ebab1d1",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "26",
                                            "id" => "aspace_2e42158207c2e90876162e9ce62b2fb5",
                                            "parent" => "aspace_922811ab6a3f60235e9526bf9ebab1d1",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Guest at vocal performance at High School, Kolar -- 1954 Visit to India"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/132",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/625a9b13-2e35-4f37-bab2-355aaada86df/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Guest at vocal performance at High School, Kolar -- 1954 Visit to India",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "ca 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-5-4-26"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9868",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Guest at vocal performance at High School, Kolar -- 1954 Visit to India"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Photo of a musical performance taken at a meeting at a high school in Kolar. Leslie Coleman with Mr Ramenayengar. Includes handwritten inscription."
                                        }
                                      },
                                      "id" => "aspace_e0884f27ff145b744d807f461e059ad1"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-5-4-26",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_5fe782043d1ca6170f251ecba376ba61",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "27",
                                            "id" => "aspace_37acdd16d675862c158f1aabe619576e",
                                            "parent" => "aspace_5fe782043d1ca6170f251ecba376ba61",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Department of Agriculture, Mysore -- 1954 Visit to India"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/133",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/5844183e-e58c-482d-8ebf-a0d9fd039140/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Department of Agriculture, Mysore -- 1954 Visit to India",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "ca 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-5-4-27"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9869",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Department of Agriculture, Mysore -- 1954 Visit to India"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Photo album containing photographs taken by P R Raghuram Pillai at the Department of Agriculture during Coleman's visit in 1954. Photographs show Coleman with his colleagues and staff, tea ceremony, Coleman using lab instruments and other facilities at the Department."
                                        }
                                      },
                                      "id" => "aspace_6ebb47d042dccd27db9f1684a15ba7cc"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-5-4-27",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 4",
                                            "id" => "aspace_2349a3419a57c0988134de838e85afe1",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "28",
                                            "id" => "aspace_5c3f85acac87cd20b91dcfd71d7c086e",
                                            "parent" => "aspace_2349a3419a57c0988134de838e85afe1",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Mysore Agricultural and Experimental Union District Branch, Mandya -- 1954 Visit to India"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/134",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/3e741d4e-6260-48b5-bdf3-3be4d190919b/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Mysore Agricultural and Experimental Union District Branch, Mandya -- 1954 Visit to India",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "ca 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-5-5-4-28"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9870",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Mysore Agricultural and Experimental Union District Branch, Mandya -- 1954 Visit to India"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Photo album containing photographs taken during Coleman's visit to the Mysore Agricultural and Experimental Union at Mandya. Shows Coleman delivering a talk on a dias, photos with colleagues and members of the union."
                                        }
                                      },
                                      "id" => "aspace_939c6b61a59e9b31c8702bc4a947bec5"
                                    }
                                  },
                                  "id" => "aspace_MS-012-5-5-4-28",
                                  "level" => "file"
                                }
                              ],
                              "did" => %{
                                "content" => %{
                                  "container" => %{
                                    "content" => "MS-012 Box 4",
                                    "id" => "aspace_465663228f4f5cb43376c7ad00f29d7d",
                                    "label" => "Mixed Materials",
                                    "type" => "box"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-5-5"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9867",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" => "Sub-Series 5: Visit to India, 1953-1954"
                                  }
                                }
                              }
                            },
                            "id" => "aspace_MS-012-5-5",
                            "level" => "subseries"
                          }
                        ],
                        "did" => %{
                          "content" => %{
                            "container" => [
                              %{
                                "content" => "MS-012 Box 3",
                                "id" => "aspace_14cfe184d1b3c70de8520c0cae9a620e",
                                "label" => "Mixed Materials",
                                "type" => "box"
                              },
                              %{
                                "content" => "MS-012 Box 4",
                                "id" => "aspace_6d2edcd4e6c26a4e30388303c47c4c0b",
                                "label" => "Mixed Materials",
                                "type" => "box"
                              }
                            ],
                            "unitid" => [
                              %{"content" => "MS-012-5"},
                              %{
                                "content" => "/repositories/2/archival_objects/9829",
                                "type" => "aspace_uri"
                              }
                            ],
                            "unittitle" => %{"content" => "Series 5: Photographs"}
                          }
                        }
                      },
                      "id" => "aspace_MS-012-5",
                      "level" => "series"
                    },
                    %{
                      "content" => %{
                        "c" => [
                          %{
                            "content" => %{
                              "c" => [
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_75e2ad78f9045395a6b92a4d09a39ecb",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "1",
                                            "id" => "aspace_8a4e6f4bcd0a8c4da64b23a576c3d318",
                                            "parent" => "aspace_75e2ad78f9045395a6b92a4d09a39ecb",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "H.F Murland - Ms. Coleman"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/135",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/476d02c1-b32f-4d6d-ab41-d4cdf49b50f3/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "H.F Murland - Ms. Coleman",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "14 September 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-1"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9873",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "H.F Murland - Ms. Coleman"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Offers condolences to Ms. Coleman. Mentions Coleman's plans about writing a book about his travels in the Mysore state."
                                        }
                                      },
                                      "id" => "aspace_0218b1b23ffcedf7a2a9c6a38ae44a72"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-1",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_3871ae5cabd4aaf4331a14e094f07cc9",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "2",
                                            "id" => "aspace_6da07c1b96ac857c800660596ece34bf",
                                            "parent" => "aspace_3871ae5cabd4aaf4331a14e094f07cc9",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Unknown sender - Canada Lab of Plant Pathology"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/136",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/4993f2b2-312d-4f53-ba39-39db1fba59d1/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Unknown sender - Canada Lab of Plant Pathology",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "15 September 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-2"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9874",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Unknown sender - Canada Lab of Plant Pathology"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Telegram about Coleman's death. Mentions informing Mysore Government about Coleman's demise."
                                        }
                                      },
                                      "id" => "aspace_f8d9c39a920c631aad980b8610748032"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-2",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_e29cfc87ef4be82e52a8fda246714d24",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "3",
                                            "id" => "aspace_634b927d1e5614fc66eb67e976432076",
                                            "parent" => "aspace_e29cfc87ef4be82e52a8fda246714d24",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "R. Keith Hicks - Bertha Coleman"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/137",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/c7643415-273c-44ec-9223-91798bdad8f2/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "R. Keith Hicks - Bertha Coleman",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "15 September 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-3"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9875",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "R. Keith Hicks - Bertha Coleman"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" => "Offers condolences to Coleman Family."
                                        }
                                      },
                                      "id" => "aspace_b400816d69b7404f08e8a1133eb1b71e"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-3",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_791fc2e636e62f3c5f99044a34c9f3e1",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "4",
                                            "id" => "aspace_c36dd2b7d2e64026a1519d3dd2524548",
                                            "parent" => "aspace_791fc2e636e62f3c5f99044a34c9f3e1",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "T.M.C Taylor - Dominion Laboratory"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/138",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/f34b7b51-c3a8-494c-a675-25000eb971db/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "T.M.C Taylor - Dominion Laboratory",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "15 September 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-4"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9876",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "T.M.C Taylor - Dominion Laboratory"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Offers condolences to Coleman family on behalf of Dominion Plant Pathology Laboratory, Department of Botany, Saanichton B.C."
                                        }
                                      },
                                      "id" => "aspace_e74bb35622b44c53a38c4b03f1fcbde8"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-4",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_4909b5d9d3bb47f6b5d8e23454db082b",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "5",
                                            "id" => "aspace_6c4ae7360d251eed72b431dadeab3e7f",
                                            "parent" => "aspace_4909b5d9d3bb47f6b5d8e23454db082b",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "V.M Lingiah (Mysore Sugar Company) - Canada Laboratory"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/139",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/90e928c8-1522-4e62-9c37-eef96273a0ab/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "V.M Lingiah (Mysore Sugar Company) - Canada Laboratory",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "17 September 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-5"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9877",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "V.M Lingiah (Mysore Sugar Company) - Canada Laboratory"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Offers condolences to Coleman family on behalf of Mysore Sugar Company from V. M. Lingiah. Attached is a condolence resolution passed at a meeting of officers and staff of Mysore Sugar Company."
                                        }
                                      },
                                      "id" => "aspace_d5cadd6ae8dfe37f41a52c6b259450d7"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-5",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_bbe2fa42a1f16b66d02795b564406824",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "6",
                                            "id" => "aspace_31708825118b88eb45749390599a1498",
                                            "parent" => "aspace_bbe2fa42a1f16b66d02795b564406824",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Director of Agriculture (Mysore State) - Ann Coleman"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/140",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/f8190a93-a2cd-45bf-a798-a7eb630cfbc3/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Director of Agriculture (Mysore State) - Ann Coleman",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "17 September 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-6"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9878",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Director of Agriculture (Mysore State) - Ann Coleman"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Telegram that expresses condolences to Coleman family from Director of Agriculture, Mysore state."
                                        }
                                      },
                                      "id" => "aspace_41e43396a83aa6f0cafe8188d4611095"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-6",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_66355559b507eac7dda4453809884e4d",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "7",
                                            "id" => "aspace_ca5cfc444b44743ccd7ff00e693fd5b1",
                                            "parent" => "aspace_66355559b507eac7dda4453809884e4d",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Chief Secretary (Government of Mysore) - Plant Pathology"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/141",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/0f48f486-8c7d-4830-9b6f-449e4c680be6/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Chief Secretary (Government of Mysore) - Plant Pathology",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "17 September 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-7"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9879",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Chief Secretary (Government of Mysore) - Plant Pathology"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Copy of telegram that offers condolences to Coleman family from Chief Secretary, Government of Mysore."
                                        }
                                      },
                                      "id" => "aspace_4dc933435e9b662b6ef2d65649e52ed0"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-7",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_d3ed7c7833e5d9e8127872e92fffbe3b",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "8",
                                            "id" => "aspace_2a9c6e4dd8435fa5f280927f013d2abf",
                                            "parent" => "aspace_d3ed7c7833e5d9e8127872e92fffbe3b",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Laboratory Staff (Plant Pathology Saanichton) - Coleman Family"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/142",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/e32f1a56-a490-4b61-8de5-0979e7c75410/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Laboratory Staff (Plant Pathology Saanichton) - Coleman Family",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "17 September 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-8"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9880",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Laboratory Staff (Plant Pathology Saanichton) - Coleman Family"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Greeting card offering condolences to Coleman family from the staff of the Plant Pathology Laboratory, Saanichton B.C. Signed by staff members."
                                        }
                                      },
                                      "id" => "aspace_4212a316a1fdd945d423eeff8e5fcd46"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-8",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_f73b5ed641a060383b3ff2a58cd5d004",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "9",
                                            "id" => "aspace_a331b5c9213548170d4a04a9de58d330",
                                            "parent" => "aspace_f73b5ed641a060383b3ff2a58cd5d004",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Syed Nasiruddin - Mrs. Coleman"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/143",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/66eded08-2352-481d-801c-59b2ad5426e2/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Syed Nasiruddin - Mrs. Coleman",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "18 September 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-9"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9881",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Syed Nasiruddin - Mrs. Coleman"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "From Syed Nasiruddin, Agricultural Inspector, Saklaspur, Hassan District. Offers condolences to Coleman family."
                                        }
                                      },
                                      "id" => "aspace_d1f3b7c7f0cb1ebf514ef339bf12cf73"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-9",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_4f0d4634496ae01dc423fb78558106c4",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "10",
                                            "id" => "aspace_d39ee04ca720093f057fa3518e4a81e4",
                                            "parent" => "aspace_4f0d4634496ae01dc423fb78558106c4",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Dr. Duff - Ms. Coleman"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/144",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/c24d142d-6d30-42c5-9d68-4d579af7d940/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Dr. Duff - Ms. Coleman",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "19 September 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-10"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9882",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Dr. Duff - Ms. Coleman"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" => "Offers condolences to Coleman family."
                                        }
                                      },
                                      "id" => "aspace_7b672ec7df3c65870e5796681515612d"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-10",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_ddb9218aff2e97164f49df07182fdc21",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "11",
                                            "id" => "aspace_bd5a6c25e2b640ecbdb7dc3b0f9eb815",
                                            "parent" => "aspace_ddb9218aff2e97164f49df07182fdc21",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Mary White - Bertha Coleman"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/145",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/0e474856-1b61-4940-bc16-9be75bea29b6/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Mary White - Bertha Coleman",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "20 September 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-11"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9883",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Mary White - Bertha Coleman"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Offers condolences to Ms. Coleman. Mentions Coleman's travels in the Mysore state."
                                        }
                                      },
                                      "id" => "aspace_079f40870318b91022fe39876ec44f09"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-11",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_36daa4fb8ec49b7450b87acb4f4ffa20",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "12",
                                            "id" => "aspace_d1ff2b08417ce5f4554ac36af6a7371b",
                                            "parent" => "aspace_36daa4fb8ec49b7450b87acb4f4ffa20",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Leila Srinivasan - Bertha Coleman"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/146",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/db3367da-a641-41c7-a350-d4eda0e13546/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Leila Srinivasan - Bertha Coleman",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "23 September 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-12"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9884",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Leila Srinivasan - Bertha Coleman"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Copy of a letter that offers condolences to Coleman family on behalf of the Srinivasans."
                                        }
                                      },
                                      "id" => "aspace_58c899455f3ea74a0f77cbd16b678d43"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-12",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_d2a6a2532fd62d47faf9ed933d640195",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "13",
                                            "id" => "aspace_3e756989f3d3fc7190b30ec26fe50776",
                                            "parent" => "aspace_d2a6a2532fd62d47faf9ed933d640195",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Leslie Jr. - Bertha Coleman and Mrs. L Palmer"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/147",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/b037feb4-486a-4bf0-9c77-507ad344d242/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Leslie Jr. - Bertha Coleman and Mrs. L Palmer",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "24 September 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-13"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9885",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Leslie Jr. - Bertha Coleman and Mrs. L Palmer"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Letter from Leslie Coleman Jr to his family. Details his trip to family home after the sudden death of Coleman."
                                        }
                                      },
                                      "id" => "aspace_fe5798bc2db4943de5cd032519b1d911"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-13",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_74f9b04415b5d9783752fbd08da7be59",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "14",
                                            "id" => "aspace_16c1cdd569e91905da0362804cfcbb8e",
                                            "parent" => "aspace_74f9b04415b5d9783752fbd08da7be59",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Mrs. McKeen - Bertha Coleman, Mrs. L Palmer"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/148",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/3631003d-0573-428a-88fc-8be93e9c9f2e/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Mrs. McKeen - Bertha Coleman, Mrs. L Palmer",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "24 September 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-14"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9886",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Mrs. McKeen - Bertha Coleman, Mrs. L Palmer"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Letter from Wilbert and Joan McKeen offering condolences to the Coleman Family."
                                        }
                                      },
                                      "id" => "aspace_d51cd68d62ea8ea38a4614c8008d2e36"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-14",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_c7fce483533d64d9162ce90708e41319",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "15",
                                            "id" => "aspace_d8bc3628389e328b39228b3f1c0f107e",
                                            "parent" => "aspace_c7fce483533d64d9162ce90708e41319",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "V.M Lingiah (Mysore Sugar Company) - Canada Laboratory"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/149",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/63d59da1-cf5f-4c59-9a75-bc49240dc923/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "V.M Lingiah (Mysore Sugar Company) - Canada Laboratory",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "5 October 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-15"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9887",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "V.M Lingiah (Mysore Sugar Company) - Canada Laboratory"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Offers condolences to Coleman family on behalf of Mysore Sugar Company from V. M. Lingiah. Mentions condolence resolution passed by the Board of Directors."
                                        }
                                      },
                                      "id" => "aspace_ad6e8ac1a4fdee8a36ac83df5d8f1de5"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-15",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_a27840fe45f75e5b799b5d6329fd0f56",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "16",
                                            "id" => "aspace_80868b0a3826571c54a41f0c8d77d13f",
                                            "parent" => "aspace_a27840fe45f75e5b799b5d6329fd0f56",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "AgriUnion Gouribidanur - Mrs. Coleman"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/150",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/edad9636-e6b0-41ea-97c3-a636c3e98ac0/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "AgriUnion Gouribidanur - Mrs. Coleman",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "5 October 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-16"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9888",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "AgriUnion Gouribidanur - Mrs. Coleman"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Telegram offering condolences to Coleman family."
                                        }
                                      },
                                      "id" => "aspace_83f541b7d6b8c20ef576cf722237d531"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-16",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_9c29066219d312121898b6d595e65902",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "17",
                                            "id" => "aspace_84a1cb431fe1fdae89a771903d2e9a1a",
                                            "parent" => "aspace_9c29066219d312121898b6d595e65902",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Muriel Hutchinson - Bertha Coleman"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/151",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/e9018773-8f4f-4084-a769-cc228d1cbde8/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Muriel Hutchinson - Bertha Coleman",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "8 October 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-17"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9889",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Muriel Hutchinson - Bertha Coleman"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Offers condolences to Coleman family. Mentions Coleman's work in Mysore state."
                                        }
                                      },
                                      "id" => "aspace_5bf078ffb15ec1cb6787af33f9c049a8"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-17",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_6f5f0f3d0f42c5ae10ea7dd781713d91",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "18",
                                            "id" => "aspace_891ac53a1318d8d7d7fd1a092f018f73",
                                            "parent" => "aspace_6f5f0f3d0f42c5ae10ea7dd781713d91",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "H.V Krishnayya - Bertha Coleman, Mrs. L Palmer"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/152",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/81b1a9a4-d2f1-430c-aca5-b01af05ed0d8/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "H.V Krishnayya - Bertha Coleman, Mrs. L Palmer",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "12 October 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-18"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9890",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "H.V Krishnayya - Bertha Coleman, Mrs. L Palmer"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Offers condolences to Coleman family. Mentions Coleman's travel and work in Mysore state."
                                        }
                                      },
                                      "id" => "aspace_ed44b4b9f39c9ff8abf03f39bf6eff24"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-18",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_3dc997ed1c04e440fa948d656bc71d32",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "19",
                                            "id" => "aspace_00edef411ab16f0752c2d5f0a6a27906",
                                            "parent" => "aspace_3dc997ed1c04e440fa948d656bc71d32",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "G.V Krishnamurthy - Mrs. Coleman"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/153",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/47714906-316b-457e-8406-210d29b9e36c/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "G.V Krishnamurthy - Mrs. Coleman",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "16 October 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-19"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9891",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "G.V Krishnamurthy - Mrs. Coleman"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Offers condolences to Coleman family. Handwritten letter, message is written in English and Kannada."
                                        }
                                      },
                                      "id" => "aspace_9f98ce56601f204232aef93689b5e916"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-19",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_0cb7c261960decfb0a11ead72cdccab0",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "20",
                                            "id" => "aspace_121fc00e06da5c6539537256a6a052d0",
                                            "parent" => "aspace_0cb7c261960decfb0a11ead72cdccab0",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Howard F. Murland - Ms Coleman"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/154",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/c1c88fd0-93f5-47e8-90c8-4856e02e1389/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Howard F. Murland - Ms Coleman",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "24 October 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-20"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9892",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Howard F. Murland - Ms Coleman"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Offers condolences to Coleman family. Mentions time spent with Coleman in Mysore state."
                                        }
                                      },
                                      "id" => "aspace_5590db1e0845f7c49027606a9f193d83"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-20",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_a2f94f680a47f60079edad63ec2d5548",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "21",
                                            "id" => "aspace_842afd947d0f312fb03655b19ea4437d",
                                            "parent" => "aspace_a2f94f680a47f60079edad63ec2d5548",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "H.V Krishnayya - Ms Coleman"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/155",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/6ba9831a-0000-4ea3-9825-d3d826c2d560/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "H.V Krishnayya - Ms Coleman",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "10 November 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-21"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9893",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "H.V Krishnayya - Ms Coleman"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Reminiscences about Coleman family. Mentions Coleman's visit to Mysore state."
                                        }
                                      },
                                      "id" => "aspace_8122f741f913a37e4402bba94a853a89"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-21",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_8cb77c8e84653ec4ab1f5efe90f3acf2",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "22",
                                            "id" => "aspace_236fb948081162841c36ffc58563f39e",
                                            "parent" => "aspace_8cb77c8e84653ec4ab1f5efe90f3acf2",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "WHP Baeilli - Mrs. Coleman"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/156",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/c24b47e6-1074-46a9-84e2-1f456e50b8c7/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "WHP Baeilli - Mrs. Coleman",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "29 October 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-22"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9894",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "WHP Baeilli - Mrs. Coleman"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Offers condolences to Coleman family. Mentions pictures of the Colemans taken by Baeilli's wife ."
                                        }
                                      },
                                      "id" => "aspace_7c13f7bb2450b1be6c6f9a95fe2e4da7"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-22",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_92825bf77301d8af054677a84a06d908",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "23",
                                            "id" => "aspace_6f7ff7f6e36f14bf20a9f79d848e7a22",
                                            "parent" => "aspace_92825bf77301d8af054677a84a06d908",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "FAG Ratcliff (Mysore Planters Association) - Ms. Coleman"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/157",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/85dda360-207f-4cb5-afc3-d74b82a0a9a6/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "FAG Ratcliff (Mysore Planters Association) - Ms. Coleman",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "9 December 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-23"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9895",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "FAG Ratcliff (Mysore Planters Association) - Ms. Coleman"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" => "Offers condolences to Coleman family."
                                        }
                                      },
                                      "id" => "aspace_3c2118806649242f709143b44bc5b2b3"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-23",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_d59942f6652dbb5acf59fe8f02d63b06",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "24",
                                            "id" => "aspace_7eb0545564ec88d71c3bb5e8f0262a67",
                                            "parent" => "aspace_d59942f6652dbb5acf59fe8f02d63b06",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "George Setterfield - Mrs. Palmer"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/158",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/119f87cd-6075-4823-aadb-36efc047da7d/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "George Setterfield - Mrs. Palmer",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-24"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9896",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "George Setterfield - Mrs. Palmer"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "From Coleman's student who expresses his wish to carry on Coleman's legacy by following his ideas and philosophies."
                                        }
                                      },
                                      "id" => "aspace_ee1500adaf3828ec9275e4d3c569a879"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-24",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_2ff25233c15c318c51007d257f3bca5c",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "25",
                                            "id" => "aspace_10d000d9bc2880107b4ad39809e6cead",
                                            "parent" => "aspace_2ff25233c15c318c51007d257f3bca5c",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Botany Department (University of Toronto)"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/159",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/b2485fc0-0674-4277-b6d3-2cb229cdaa9b/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Botany Department (University of Toronto)",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-25"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9897",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Botany Department (University of Toronto)"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Cards that mention donations made for cancer research in Coleman's name by staff and professors at Department of Botany, University of Toronto."
                                        }
                                      },
                                      "id" => "aspace_e0888635f895be1d876f13c08e376ca9"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-25",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_01d4fd2efc7f5ca11b31274633f5d4f0",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "26",
                                            "id" => "aspace_9ceb333701910d1fca72f601efbdefc9",
                                            "parent" => "aspace_01d4fd2efc7f5ca11b31274633f5d4f0",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Envelope with note"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/160",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/ba8fb837-19cd-4dfc-89ba-484d866aa6b2/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Envelope with note",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-1-5-26"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9898",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Envelope with note"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Handwritten note about Coleman's death. Mentions George Setterfield and Mrs. Louie Palmer."
                                        }
                                      },
                                      "id" => "aspace_fceae2fac9201a82c72f411b6e29bbf1"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-1-5-26",
                                  "level" => "file"
                                }
                              ],
                              "did" => %{
                                "content" => %{
                                  "container" => %{
                                    "content" => "MS-012 Box 5",
                                    "id" => "aspace_9c58b69e95d67c0e6674e8f35e6e1a18",
                                    "label" => "Mixed Materials",
                                    "type" => "box"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-6-1"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9872",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" => "Sub-Series 1: Correspondence"
                                  }
                                }
                              }
                            },
                            "id" => "aspace_MS-012-6-1",
                            "level" => "subseries"
                          },
                          %{
                            "content" => %{
                              "c" => [
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_908f6632c2bc1162d4ef576c9c5c86d1",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "27",
                                            "id" => "aspace_4eaf7a90765bdd5e404a0b9acfacb37a",
                                            "parent" => "aspace_908f6632c2bc1162d4ef576c9c5c86d1",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Dr. L.C Coleman Victim of Crash- The Daily Times"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/161",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/d15b4b5a-e56b-4c73-9731-021d754cd449/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Dr. L.C Coleman Victim of Crash- The Daily Times",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "14 September 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-2-5-27"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9900",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Dr. L.C Coleman Victim of Crash- The Daily Times"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions details about the car crash and Coleman's work at the Canadian Cancer Institute."
                                        }
                                      },
                                      "id" => "aspace_b26ccc3ae44b97de5221178245fe38c7"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-2-5-27",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_3d445f10e1ec65a89dbf2096d333a4fe",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "28",
                                            "id" => "aspace_bb9b3dbb7d5972ab35836276f4f276ab",
                                            "parent" => "aspace_3d445f10e1ec65a89dbf2096d333a4fe",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Leading cancer researcher dies after Royal Oak crash- The Daily Colonial"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/162",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/e753053d-863b-490e-9d0b-bd18a2c2e508/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Leading cancer researcher dies after Royal Oak crash- The Daily Colonial",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "15 September 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-2-5-28"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9901",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Leading cancer researcher dies after Royal Oak crash- The Daily Colonial"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions Coleman's work in India and his research work related to cytology and cancer in plants in Canada."
                                        }
                                      },
                                      "id" => "aspace_3a8e96068f3501b1239ad0bba30e7394"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-2-5-28",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_51fec37c9a261d98c1f4d4e47e54c60c",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "29",
                                            "id" => "aspace_812adc1046c21f1ca7be8dfac5fcfc6c",
                                            "parent" => "aspace_51fec37c9a261d98c1f4d4e47e54c60c",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Tribute paid to Dr. Coleman- The Colonist"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/163",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/cbc8c0c1-8ad2-40bc-ba88-15cef46d55ec/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Tribute paid to Dr. Coleman- The Colonist",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "15 September 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-2-5-29"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9902",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Tribute paid to Dr. Coleman- The Colonist"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Tributes to Coleman's by his colleague Dr. William Newton, director of the Dominion Experimental Farm in Saanichton."
                                        }
                                      },
                                      "id" => "aspace_286c32d3ad62089915976fb6c9e01ed9"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-2-5-29",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_59bc86ab4ba57597fac930101e3e7f9a",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "30",
                                            "id" => "aspace_0102015c92e41c29bb07e667c639d5a6",
                                            "parent" => "aspace_59bc86ab4ba57597fac930101e3e7f9a",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Tribute paid victim of Island Road crash- Vancouver province"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/164",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/bd431613-81e2-4ba9-9373-a8be9bc55726/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Tribute paid victim of Island Road crash- Vancouver province",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Circa September 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-2-5-30"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9903",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Tribute paid victim of Island Road crash- Vancouver province"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Tributes to Coleman's by his colleague Dr. William Newton, director of the Dominion Experimental Farm in Saanichton."
                                        }
                                      },
                                      "id" => "aspace_9f37a622abc6ff20f2d97ea82384d3b7"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-2-5-30",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_97c6f524ebb1490527dd272d5a6b9115",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "31",
                                            "id" => "aspace_ada1e11c02445e5d42944964036f9b59",
                                            "parent" => "aspace_97c6f524ebb1490527dd272d5a6b9115",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Research Worker- Tribute Article"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/165",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/81ea3c65-a93e-43f7-ba3b-58581d4f2d5d/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Research Worker- Tribute Article",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Circa September 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-2-5-31"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9904",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Research Worker- Tribute Article"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" => "Details Coleman's work in India."
                                        }
                                      },
                                      "id" => "aspace_968cfb167936c261406909274c04a00d"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-2-5-31",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_9f8c596eb94481b73eb72b3f49b37021",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "32",
                                            "id" => "aspace_b78c35f1eb6b1d36f762d7c5aeb50f0b",
                                            "parent" => "aspace_9f8c596eb94481b73eb72b3f49b37021",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Newspaper obituary"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/166",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/1e0f92cf-565e-4215-b672-840028e503e7/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Newspaper obituary",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Circa September 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-2-5-32"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9905",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Newspaper obituary"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" => "Contains details of Coleman's funeral."
                                        }
                                      },
                                      "id" => "aspace_5664b3c8813e73e610b4e8abb63ea8e9"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-2-5-32",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_c567276f95a9169310028d374925a48b",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "33",
                                            "id" => "aspace_9c968fe2996f147ecbe6333cb61b36f1",
                                            "parent" => "aspace_c567276f95a9169310028d374925a48b",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Prominent doctor dies after crash - Calgary Paper"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/167",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/54323fb8-3f84-4dcd-b1dc-776a2ee937ed/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Prominent doctor dies after crash - Calgary Paper",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Circa September 1954",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-6-2-5-33"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9906",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Prominent doctor dies after crash - Calgary Paper"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions the car accident and Coleman's death."
                                        }
                                      },
                                      "id" => "aspace_0a715adf2eebbeac89722b6ef04f5441"
                                    }
                                  },
                                  "id" => "aspace_MS-012-6-2-5-33",
                                  "level" => "file"
                                }
                              ],
                              "did" => %{
                                "content" => %{
                                  "container" => %{
                                    "content" => "MS-012 Box 5",
                                    "id" => "aspace_c8a232a390f56573e6015a8d6afd3e17",
                                    "label" => "Mixed Materials",
                                    "type" => "box"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-6-2"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9899",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" => "Sub-Series 2: Media coverage"
                                  }
                                }
                              }
                            },
                            "id" => "aspace_MS-012-6-2",
                            "level" => "subseries"
                          }
                        ],
                        "did" => %{
                          "content" => %{
                            "container" => %{
                              "content" => "MS-012 Box 5",
                              "id" => "aspace_9384f935ab42f43dfd353fffc8993e0a",
                              "label" => "Mixed Materials",
                              "type" => "box"
                            },
                            "unitid" => [
                              %{"content" => "MS-012-6"},
                              %{
                                "content" => "/repositories/2/archival_objects/9871",
                                "type" => "aspace_uri"
                              }
                            ],
                            "unittitle" => %{
                              "content" => "Series 6: Material related to Coleman's demise"
                            }
                          }
                        }
                      },
                      "id" => "aspace_MS-012-6",
                      "level" => "series"
                    },
                    %{
                      "content" => %{
                        "c" => [
                          %{
                            "content" => %{
                              "c" => [
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_0bac99646efbe91dadf61441d2459e49",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "34",
                                            "id" => "aspace_26c08008890a58d7b6983b6ec9092092",
                                            "parent" => "aspace_0bac99646efbe91dadf61441d2459e49",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "Notes on Coleman Family history"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/168",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/b16bff6b-1887-4c0a-9c8e-830343cf3b23/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Notes on Coleman Family history",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-7-1-5-34"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9909",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Notes on Coleman Family history"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Prepared by Leslie Coleman Jr.'s wife, Helen. Corrections were made by Ann Coleman. Mentions Coleman's life and work in India. Handwritten note on envelope clarifies Coleman's atheism."
                                        }
                                      },
                                      "id" => "aspace_5e1e8689675056bf88e1f4f78a4ceb28"
                                    }
                                  },
                                  "id" => "aspace_MS-012-7-1-5-34",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_77680c10d9844bbb2ca71fec596f20cb",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "35",
                                            "id" => "aspace_ba749b45e8ddcff3b19638622aa197d0",
                                            "parent" => "aspace_77680c10d9844bbb2ca71fec596f20cb",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Excerpts from picture book documenting Ann Widdowson's early life"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/169",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/c25c9d19-ede8-4b74-9b11-cc778c31197b/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Excerpts from picture book documenting Ann Widdowson's early life",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-7-1-5-35"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9910",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Excerpts from picture book documenting Ann Widdowson's early life"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Photocopy of a few pages of a picture book showing Ann Coleman with Leslie Coleman. And the Coleman residence and cabin."
                                        }
                                      },
                                      "id" => "aspace_d1914e6ecb1112523c9e768b672b33a2"
                                    }
                                  },
                                  "id" => "aspace_MS-012-7-1-5-35",
                                  "level" => "file"
                                }
                              ],
                              "did" => %{
                                "content" => %{
                                  "container" => %{
                                    "content" => "MS-012 Box 5",
                                    "id" => "aspace_f6438f5efc747222d84cfe4c203f79e0",
                                    "label" => "Mixed Materials",
                                    "type" => "box"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-7-1"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9908",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" => "Sub-Series 1: Notes on Coleman family history"
                                  }
                                }
                              }
                            },
                            "id" => "aspace_MS-012-7-1",
                            "level" => "subseries"
                          },
                          %{
                            "content" => %{
                              "c" => [
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_9b47c82dc96e6a360598d2610b57692d",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "36",
                                            "id" => "aspace_5cb05bc93725e69e4c68aff1fd539cec",
                                            "parent" => "aspace_9b47c82dc96e6a360598d2610b57692d",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Srinivasan, Jayalakshamma - Tom and Ann Widdowson"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/170",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/server/api/core/bitstreams/ff0f4100-4550-441d-9eb7-c1a7c7b5cd0e/content",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Srinivasan, Jayalakshamma - Tom and Ann Widdowson",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "15 December 1990",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-7-2-5-36"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9912",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Srinivasan, Jayalakshamma - Tom and Ann Widdowson"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Christmas greetings from Mrs Srinivasan to Ann and Tom Widdowson. Mentions whereabouts of the Srinivasan family."
                                        }
                                      },
                                      "id" => "aspace_615b9d2788fd5547ea4174001783cf52"
                                    }
                                  },
                                  "id" => "aspace_MS-012-7-2-5-36",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_117d98bf54b87660b35f5ecdd977174d",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "37",
                                            "id" => "aspace_4e78300c74a92005e536695880bca62e",
                                            "parent" => "aspace_117d98bf54b87660b35f5ecdd977174d",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Ann and Tom Widdowson - Dr Puttaswamy (UAS)"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/171",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/24632b86-4e9d-4476-9eaf-d399326f4094/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Ann and Tom Widdowson - Dr Puttaswamy (UAS)",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "9 December 1997",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-7-2-5-37"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9913",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Ann and Tom Widdowson - Dr Puttaswamy (UAS)"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Mentions 'Colemanii' a magazine published by Department of Entomology, University of Agricultural Sciences, GKVK. Includes references to compiling Coleman's scientific papers and sending them to Puttuswamy. Attached are two photo-greeting cards"
                                        }
                                      },
                                      "id" => "aspace_084546fb706046b0b2319d49e368e426"
                                    }
                                  },
                                  "id" => "aspace_MS-012-7-2-5-37",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_0b4262198b35859e9824657129a66c30",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "38",
                                            "id" => "aspace_6142b57125179bcc4fd37e9ddcc632b5",
                                            "parent" => "aspace_0b4262198b35859e9824657129a66c30",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Ann and Tom Widdowson - Dr Puttaswamy (UAS)"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/172",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/9a2954a0-b8b5-4e89-a6b1-04d5f09fadb9/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Ann and Tom Widdowson - Dr Puttaswamy (UAS)",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "26 November 1998",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-7-2-5-38"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9914",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Ann and Tom Widdowson - Dr Puttaswamy (UAS)"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" => "Photo-greeting card."
                                        }
                                      },
                                      "id" => "aspace_2c40526dd6bdb2ec22ea5e64baa5d6ef"
                                    }
                                  },
                                  "id" => "aspace_MS-012-7-2-5-38",
                                  "level" => "file"
                                }
                              ],
                              "did" => %{
                                "content" => %{
                                  "container" => %{
                                    "content" => "MS-012 Box 5",
                                    "id" => "aspace_8bed57001742f95c73fcd5f95fa1af32",
                                    "label" => "Mixed Materials",
                                    "type" => "box"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-7-2"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9911",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" => "Sub-Series 2: Correspondence"
                                  }
                                }
                              }
                            },
                            "id" => "aspace_MS-012-7-2",
                            "level" => "subseries"
                          }
                        ],
                        "did" => %{
                          "content" => %{
                            "container" => %{
                              "content" => "MS-012 Box 5",
                              "id" => "aspace_e34a6fe72709ea20e7d3cfc616df8046",
                              "label" => "Mixed Materials",
                              "type" => "box"
                            },
                            "unitid" => [
                              %{"content" => "MS-012-7"},
                              %{
                                "content" => "/repositories/2/archival_objects/9907",
                                "type" => "aspace_uri"
                              }
                            ],
                            "unittitle" => %{
                              "content" => "Series 7: Other material from Coleman family"
                            }
                          }
                        }
                      },
                      "id" => "aspace_MS-012-7",
                      "level" => "series"
                    },
                    %{
                      "content" => %{
                        "c" => [
                          %{
                            "content" => %{
                              "c" => [
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_266365bd9c198c98c4d0d28b1bac939e",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "39",
                                            "id" => "aspace_c7176880d32c98772d31c9a7456821fd",
                                            "parent" => "aspace_266365bd9c198c98c4d0d28b1bac939e",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Material from the Golden Jubilee Valedictory & Inauguration of International Convention Center- University of Agricultural Sciences"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/173",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/b74cfa72-2b0b-4b0f-849f-011c3d9aba01/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Material from the Golden Jubilee Valedictory &amp; Inauguration of International Convention Center- University of Agricultural Sciences",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "13 June 2014",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-8-1-5-39"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9917",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Material from the Golden Jubilee Valedictory & Inauguration of International Convention Center- University of Agricultural Sciences"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Invitation to the Golden Jubilee Valedictory & Inauguration of International Convention Center- University of Agricultural Sciences, GKVK. Includes a ribbon commemoration badge."
                                        }
                                      },
                                      "id" => "aspace_4ab13d8f6454c8390a95176463d74b0f"
                                    }
                                  },
                                  "id" => "aspace_MS-012-8-1-5-39",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_242a5156f685d14fd2b28e39af8cae3d",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "40",
                                            "id" => "aspace_069fcbf92e34c1167df40aca5f993a57",
                                            "parent" => "aspace_242a5156f685d14fd2b28e39af8cae3d",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Invitation - Inauguration of Coleman Lecture Series"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/174",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/5ea185e1-d459-4b08-baab-b5d0e9edf496/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Invitation - Inauguration of Coleman Lecture Series",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "16 June 2014",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-8-1-5-40"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9918",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Invitation- Inauguration of Coleman Lecture Series"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Invitation to the inauguration of the Coleman Lecture Series in 2014. Mentions Ann Widdowson as a guest."
                                        }
                                      },
                                      "id" => "aspace_6cd1f57898df87a98bd81dfdee0adc58"
                                    }
                                  },
                                  "id" => "aspace_MS-012-8-1-5-40",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_25c5300e0a6b32bfb7f6ddd0f76fdf1b",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "41",
                                            "id" => "aspace_d4cb221841ee791e3aced668d308a873",
                                            "parent" => "aspace_25c5300e0a6b32bfb7f6ddd0f76fdf1b",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Programme Inaugural function of Coleman Lecture Series"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/175",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/ffd94b45-2b1b-4b2a-a594-11924788369e/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Programme Inaugural function of Coleman Lecture Series",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Circa June 2014",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-8-1-5-41"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9919",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Programme Inaugural function of Coleman Lecture Series"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Programme list for the Coleman Lecture Series."
                                        }
                                      },
                                      "id" => "aspace_df1cf0900013e0c86581e86255fc4ee3"
                                    }
                                  },
                                  "id" => "aspace_MS-012-8-1-5-41",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_5f5879f82124bf02ec00e62329f8b65f",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "42",
                                            "id" => "aspace_fd92b55eb7501b888529afae15331444",
                                            "parent" => "aspace_5f5879f82124bf02ec00e62329f8b65f",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" => "MS-012-8-1-5-42"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/176",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/3015051a-05b3-4002-bc2f-8280c2171318/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "MS-012-8-1-5-42",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Circa 2014",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-8-1-5-42"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9920",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Coleman Lecture Brochure"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Brochure of the Coleman Lecture Series. Includes a photograph of Kaempferia Rotunda."
                                        }
                                      },
                                      "id" => "aspace_523da47abc5b485ef5644f9cf6ed6b0e"
                                    }
                                  },
                                  "id" => "aspace_MS-012-8-1-5-42",
                                  "level" => "file"
                                }
                              ],
                              "did" => %{
                                "content" => %{
                                  "container" => %{
                                    "content" => "MS-012 Box 5",
                                    "id" => "aspace_f54f327402884a5da88a4d16ad7b5f11",
                                    "label" => "Mixed Materials",
                                    "type" => "box"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-8-1"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9916",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" => "Sub-Series 1: Coleman Lectures"
                                  }
                                }
                              }
                            },
                            "id" => "aspace_MS-012-8-1",
                            "level" => "subseries"
                          },
                          %{
                            "content" => %{
                              "c" => [
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_b2498a155da01b51962b107359fddb39",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "43",
                                            "id" => "aspace_7f7b0e9ce43e9e31a2632668f8c09336",
                                            "parent" => "aspace_b2498a155da01b51962b107359fddb39",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "'Krishi Yogi Coleman'- Book by Annaiah Kiragandur"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/177",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/8d5772ef-b71f-4fa7-8930-22cf4fb1f46c/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "'Krishi Yogi Coleman'- Book by Annaiah Kiragandur",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "27 June 1905",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-8-2-5-43"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9922",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "'Krishi Yogi Coleman' - Book by Annaiah Kiragandur"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Booklet in Kannada on Coleman written by Anniah Kiragandur."
                                        }
                                      },
                                      "id" => "aspace_e413377f4986659fd7ad974b1b021c64"
                                    }
                                  },
                                  "id" => "aspace_MS-012-8-2-5-43",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_d907eebc4cc8d0f26f4fb775a5840b6a",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "44",
                                            "id" => "aspace_cb121624a39f25ba130996cff1eb7921",
                                            "parent" => "aspace_d907eebc4cc8d0f26f4fb775a5840b6a",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Indian Coffee - The Coffee Magazine- In Focus:CCRI (Contains tribute to Coleman)"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/178",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/93066bd2-f78c-43b4-abad-5bfd23692f14/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Indian Coffee - The Coffee Magazine- In Focus:CCRI (Contains tribute to Coleman)",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "5 May 2014",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-8-2-5-44"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9923",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Indian Coffee - The Coffee Magazine- In Focus:CCRI (Contains tribute to Coleman)"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Includes a tribute to Coleman as founder of coffee research in India. Mentions his role in starting the Mysore Coffee Experimental Station in 1925."
                                        }
                                      },
                                      "id" => "aspace_46ae1ac8e8274b30ba1149022c4108c1"
                                    }
                                  },
                                  "id" => "aspace_MS-012-8-2-5-44",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_992f6dcff68b1b4df0bf183f9d456f4c",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "45",
                                            "id" => "aspace_7ce593fdff8063dd24ecc6bbbcf6b68f",
                                            "parent" => "aspace_992f6dcff68b1b4df0bf183f9d456f4c",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Excerpts from Biographical Notes on Coleman"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/179",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/1331dc45-ed45-4463-8961-9a3febf27962/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Excerpts from Biographical Notes on Coleman",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-8-2-5-45"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9924",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Excerpts from Biographical Notes on Coleman"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "A page from a biographical note on Coleman. Includes a sketch of Colemania sphenariodes that was named after Coleman."
                                        }
                                      },
                                      "id" => "aspace_20d68526e83e6e89019646b73d233e93"
                                    }
                                  },
                                  "id" => "aspace_MS-012-8-2-5-45",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_438d9d413a2ea34c8c363352fe7f770a",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "46",
                                            "id" => "aspace_1a24b572ef3b2183e3cb03991e8335e9",
                                            "parent" => "aspace_438d9d413a2ea34c8c363352fe7f770a",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{
                                                  "content" =>
                                                    "Excerpts from the Biographical notes on Coleman"
                                                }
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/180",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/68b822e1-5467-4504-93c6-41fd9638a264/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" =>
                                            "Excerpts from the Biographical notes on Coleman",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-8-2-5-46"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9925",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" =>
                                            "Excerpts from the Biographical notes on Coleman"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Details Coleman's role in studying plant diseases when he was the Director of Agricultural Department of Mysore State. Mentions the activities and achievements made by the students of plant pathology at Hebbal Agricultural College."
                                        }
                                      },
                                      "id" => "aspace_af202b2ece5d29518024d2ea4652effe"
                                    }
                                  },
                                  "id" => "aspace_MS-012-8-2-5-46",
                                  "level" => "file"
                                }
                              ],
                              "did" => %{
                                "content" => %{
                                  "container" => %{
                                    "content" => "MS-012 Box 5",
                                    "id" => "aspace_2ca86ce4cfcea016c582c7e21e63da54",
                                    "label" => "Mixed Materials",
                                    "type" => "box"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-8-2"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9921",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" => "Sub-Series 2: Material Related to Coleman"
                                  }
                                }
                              }
                            },
                            "id" => "aspace_MS-012-8-2",
                            "level" => "subseries"
                          },
                          %{
                            "content" => %{
                              "c" => [
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_26cca962ef904703578c0334be0c776e",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "47",
                                            "id" => "aspace_fae92ac9507bf01679af533e2bac05d6",
                                            "parent" => "aspace_26cca962ef904703578c0334be0c776e",
                                            "type" => "folder"
                                          }
                                        ],
                                        "unitdate" => %{
                                          "content" => "Circa 2014",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-8-3-5-47"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9927",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{
                                          "content" => "Contacts of Ann Widdowson"
                                        }
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Business cards of Ann Widdowson's acquaintances."
                                        }
                                      },
                                      "id" => "aspace_b28f795e7de3965c4d56a029f1d246db"
                                    }
                                  },
                                  "id" => "aspace_MS-012-8-3-5-47",
                                  "level" => "file"
                                },
                                %{
                                  "content" => %{
                                    "did" => %{
                                      "content" => %{
                                        "container" => [
                                          %{
                                            "content" => "MS-012 Box 5",
                                            "id" => "aspace_139ba50a90e3b7e9c5a079e6c46c32e6",
                                            "label" => "Mixed Materials",
                                            "type" => "box"
                                          },
                                          %{
                                            "content" => "48",
                                            "id" => "aspace_92fa394e30858536e77e566bb7b226f1",
                                            "parent" => "aspace_139ba50a90e3b7e9c5a079e6c46c32e6",
                                            "type" => "folder"
                                          }
                                        ],
                                        "daogrp" => %{
                                          "content" => %{
                                            "daodesc" => %{
                                              "content" => %{
                                                "p" => %{"content" => "Poem"}
                                              }
                                            },
                                            "daoloc" => [
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/handle/42412/182",
                                                "xlink:type" => "locator"
                                              },
                                              %{
                                                "content" => nil,
                                                "xlink:href" =>
                                                  "https://collections.archives.ncbs.res.in/bitstreams/9f5db854-2f09-41bd-8ac5-b1870a83a2a6/download",
                                                "xlink:type" => "locator"
                                              }
                                            ]
                                          },
                                          "xlink:title" => "Poem",
                                          "xlink:type" => "extended"
                                        },
                                        "unitdate" => %{
                                          "content" => "Undated",
                                          "datechar" => "creation"
                                        },
                                        "unitid" => [
                                          %{"content" => "MS-012-8-3-5-48"},
                                          %{
                                            "content" => "/repositories/2/archival_objects/9928",
                                            "type" => "aspace_uri"
                                          }
                                        ],
                                        "unittitle" => %{"content" => "Poem"}
                                      }
                                    },
                                    "scopecontent" => %{
                                      "content" => %{
                                        "head" => %{
                                          "content" => "Scope and Contents"
                                        },
                                        "p" => %{
                                          "content" =>
                                            "Poem in Kannada and English. Mentions 'Artist : Purnachandra Chakravarti, Calcutta'."
                                        }
                                      },
                                      "id" => "aspace_092001fc8f7ab33a1dc558efafac1547"
                                    }
                                  },
                                  "id" => "aspace_MS-012-8-3-5-48",
                                  "level" => "file"
                                }
                              ],
                              "did" => %{
                                "content" => %{
                                  "container" => %{
                                    "content" => "MS-012 Box 5",
                                    "id" => "aspace_89afd0d30885456cb512356315381caa",
                                    "label" => "Mixed Materials",
                                    "type" => "box"
                                  },
                                  "unitid" => [
                                    %{"content" => "MS-012-8-3"},
                                    %{
                                      "content" => "/repositories/2/archival_objects/9926",
                                      "type" => "aspace_uri"
                                    }
                                  ],
                                  "unittitle" => %{
                                    "content" => "Sub-Series 3: Ann Widdowson Ephemera"
                                  }
                                }
                              }
                            },
                            "id" => "aspace_MS-012-8-3",
                            "level" => "subseries"
                          }
                        ],
                        "did" => %{
                          "content" => %{
                            "container" => %{
                              "content" => "MS-012 Box 5",
                              "id" => "aspace_787df3b66211d0ec7d659b703455a933",
                              "label" => "Mixed Materials",
                              "type" => "box"
                            },
                            "unitid" => [
                              %{"content" => "MS-012-8"},
                              %{
                                "content" => "/repositories/2/archival_objects/9915",
                                "type" => "aspace_uri"
                              }
                            ],
                            "unittitle" => %{
                              "content" => "Series 8: Material collected by Ann Widdowson"
                            }
                          }
                        }
                      },
                      "id" => "aspace_MS-012-8",
                      "level" => "series"
                    }
                  ]
                }
              },
              "prefercite" => %{
                "content" => %{
                  "head" => %{"content" => "Preferred Citation"},
                  "p" => %{
                    "content" => "MS-012, Leslie Coleman Papers, Archives at NCBS"
                  }
                },
                "id" => "aspace_4d6b37a543af9e406e2f7026b8fbf26a"
              },
              "scopecontent" => %{
                "content" => %{
                  "head" => %{"content" => "Content Description"},
                  "p" => [
                    %{
                      "content" =>
                        "This collection consists of the papers of Leslie Coleman, an entomologist, plant pathologist and virologist. He was the first Director of Agriculture in Mysore State. Coleman was instrumental in setting up agricultural research and agricultural education institutions in the state."
                    },
                    %{
                      "content" => "The Coleman papers are arranged into the following series:"
                    },
                    %{"content" => "Series 1: Correspondence"},
                    %{"content" => "Series 2: Writings"},
                    %{"content" => "Series 3: Media coverage"},
                    %{"content" => "Series 4: Research reprints"},
                    %{"content" => "Series 5: Photographs"},
                    %{"content" => "Series 6: Material related to Coleman's demise"},
                    %{"content" => "Series 7: Other material from Coleman family"},
                    %{"content" => "Series 8: Material collected by Ann Widdowson"},
                    %{
                      "content" =>
                        "The Correspondence series consists of letters to and from Leslie Coleman and the Coleman family. These have been divided into sub-series, letters to Leslie Coleman, letters from Leslie Coleman to family during visit to India, 1953-54 and tributes. The letters from India in 1953-54, document the people, places and events that were part of Coleman's state sponsored tour of Mysore state. Tributes contain commemorative addresses given to Coleman during his visit to India in 1953-55."
                    },
                    %{
                      "content" =>
                        "\nWritings contain handwritten and typed work by Coleman reflecting on his work and travels in India. Coleman was thinking of writing a book about his time in India. His writings are based on his views and observations of agricultural practices and life in the villages and towns in the Mysore state."
                    },
                    %{
                      "content" =>
                        "\nThe research reprints includes reports, papers and studies conducted by Coleman with his colleagues. Coleman's research interests in plant pathology and experimental agriculture is part of this series, including his study of the Deccan grasshopper species he had conducted with K Kunhi Kannan. "
                    },
                    %{
                      "content" =>
                        "Media coverage of Coleman's retirement in 1933-34 contains newspaper clippings of an investiture ceremony and reports of Coleman's retirement which detail his contributions to the Department of Agriculture in Mysore State."
                    },
                    %{
                      "content" =>
                        "\nThe photographs series contains photographs taken by Coleman or his family members. The sub-series includes albums, group photos, greeting cards, loose photos, and photos related to Coleman's visit to India in 1953-54. These document their everyday life in Mysore, travels around the state as well as in the rest of India. The photographs also document Coleman's work with colleagues at the Department of Agriculture and other agriculturists and farmers across the Mysore state. Documented in the photographs are the Coleman and Morris family, their domestic staff, public buildings and landscapes of Mysore state such as Carlton house and Billigirirangan hills, and social and cultural events namely the Mysore Dasara celebrations. There are a few official albums and photographs that document certain agricultural activity in the Mysore State such as the sericulture factory in Channapatna or areca nut processing. Some of the photographs are sensitive ethnographic portraits of people categorised on basis on religion, caste or occupation through cultural practises, costumes or objects."
                    },
                    %{
                      "content" =>
                        "\nMaterial related to Coleman's demise includes letters offering condolences sent to Coleman's family, and media coverage which contains obituaries and newspaper reports of Coleman's demise. "
                    },
                    %{
                      "content" =>
                        "\nCorrespondence sent to Coleman's family from friends in India or any work that contains references to Coleman have been kept under other material from Coleman family. This includes notes on family history and a part of a picture book on the family."
                    },
                    %{
                      "content" =>
                        "\nMaterial collected by Ann Widdowson, Coleman's daughter, are mostly related to a Coleman Lecture series and events at GKVK, Bangalore held in 2014. Also included are ephemera and documents related to Leslie Coleman such as biographical notes, a booklet etc."
                    }
                  ]
                },
                "id" => "aspace_fb9ef2a499cdc43265fb9e2bd322ec11"
              },
              "userestrict" => %{
                "content" => %{
                  "head" => %{"content" => "Conditions Governing Use"},
                  "p" => %{
                    "content" =>
                      "The Archives at NCBS makes no representation that it is the copyright owner in all of its collections. The user must obtain all necessary rights and clearances before use of the material. People interested in using the collections are requested to refer to the researcher guide for publication of material: https://archives.ncbs.res.in/access"
                  }
                },
                "id" => "aspace_62154d6808d6f55755497b601b039b9e"
              }
            },
            "level" => "collection"
          },
          "eadheader" => %{
            "content" => %{
              "eadid" => %{
                "content" => "MS-012",
                "countrycode" => "IN",
                "mainagencycode" => "IN-National Centre for Biological Sciences"
              },
              "filedesc" => %{
                "content" => %{
                  "publicationstmt" => %{
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
                            %{"content" => "archives@ncbs.res.in"},
                            %{
                              "content" => %{
                                "content" => ["URL: "],
                                "extptr" => %{
                                  "content" => nil,
                                  "xlink:href" => "https://archives.ncbs.res.in/",
                                  "xlink:show" => "new",
                                  "xlink:title" => "https://archives.ncbs.res.in/",
                                  "xlink:type" => "simple"
                                }
                              }
                            }
                          ]
                        }
                      },
                      "p" => [
                        %{
                          "content" => %{
                            "extref" => %{
                              "content" => nil,
                              "xlink:actuate" => "onLoad",
                              "xlink:href" =>
                                "https://archives.ncbs.res.in/sites/default/files/logo_archivesatncbs.png",
                              "xlink:show" => "embed",
                              "xlink:type" => "simple"
                            }
                          },
                          "id" => "logostmt"
                        },
                        %{
                          "content" => %{"date" => %{"content" => "March 30, 2022"}}
                        }
                      ],
                      "publisher" => %{"content" => "Archives at NCBS"}
                    }
                  },
                  "titlestmt" => %{
                    "content" => %{
                      "author" => %{"content" => "Venkat Srinivasan"},
                      "titleproper" => %{
                        "content" => %{
                          "content" => ["MS-012 Leslie Coleman Papers "],
                          "num" => %{"content" => "MS-012"}
                        }
                      }
                    }
                  }
                }
              },
              "profiledesc" => %{
                "content" => %{
                  "creation" => %{
                    "content" => %{
                      "content" => [
                        "This finding aid was produced using ArchivesSpace on ",
                        ".\n      "
                      ],
                      "date" => %{"content" => "2025-04-23 18:28:34 +0530"}
                    }
                  },
                  "descrules" => %{
                    "content" => "Describing Archives: A Content Standard"
                  },
                  "langusage" => %{
                    "content" => %{
                      "content" => ["Description is written in: ", ".\n      "],
                      "language" => %{
                        "content" => "English, Latin script",
                        "langcode" => "eng",
                        "scriptcode" => "Latn"
                      }
                    }
                  }
                }
              }
            },
            "countryencoding" => "iso3166-1",
            "dateencoding" => "iso8601",
            "langencoding" => "iso639-2b",
            "repositoryencoding" => "iso15511"
          }
        },
        "xmlns" => "urn:isbn:1-931666-22-9",
        "xmlns:xlink" => "http://www.w3.org/1999/xlink",
        "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance",
        "xsi:schemaLocation" => "urn:isbn:1-931666-22-9 https://www.loc.gov/ead/ead.xsd"
      }
    }
  end
end
