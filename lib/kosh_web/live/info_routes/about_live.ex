defmodule KoshWeb.InfoRoutes.AboutLive do
  alias Kosh.EAD.Model.EAD.ArchDesc.DID.Repository
  use KoshWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="section-gutter w-full">
      <div class="w-full text-secondary-purple font-semibold bg-[#E6E9F5]/50 mt-[2px] flex items-center text-body-md-18 h-12 px-4 sm:text-body-lg-24 sm:h-14 sm:px-6 xl:text-heading-28 xl:h-16 xl:px-8">
        About
      </div>

      <p class="text-primary-purple mt-2 font-bold">Development</p>
      <p class="text-secondary-purple mt-2">
        <a class="underline" href="https://tattle.co.in/">Tattle</a>: Maanas B, Aatman V, Denny G, Tarunima P
      </p>
      <p class="text-secondary-purple mt-2">
        <a class="underline" href="https://milli.link/">Milli Archives Foundation</a>: Venkat S
      </p>
      <p class="text-secondary-purple mt-2">
        <a class="underline" href="https://archives.ncbs.res.in/">Archives at NCBS</a>: Ojas K
      </p>

      <p class="text-primary-purple mt-2 font-bold">Design</p>
      <p class="text-secondary-purple mt-2">
        <a class="underline" href="https://anoopajohn.com/">Anoopa John</a>
      </p>

      <p class="text-primary-purple mt-2 font-bold">Source Repository</p>
      <p class="text-secondary-purple mt-2">
        <a class="underline" href="https://github.com/tattle-made/archive-annotation" target="_blank">tattle-made/archive-annotation</a>⧉
      </p>

      <p class="text-primary-purple mt-2 font-bold">Informal Collaborations</p>
      <p class="text-secondary-purple mt-2">
        Caltech Archives and Special Collections: Mariella Soprano, Thomas Keswick
      </p>
      <p class="text-secondary-purple mt-2">University of Leeds: Liz Stainforth, Dibyadyuti Roy</p>

      <p class="text-primary-purple mt-2 font-bold">
        Supported by <a class="underline" href="https://arcadiafund.org.uk" target="_blank">Arcadia</a>⧉
      </p>
      <p class="text-secondary-purple mt-2">
        The software architecture for the anno.milli prototype was made possible through an Arcadia-funded project at the Archives at NCBS, to build a public open tool for wider discovery of archival material, drawing on the openly available resources of the Milli network.
      </p>

      <p class="text-primary-purple mt-2 font-bold">Past iterations of anno.milli</p>
      <p class="text-secondary-purple mt-2">
        anno.milli builds on an earlier annotation experiment developed by Milli Tech (Bhanu P, Dinesh TB, Joel L, Micah A, Prasoon J, Satakshi S, Shafali J), and with grant support from Foundation for Innovation and Social Entrepreneurship (FISE)
      </p>

      <p class="text-primary-purple mt-2 font-bold">Known annotation platforms</p>
      <p class="text-secondary-purple mt-2">
        <a class="underline" href="https://thepund.it/">Pund.it</a>: research and social annotations
      </p>
      <p class="text-secondary-purple mt-2">
        <a class="underline" href="https://omeka.org/s/modules/Annotate/">Omeka S Annotate</a>: W3C Web Annotation implementation; annotates on Omeka S resources
      </p>
      <p class="text-secondary-purple mt-2">
        <a class="underline" href="https://recogito.pelagios.org/help/tutorial">Recogito</a>
        , <a class="underline" href="https://web.hypothes.is">Hypothesis</a>
        , <a class="underline" href="https://manu.is/">Manu.is</a>: collaborative document annotations
      </p>
      <p class="text-secondary-purple mt-2">
        <a class="underline" href="https://glycerine.io/home/">Glycerine</a>
        , <a class="underline" href="https://allmaps.org/">Allmaps</a>
        , <a class="underline" href="https://github.com/NCSU-Libraries/annona">NCSU Annona</a>
        : W3C Web Annotations-compliant and built with IIIF Presentation API
      </p>
    </div>
    """
  end
end
