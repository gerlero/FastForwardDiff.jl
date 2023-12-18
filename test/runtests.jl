using FastForwardDiff
using Test
using Aqua
using JET

using Unitful

@testset "FastForwardDiff.jl" begin
    @testset "Code quality (Aqua.jl)" begin
        Aqua.test_all(FastForwardDiff, ambiguities = false)
    end

    if VERSION >= v"1.8"
        @testset "Code linting (JET.jl)" begin
            JET.test_package(FastForwardDiff; target_defined_modules = true)
        end
    end

    @testset "derivatives" begin
        f(x) = 3x^3 + x^2 - 4x - 2
        df(x) = 9x^2 + 2x - 4
        ddf(x) = 18x + 2

        for x in [1, 2, 3, 4, 5]
            @test (@inferred derivative(f, x)) == df(x)
            @test (@inferred value_and_derivative(f, x)) == (f(x), df(x))
            @test (@inferred value_and_derivatives(f, x)) == (f(x), df(x), ddf(x))
        end
    end

    @testset "Unitful" begin
        f(x) = 3x^3 * u"m/s^3" + x^2 * u"m/s^2" - 4x * u"m/s" - 2u"m"
        df(x) = 9x^2 * u"m/s^3" + 2x * u"m/s^2" - 4u"m/s"
        ddf(x) = 18x * u"m/s^3" + 2u"m/s^2"

        for x in [1u"s", 2u"s", 3u"s", 4u"s", 5u"s"]
            @test (@inferred derivative(f, x)) == df(x)
            @test (@inferred value_and_derivative(f, x)) == (f(x), df(x))
            @test (@inferred value_and_derivatives(f, x)) == (f(x), df(x), ddf(x))
        end
    end
end
