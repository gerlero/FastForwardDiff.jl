module FastForwardDiff

using ForwardDiff: Dual, Tag, value, extract_derivative
using Unitful: unit, ustrip

"""
    derivative(f, x) -> f'(x)

Compute the derivative of `f` at `x` using forward-mode automatic differentiation.
"""
@inline function derivative(f, x)
    T = typeof(Tag(f, typeof(one(x))))
    ydual = f(Dual{T}(ustrip(x), one(x)) * unit(x))
    return extract_derivative(T, ustrip(ydual)) * unit(ydual) / unit(x)
end

"""
    value_and_derivative(f, x) -> f(x), f'(x)

Compute the value and derivative of `f` at `x` in a single pass using forward-mode automatic differentiation.
"""
@inline function value_and_derivative(f, x)
    T = typeof(Tag(f, typeof(one(x))))
    ydual = f(Dual{T}(ustrip(x), one(x)) * unit(x))
    return value(T, ustrip(ydual)) * unit(ydual),
    extract_derivative(T, ustrip(ydual)) * unit(ydual) / unit(x)
end

"""
    value_and_derivatives(f, x) -> f(x), f'(x), f''(x)

Compute the value and first and second derivatives of `f` at `x` in a single pass using forward-mode automatic differentiation.
"""
@inline function value_and_derivatives(f, x)
    T = typeof(Tag(f, typeof(one(x))))
    ydual, ddual = value_and_derivative(f, Dual{T}(ustrip(x), one(x)) * unit(x))
    return value(T, ustrip(ydual)) * unit(ydual),
    value(T, ustrip(ddual)) * unit(ddual),
    extract_derivative(T, ustrip(ddual)) * unit(ddual) / unit(x)
end

export derivative, value_and_derivative, value_and_derivatives

end
