defmodule KoshWeb.HomeLive1 do
  use KoshWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <%!-- The class section-gutter is declared in the plugins in tailwind config file to ensude consistent padding in all child divs --%>
    <div class="section-gutter w-full">
      <div class="text-secondary-purple text-heading-28 font-semibold bg-[#E6E9F5]/50 mt-[2px] h-16 flex items-center">
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
              <p class="text-secondary-purple text-body-lg-24 xl:w-[40%]">
                Milli’s Annotation Tool allows users to search through and contribute annotations in the archive’s digital repository. It simplifies locating specific comments, notes, or metadata attached to materials like documents and images. By offering quick access to insights and cross-references, it’s a valuable resource for researchers and historians.
              </p>
            </div>

            <p class="text-secondary-purple text-body-lg-24 font-semibold mt-10">
              Are you a new user? <.link navigate={~p"/users/register"} class="underline">Register to Annotate</.link>. If not,
              <.link navigate={~p"/users/log_in"} class="underline">login here.</.link>
            </p>
          </div>
      <% end %>

      <div class="h-[11.5rem] mt-10 flex items-center w-full bg-secondary-blue">
        <.form for={@search_form} class="flex items-center w-full">
          <div class=" w-[60%]">
            <.input
              field={@search_form[:search_query]}
              class="h-16 rounded-r-none !text-primary-purple placeholder:text-primary-purple/70 !text-body-lg-24 border !border-primary-purple !w-full"
              placeholder="Search our collection..."
            />
          </div>
          <button class="btn-primary-purple h-16 text-body-lg-24 font-semibold px-20 py-4 mt-2 rounded-l-none">
            Search
          </button>
        </.form>
      </div>
      <div class="bg-secondary-lime h-80 py-14 ">
        <p class="text-primary-purple font-bold">what is unique about it?</p>
        <p class="text-secondary-purple text-body-lg-24 w-[70%] mt-2">
          There are two types of annotations: one created by the archive itself, and another sourced from users, which is moderated.
        </p>
        <.link
          class="text-body-lg-24 font-semibold underline text-secondary-purple mt-5"
          navigate={~p"/users/register"}
        >
          Register to Annotate.
        </.link>

        <div class="flex gap-3 mt-5">
          <img src={~p"/images/info-icon-register.svg"} alt="" srcset="" />
          <p class="text-secondary-purple text-caption-14 w-[70%]">
            By registering, you'll join a community that enriches the archival repository as a learning resource. Please be mindful and provide information that is accurate to the best of your knowledge.
          </p>
        </div>
      </div>

      <div class="bg-secondary-purple py-14">
        <p class="text-body-lg-24 text-white">An object has many lives.</p>

        <p class="text-display-40 text-[#E9FFB1] w-[60%]">
          Discover what others have to say about these collections.
        </p>
<%!-- To Populate  --%>
        <div class="flex mt-5 gap-5">
          <div class="flex flex-col gap-5 w-80">
            <div class="w-80 h-52 bg-[#5F6D7F]"  />
            <p class="text-white text-body-md-18 font-bold">Leslie Coleman Papers</p>

          </div>
          <div class="flex flex-col gap-5 w-80">
            <div class="w-80 h-52 bg-[#5F6D7F]"  />
            <p class="text-white text-body-md-18 font-bold">Obaid Siddiqi Papers</p>

          </div>
          <div class="flex flex-col gap-5 w-80">
            <div class="w-80 h-52 bg-[#5F6D7F]"  />
            <p class="text-white text-body-md-18 font-bold">Shripad and Nandini’s Papers of Narmada Struggle</p>

          </div>
        </div>
      </div>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    form = to_form(%{}, as: "search_form")

    {:ok,
     assign(socket, subview: :none, search_form: form, temporary_assigns: [search_form: nil])}
  end

  def handle_params(_unsigned_params, _uri, socket) do
    # socket.assigns.live_action will be :index, :login, or :register
    socket =
      assign(socket, :subview, socket.assigns.live_action)

    {:noreply, socket}
  end
end
