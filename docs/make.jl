using Sky
using Documenter

DocMeta.setdocmeta!(Sky, :DocTestSetup, :(using Sky); recursive=true)

makedocs(;
    modules=[Sky],
    authors="Joe Palmo",
    sitename="Sky.jl",
    format=Documenter.HTML(;
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)
