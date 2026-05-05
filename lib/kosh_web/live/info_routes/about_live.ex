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

      <p class="text-primary-purple mt-2 font-bold">Supported by <a class="underline" href="https://arcadiafund.org.uk" target="_blank">Arcadia</a>⧉</p>
      <p class="text-secondary-purple mt-2">The software architecture for the anno.milli prototype was made possible through an Arcadia-funded project at the Archives at NCBS, to build a public open tool for wider discovery of archival material, drawing on the openly available resources of the Milli network.</p>

      <p class="text-primary-purple mt-2 font-bold">Source Repository</p>
      <p class="text-secondary-purple mt-2"><a class="underline" href="https://github.com/tattle-made/archive-annotation" target="_blank">tattle-made/archive-annotation</a>⧉</p>

      <p class="text-primary-purple mt-2 font-bold">Development</p>
      <p class="text-secondary-purple mt-2">Tattle: Maanas B, Aatman V, Denny G, Tarunima P</p>
      <p class="text-secondary-purple mt-2">Milli Archives Foundation: Venkat S</p>
      <p class="text-secondary-purple mt-2">Archives at NCBS: Ojas K</p>

      <p class="text-primary-purple mt-2 font-bold">Design</p>
      <p class="text-secondary-purple mt-2">Anoopa John</p>

      <p class="text-primary-purple mt-2 font-bold">Discussions</p>
      <p class="text-secondary-purple mt-2">Caltech Archives and Special Collections: Mariella Soprano, Thomas Keswick</p>
      <p class="text-secondary-purple mt-2">University of Leeds: Liz Stainforth, Dibyadyuti Roy</p>

      <p class="text-primary-purple mt-2 font-bold">Past iterations of anno.milli</p>
      <p class="text-secondary-purple mt-2">Developed by Janastu: Shafali J, Micah A, Bhanu P, and T B Dinesh, with grant support from Foundation for Innovation and Social Entrepreneurship (FISE)</p>

    </div>
    """
  end
end
