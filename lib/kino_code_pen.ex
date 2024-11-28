defmodule KinoCodePen do
  @moduledoc """
  A simple Kino for display CodePen pens on Livebook.
  """
  use Kino.JS

  def new(username, pen_id, opts \\ []) do
    height = opts[:height] || "600"
    click_to_load = opts[:click_to_load] || false
    preview_path = if click_to_load, do: "preview/", else: ""
    default_tab = opts[:default_tab] || ["html", "result"]

    query =
      %{}
      |> Map.put("default-tab", Enum.join(default_tab, ","))
      |> Map.put("theme-id", opts[:theme])
      |> URI.encode_query()

    src_url =
      "https://codepen.io/#{username}/embed/#{preview_path}#{pen_id}/?#{query}"

    iframe = """
    <iframe
      height="#{height}"
      style="width: 100%;" scrolling="no"
      src="#{src_url}"
      frameborder="no"
      loading="lazy"
      allowtransparency
      allowfullscreen
    >
      See <a href="https://codepen.io/#{username}/pen/#{pen_id}">the Pen</a>
      by Ryo Wakabayashi (<a href="https://codepen.io/#{username}">@#{username}</a>)
      on <a href="https://codepen.io">CodePen</a>.
    </iframe>
    """

    Kino.JS.new(__MODULE__, iframe)
  end

  def url(pen_url, opts \\ []) do
    case Regex.named_captures(~r{codepen\.io/(?<username>[^/]+)/pen/(?<pen_id>[^/]+)}, pen_url) do
      %{"username" => username, "pen_id" => pen_id} ->
        new(username, pen_id, opts)

      _ ->
        Kino.JS.new(__MODULE__, "Invalid CodePen URL")
    end
  end

  asset "main.js" do
    """
    export function init(ctx, iframe) {
      ctx.root.innerHTML = iframe;
    }
    """
  end
end
