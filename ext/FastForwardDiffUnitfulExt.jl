module FastForwardDiffUnitfulExt

import FastForwardDiff: derivative, value_and_derivative, value_and_derivatives
import ForwardDiff: value, extract_derivative
using ForwardDiff: Dual, Tag
using Unitful: ustrip, unit, Quantity

@inline function value(::Type{T}, d::Quantity{TD}) where {T, TD <: Dual}
    value(T, ustrip(d)) * unit(d)
end

@inline function extract_derivative(::Type{T}, d::Quantity{TD}) where {T, TD <: Dual}
    extract_derivative(T, ustrip(d)) * unit(d)
end

@inline function derivative(f::F, x::Quantity{R}) where {F, R <: Real}
    T = typeof(Tag(f, R))
    ydual = f(Dual{T}(ustrip(x), one(x)) * unit(x))
    return extract_derivative(T, ydual) / unit(x)
end

@inline function value_and_derivative(f::F, x::Quantity{R}) where {F, R <: Real}
    T = typeof(Tag(f, R))
    ydual = f(Dual{T}(ustrip(x), one(x)) * unit(x))
    return value(T, ydual), extract_derivative(T, ydual) / unit(x)
end

@inline function value_and_derivatives(f::F, x::Quantity{R}) where {F, R <: Real}
    T = typeof(Tag(f, R))
    ydual, ddual = value_and_derivative(f, Dual{T}(ustrip(x), one(x)) * unit(x))
    return value(T, ydual), value(T, ddual), extract_derivative(T, ddual) / unit(x)
end

end
