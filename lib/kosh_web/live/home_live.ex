defmodule KoshWeb.HomeLive do
  use KoshWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <%!-- The class section-gutter is declared in the plugins in tailwind config file to ensude consistent padding in all child divs --%>
    <div class="section-gutter w-full">
      <div class="text-secondary-purple font-semibold bg-[#E6E9F5]/50 mt-[2px] flex items-center text-body-md-18 h-12 px-4 sm:text-body-lg-24 sm:h-14 sm:px-6 xl:text-heading-28 xl:h-16 xl:px-8
    ">
        Miili’s Archives Annotation Tool
      </div>

      <%= case @subview do %>
        <% :login -> %>
          <%= live_render(@socket, KoshWeb.UserLoginLive, id: :user_login) %>
        <% :register -> %>
          <%= live_render(@socket, KoshWeb.UserRegistrationLive, id: :user_register) %>
        <% _ -> %>
          <!-- default -->
          <div class="w-full mt-10">
            <div class="flex flex-col gap-2">
              <p class="text-primary-purple  font-bold">WHAT IS IT?</p>
              <p class="text-secondary-purple text-body-md-18 xl:text-body-lg-24 xl:w-[40%] lg:w-[60%]">
                Milli’s Annotation Tool allows users to search through and contribute annotations in the archive’s digital repository. It simplifies locating specific comments, notes, or metadata attached to materials like documents and images. By offering quick access to insights and cross-references, it’s a valuable resource for researchers and historians.
              </p>
            </div>
            <p>
            <.link
                navigate={~p"/annotation/all-annotations"}
                class="text-secondary-purple font-semibold xl:mt-10 mt-8 text-body-md-18 xl:text-body-lg-24 hover:underline "
              >
                View All Collected Annotations
              </.link>
              </p>

            <%= if @current_user do %>
              <%!-- <.link
                navigate={~p"/annotation/my-annotations"}
                class="text-secondary-purple font-semibold xl:mt-10 mt-8 text-body-md-18 xl:text-body-lg-24 hover:underline "
              >
                View My Annotations
              </.link> --%>
            <% else %>
              <p class="text-secondary-purple font-semibold xl:mt-10 mt-8 text-body-md-18 xl:text-body-lg-24">
                Are you a new user? <.link navigate={~p"/users/register"} class="underline">Register to Annotate</.link>. If not,
                <.link navigate={~p"/users/log_in"} class="underline">login here.</.link>
              </p>
            <% end %>
          </div>
      <% end %>

      <div class="mt-10 w-full bg-secondary-blue h-[9rem] flex items-center  sm:h-[10.5rem]  xl:h-[11.5rem]">
        <.form for={@search_form} phx-submit="search-redirect" class="flex items-center w-full">
          <div class="w-[60%]">
            <.input
              field={@search_form[:search_query]}
              placeholder="Search our collection..."
              class="w-full h-12 rounded-r-none !text-primary-purple placeholder:text-primary-purple/70 !text-body-md-18 border !border-primary-purple sm:h-14 md:!text-body-lg-24 xl:h-16 xl:!text-heading-28"
            />
          </div>
          <button class="btn-primary-purple h-12 text-body-md-18 font-semibold rounded-l-none py-2 mt-2 sm:w-auto sm:h-14 sm:px-10 md:text-body-lg-24 xl:h-16 xl:px-20 xl:text-heading-28">
            Search
          </button>
        </.form>
      </div>

      <div class="bg-secondary-lime min-h-[16rem] sm:min-h-[18rem] xl:min-h-80 py-8 sm:py-10 xl:py-14 ">
        <p class="text-primary-purple font-bold">what is unique about it?</p>
        <p class="text-secondary-purple text-body-md-18 md:text-body-lg-24 mt-2 xl:w-[70%]">
          There are two types of annotations: one created by the archive itself, and another sourced from users, which is moderated.
        </p>
        <%= if !@current_user do %>
          <.link
            navigate={~p"/users/register"}
            class="underline font-semibold text-secondary-purple text-body-md-18 md:text-body-lg-24 mt-5"
          >
            Register to Annotate.
          </.link>
        <% end %>
        <div class="flex gap-3 mt-5 items-center">
          <img src={~p"/images/info-icon-register.svg"} alt="" />
          <p class="text-secondary-purple text-caption-14 w-full xl:w-[70%]">
            <%= if !@current_user do
              "By registering, you'll join a community that enriches the archival repository as a learning resource."
            end %> Please be mindful and provide information that is accurate to the best of your knowledge.
          </p>
        </div>
      </div>

      <div class="bg-secondary-purple py-8 sm:py-10 xl:py-14">
        <p class="text-white text-body-md-18 sm:text-body-lg-24">An object has many lives.</p>
        <p class="text-[#E9FFB1] text-body-lg-24 sm:text-heading-28 xl:text-display-40 sm:w-full xl:w-[60%] mt-2">
          Discover what others have to say about these collections.
        </p>
        <%!-- To Populate --%>
        <div class="flex flex-wrap gap-5 mt-5 justify-center sm:justify-start">
          <div class="w-full sm:w-80 flex flex-col gap-5">
            <div class="w-full h-40 sm:h-52 bg-[#5F6D7F]"></div>
            <p class="text-white text-body-md-18 font-bold">Leslie Coleman Papers</p>
          </div>
          <div class="w-full sm:w-80 flex flex-col gap-5">
            <div class="w-full h-40 sm:h-52 bg-[#5F6D7F]"></div>
            <p class="text-white text-body-md-18 font-bold">Obaid Siddiqi Papers</p>
          </div>
          <div class="w-full sm:w-80 flex flex-col gap-5">
            <div class="w-full h-40 sm:h-52 bg-[#5F6D7F]"></div>
            <p class="text-white text-body-md-18 font-bold">
              Shripad and Nandini’s Papers of Narmada Struggle
            </p>
          </div>
        </div>
      </div>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    form = to_form(%{}, as: "search_form")

    {:ok,
     assign(socket, subview: :none, search_form: form, temporary_assigns: [search_form: nil])}
  end

  @impl true
  def handle_params(_unsigned_params, _uri, socket) do
    # socket.assigns.live_action will be :index, :login, or :register
    socket =
      assign(socket, :subview, socket.assigns.live_action)

    {:noreply, socket}
  end

  @impl Phoenix.LiveView
  def handle_event("search-redirect", unsigned_params, socket) do

    query = get_in(unsigned_params, ["search_form", "search_query"])

    url = "https://cat.milli.link/search?utf8=%E2%9C%93&op[]=&q[]=" <> URI.encode(query)

    socket =
      socket
      |> push_event("search-query", %{url: url})
      |> assign(:search_form, to_form(%{"search_query" => ""}, as: "search_form"))

    {:noreply, socket}
  end
end
