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

      <p class="text-2xl text-primary-purple mt-2 font-bold">What is annomilli?</p>
      <p class="text-secondary-purple mt-2">
        annomilli (uncomfortably pronounced <i>anomaly</i>) is a prototype annotation platform for archival catalogues. At its core annomilli demonstrates a functional annotation workflow for EAD 2002 XML catalogues disemminated through OAI-PMH endpoints.
        <br /> annomilli is built using
        <a class="underline" href="https://www.phoenixframework.org/">Phoenix Framework</a>
        and uses Postgres for database.
      </p>

      <p class="text-2xl text-primary-purple mt-2 font-bold">How does annomilli work?</p>
      <p class="text-secondary-purple mt-2">
        annomilli has been developed to work with an archival catalogue aggregator that can disseminate EAD 2002 XML files through an OAI endpoint. For this prototype, <a
          class="underline"
          href="https://cat.milli.link"
        >catmilli</a>, an <a class="underline" href="https://archivesspace.org">ArchivesSpace</a>
        instance, functions both as the catalog aggregator and an OAI-PMH compliant EAD 2002 disseminator. On catmilli, folder level archival_objects have a corresponding "anno.milli" action button that takes the user to annotate the corresponding archival_object on annomilli.
        <a
          class="underline"
          href="https://cat.milli.link/repositories/2/archival_objects/20535#:~:text=anno%2Emilli"
        >
          Example
        </a>
      </p>

      <p class="text-2xl text-primary-purple mt-2 font-bold">
        What catalogs are available to annotate on annomilli?
      </p>

      <p class="text-secondary-purple mt-2">
        At the time of public release in 2026, annomilli has pre-ingested EAD 2002 catalogues from catmilli (which include the catalogues at Archives at NCBS) and a select few open OAI endpoints that disseminate EAD 2002 catalogues. annomilli prototype only ingests the
        <a class="underline" href="http://loc.gov/ead/tglib/elements/c.html">
          non-numbered component elements
        </a>
        that are declared with the attribute
        <emph class="font-bold"><code>level="file"</code></emph>
        This decision was taken to ease the development of the prototype by testing a consistent, constrained subset of EAD 2002 XML.
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

      <p class="text-2xl text-primary-purple mt-2 font-bold">
        How to annotate archival records on annomilli?
      </p>

      <p class="text-secondary-purple mt-2">
        While a visitor on annomilli can discover the ingested archival material through the search box on the home page, to create and submit annotation, a visitor needs to <a
          class="underline text-secondary-purple mt-2"
          href="https://anno.milli.link/users/register"
        >
          register as a user
        </a>.
      </p>
      <p class="text-secondary-purple mt-2">
        If you are interested in learning more the administrator workflow on annomilli, write to us at:
        <br />
        <emph class="font-bold"><code>archives dash dev at ncbs dot res dot in</code></emph>
      </p>

      <p class="text-secondary-purple mt-2">
        There are two ways to access the ingested archival records on annomilli:
      </p>
      <p class="text-secondary-purple mt-2">
        1. anno.milli button on catmilli: Every file level archival object on catmilli will have an anno.milli button that takes you to the corresponding records. This button is implemented as a
        <a
          href="https://docs.archivesspace.org/customization/configuration/#appconfigpui_page_custom_actions"
          class="underline"
        >
          custom action button on ArchivesSpace:
        </a>
        <pre class="whitespace-pre-wrap">
          AppConfig[:pui_page_custom_actions] &lt;&lt; {
            'record_type' =&gt; ['archival_object'], # the jsonmodel type to show for
            'label' =&gt; 'anno.milli', # the I18n path for the action button
            'icon' =&gt; 'fa-hand-o-up', # the font-awesome icon CSS class
            'url_proc' =&gt;
                      proc {
                            |record|
                            'https://anno.milli.link/annotation/display?archival_space=archives.ncbs.res.in&amp;uri='
                            +record.uri
                           }
            }
      </pre>
      </p>
      <p class="text-secondary-purple mt-2">
        2. Search on annomilli: You can use the search box on the home/landing page to discover the ingested records on annomilli.
        <a href="https://anno.milli.link/search?q=science" class="underline">
          Here's a search for "science"
        </a>
      </p>
      <p class="text-secondary-purple mt-2">
        As a registered user, you can find the annotation options under the section titled "Discover what others have to say about these collections.
      </p>
      <p class="text-secondary-purple mt-2">
        annomilli offers four types of annotations -- <br /> 1.
        <emph class="font-bold">Description</emph>: Free text, descriptive <br /> 2.
        <emph class="font-bold">Subject</emph>: Select a subject from the a dropdown list of LCSH subject list or add a new subject<br />
        3.
        <emph class="font-bold">Peoples, Places, Organizations</emph>: Select a name/titles from the a dropdown list of LCNAF name authority list or add new
        <br /> 4.
        <emph class="font-bold">Emotion</emph>: Select from a toggle list of eight emotion responses
      </p>

      <p class="text-secondary-purple mt-2">
        All submitted annotations except Emotion annotations, are sent to the admin for approval. Once approved they are displayed in the section titled "Annotations for this File" on the record page. New approved subjects and names (that are not part of the LCSH or LCNAF drop-down) are automatically classified as Milli Local Knowledge (MLK)
      </p>

      <p class="text-secondary-purple mt-2">
        Annotations approved by the admin also become exportable as EADs through
        <a class="underline" href="https://anno.milli.link/admin/export-ead">this admin route</a>
      </p>
      <p class="text-secondary-purple mt-2">
        Each type of annotation is encoded during export as follows:
      </p>
      <p class="text-secondary-purple mt-2">
        <br /> 1.
        <emph class="font-bold">Description</emph>
        <pre class="whitespace-pre-wrap">
            &lt;scopecontent id=&quot;annnomilli-id_6_user_id_1_timestamp_2026-05-01 11:15:22.000&quot;&gt;
              &lt;head&gt;annomilli-annotation&lt;/head&gt;
              &lt;p&gt;foxy and feathery&lt;/p&gt;
            &lt;/scopecontent&gt;
        </pre>
      </p>
      <p class="text-secondary-purple mt-2">
        <br /> 2.
        <emph class="font-bold">Subject</emph>
        <pre class="whitespace-pre-wrap">
          &lt;subject
            source=&quot;lcsh&quot;
            authfilenumber=&quot;annomilli-id_45_user_id_1_timestamp_2026-05-01 06:15:42.000&quot;
            id=&quot;http://id.loc.gov/authorities/subjects/sh94000402&quot;
          &gt;
            Fox art
          &lt;/subject&gt;
          </pre>

        <pre class="whitespace-pre-wrap">
          &lt;subject
            source=&quot;mlk&quot;
            authfilenumber=&quot;annomilli-id_48_user_id_2_timestamp_2026-05-01 08:55:14.000&quot;
          &gt;
            reynard
          &lt;/subject&gt;
          </pre>
      </p>
      <p class="text-secondary-purple mt-2">
        <br /> 3.
        <emph class="font-bold">Peoples, Places, Organizations</emph>
        <pre class="whitespace-pre-wrap">
          &lt;persname
            source=&quot;lcnaf&quot;
            authfilenumber=&quot;annomilli-id_6_user_id_1_timestamp_2026-05-05 10:07:18.000&quot;
            id=&quot;http://id.loc.gov/authorities/names/no2002012363&quot;
          &gt;
            D'Silva, Carl
          &lt;/persname&gt;
        </pre>
        <pre>
          &lt;geogname
          source=&quot;mlk&quot; authfilenumber=&quot;annomilli-id_4_user_id_1_timestamp_2026-05-01 06:37:52.000&quot;
          &gt;
            Panjim
          &lt;/geogname&gt;
        </pre>
      </p>
      <p class="text-secondary-purple mt-2">
        <br /> 4.
        <emph class="font-bold">Emotion</emph>
        <pre class="whitespace-pre-wrap">
          &lt;subject
            source=&quot;mlk-emotion&quot;
            authfilenumber=&quot;annomilli-id_14_user_id_1_timestamp_2026-05-01 11:15:55.000&quot;
          &gt;
            surprise-high
          &lt;/subject&gt;
        </pre>
      </p>
      <p class="text-secondary-purple mt-2">
        This encoding allows us to keep encoding compatible with the EAD 2002. The decision to use certain attributes like
        <emph class="font-bold"><code>authfilenumber</code></emph>, which are deprecated in EAD 3 onwards, is intentional in this prototype to demonstrate a valid EAD export from annomilli and valid import back into an ArchivesSpace.The decision to work with EAD 2002 is due to its wide use and presence in archive catalogs worldwide. In our next iteration, we intend to figure interoperability for other standards and revisions like EAD 3, EAD 4.
      </p>
      <br />
      <br />
    </div>
    """
  end
end
