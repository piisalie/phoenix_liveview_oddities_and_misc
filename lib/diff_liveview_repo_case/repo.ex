defmodule DiffLiveviewRepoCase.Repo do
  use Ecto.Repo,
    otp_app: :diff_liveview_repo_case,
    adapter: Ecto.Adapters.Postgres
end
