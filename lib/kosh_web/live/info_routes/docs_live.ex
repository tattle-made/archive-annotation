defmodule KoshWeb.InfoRoutes.DocsLive do
  alias Kosh.EAD.Model.EAD.ArchDesc.DID.Repository
  use KoshWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="section-gutter w-full">
      <div class="w-full text-secondary-purple font-semibold bg-[#E6E9F5]/50 mt-[2px] flex items-center text-body-md-18 h-12 px-4 sm:text-body-lg-24 sm:h-14 sm:px-6 xl:text-heading-28 xl:h-16 xl:px-8">
        Docs
      </div>

      <p class="text-primary-purple mt-2 font-bold">What is annomilli</p>
      <p class="text-secondary-purple mt-2">
        annomilli (rhymes with <i>anomaly</i>) is a prototype annotation platform for archival catalogues. At its core annomilli demonstrates a functional annotation workflow for EAD 2002 XML catalogues disemminated through OAI-PMH endpoints
      </p>

      <p class="text-primary-purple mt-2 font-bold">How does annomilli work?</p>
      <p class="text-secondary-purple mt-2">
        annomilli has been developed to work with an archival catalogue aggregator that can disseminate EAD 2002 XML files through an OAI endpoint. For this prototype, <a
          class="underline"
          href="https://cat.milli.link"
        >catmilli</a>, an <a class="underline" href="https://archivesspace.org">ArchivesSpace</a>
        instance, functions as the catalog aggregator and OAI-PMH compliant EAD 2002 disseminator. On catmilli, folder level archival_objects have a corresponding "anno.milli" action button that takes the user to annotate the corresponding archival_object on annomilli.
        <a
          class="underline"
          href="https://cat.milli.link/repositories/2/archival_objects/20535#:~:text=anno%2Emilli"
        >
          Example
        </a>
      </p>

      <p class="text-primary-purple mt-2 font-bold">
        What catalogs are available to annotate on annomilli?
      </p>

      <p class="text-secondary-purple mt-2">
        At the time of public release in 2026, annomilli has pre-ingested EAD 2002 catalogues from catmilli (which include the catalogues at Archives at NCBS) and a select few open OAI endpoints that disseminate EAD 2002 catalogues. annomilli prototype only ingests the
        <a class="underline" href="http://loc.gov/ead/tglib/elements/c.html">
          non-numbered component elements
        </a>
        that are declared with the attribute <code>level="file"</code>
        The decision was taken to ease the development of the prototype by testing a consistent, constrained subset of EAD 2002 XML.
      </p>

      <p class="text-primary-purple mt-2 font-bold">
        Examples of EADs compatible with annomilli
      </p>
      <p class="text-secondary-purple mt-2 underline">
        <a href="https://oai.catalogue.archives.ncbs.res.in/oai?verb=GetRecord&identifier=oai:archives.ncbs.res.in:/repositories/2/resources/28&metadataPrefix=oai_ead">
          Leslie Coleman Papers
        </a>
      </p>
      <p class="text-secondary-purple mt-2 underline">
        <a href="https://oai.catalogue.archives.ncbs.res.in/oai?verb=GetRecord&identifier=oai:archives.ncbs.res.in:/repositories/2/resources/65&metadataPrefix=oai_ead">
          B C Choudhury Papers
        </a>
      </p>
      <p class="text-secondary-purple mt-2 underline">
        <a href="https://collections.archives.caltech.edu/oai?verb=GetRecord&identifier=oai%3Acaltech%3A%2Frepositories%2F2%2Fresources%2F124&metadataPrefix=oai_ead">
          Guide to the George Ellery Hale Papers
        </a>
      </p>
      <p class="text-primary-purple mt-2 font-bold">Examples of EADs incompatible with annomilli</p>
      <p class="text-secondary-purple mt-2 underline">
        <a href="https://aspace-staff-dev.mit.edu/oai?verb=GetRecord&identifier=oai:mit:/repositories/2/resources/692&metadataPrefix=oai_ead">
          Guide to the Papers of Albert Francis Hall (Massachusetts Institute of Technology)
        </a>
      </p>
      <p class="text-secondary-purple mt-2 underline">
        <a href="https://archives.iiap.res.in/index.php/ind-iia-f088;ead?sf_format=xml">
          1794 Madras Records (Indian Institute of Astrophysics)
        </a>
      </p>
      <p class="text-secondary-purple mt-2">
        The inability to ingest certain EADs is essentially a consequence of widely different implementations and adoptions of the EAD standard and also to ease the complexity of sourcing and parsing of EAD XML in the development of the annomilli prototype. To take the prototype concept forward, we would like to explore working with a wider set of EADs and other metadata representations like Dublin Core.
      </p>
    </div>
    """
  end
end
