using FastForwardDiff
using Documenter

DocMeta.setdocmeta!(FastForwardDiff,
    :DocTestSetup,
    :(using FastForwardDiff);
    recursive = true)

makedocs(;
    modules = [FastForwardDiff],
    authors = "Gabriel Gerlero",
    repo = "https://github.com/gerlero/FastForwardDiff.jl/blob/{commit}{path}#{line}",
    sitename = "FastForwardDiff.jl",
    format = Documenter.HTML(;
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://gerlero.github.io/FastForwardDiff.jl",
        edit_link = "main",
        assets = String[],),
    pages = [
        "Home" => "index.md",
    ],)

deploydocs(;
    repo = "github.com/gerlero/FastForwardDiff.jl",
    devbranch = "main",)
