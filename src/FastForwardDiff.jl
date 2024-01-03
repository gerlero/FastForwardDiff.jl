module FastForwardDiff

import ForwardDiff
using ForwardDiff: Dual, Tag, value, extract_derivative

"""
    derivative(f, x) -> f'(x)

Compute the derivative of `f` at `x` using forward-mode automatic differentiation.
"""
@inline derivative(f::F, x::R) where {F, R <: Real} = ForwardDiff.derivative(f, x)

"""
    value_and_derivative(f, x) -> f(x), f'(x)

Compute the value and derivative of `f` at `x` in a single pass using forward-mode automatic differentiation.
"""
@inline function value_and_derivative(f::F, x::R) where {F, R <: Real}
    T = typeof(Tag(f, R))
    ydual = f(Dual{T}(x, one(x)))
    return value(T, ydual), extract_derivative(T, ydual)
end

"""
    value_and_derivatives(f, x) -> f(x), f'(x), f''(x)

Compute the value and first and second derivatives of `f` at `x` in a single pass using forward-mode automatic differentiation.
"""
@inline function value_and_derivatives(f::F, x::R) where {F, R <: Real}
    T = typeof(Tag(f, typeof(x)))
    ydual, ddual = value_and_derivative(f, Dual{T}(x, one(x)))
    return value(T, ydual), value(T, ddual), extract_derivative(T, ddual)
end

export derivative, value_and_derivative, value_and_derivatives

if !isdefined(Base, :get_extension)
    include("../ext/FastForwardDiffUnitfulExt.jl")
end

end
