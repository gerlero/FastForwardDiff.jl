# FastForwardDiff.jl

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://gerlero.github.io/FastForwardDiff.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://gerlero.github.io/FastForwardDiff.jl/dev/)
[![Build Status](https://github.com/gerlero/FastForwardDiff.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/gerlero/FastForwardDiff.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/gerlero/FastForwardDiff.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/gerlero/FastForwardDiff.jl)
[![PkgEval](https://JuliaCI.github.io/NanosoldierReports/pkgeval_badges/F/FastForwardDiff.svg)](https://JuliaCI.github.io/NanosoldierReports/pkgeval_badges/F/FastForwardDiff.html)
[![Aqua](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)
[![SciML Code Style](https://img.shields.io/static/v1?label=code%20style&message=SciML&color=9558b2&labelColor=389826)](https://github.com/SciML/SciMLStyle)

**Fast and easy derivatives of scalar functions** with forward-mode automatic differentiation.

Compared to the scalar differentiation offered by the very popular [ForwardDiff.jl](https://github.com/JuliaDiff/ForwardDiff.jl) package, **FastForwardDiff** adds:

- **Efficient single-pass value and derivatives** with the `value_and_derivative` and `value_and_derivatives` functions. Faster and easier than ForwardDiff's equivalent (i.e., the [DiffResults API](https://github.com/JuliaDiff/DiffResults.jl)) ✅
- **[Unitful.jl](https://github.com/PainterQubits/Unitful.jl) support.** Correctly handles units in the inputs and outputs of functions ✅

Internally, it relies on the proven dual-number implementation from ForwardDiff.

## Example

```julia
julia> using FastForwardDiff

julia> f(x) = x^2 + 2x + 1

julia> derivative(f, 3)
8

julia> value_and_derivative(f, 3)
(16, 8)
```

## Documentation

- [**STABLE**](https://gerlero.github.io/FastForwardDiff.jl/stable/) &mdash; documentation of the most recent release
- [**DEV**](https://gerlero.github.io/FastForwardDiff.jl/dev/) &mdash; documentation of the in-development version
