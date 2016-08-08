defmodule Opencast.EpisodeController do
  use Opencast.Web, :controller

  import Ecto.Query, only: [from: 2]

  alias Opencast.Episode
  alias Opencast.PodcastView

  def index(conn, params) do
    episodes =
      from(e in Episode, preload: [:podcast])
      |> Repo.paginate(Map.get(params, "page", %{}))

    render(conn, "index.json-api", data: episodes)
  end

  def show(conn, %{"id" => id}) do
    episode = Repo.get!(Episode, id) |> Repo.preload(:podcast)
    render(conn, "show.json-api", data: episode)
  end

  def related_podcast(conn, %{"episode_id" => episode_id}) do
    episode =
      Repo.get!(Episode, episode_id)
      |> Repo.preload([:podcast, podcast: :episodes])

    render(conn, PodcastView, "show.json-api", data: episode.podcast)
  end
end
