using FastForwardDiff
using Test
using Aqua
using JET

@testset "FastForwardDiff.jl" begin
    @testset "Code quality (Aqua.jl)" begin
        Aqua.test_all(FastForwardDiff)
    end
    @testset "Code linting (JET.jl)" begin
        JET.test_package(FastForwardDiff; target_defined_modules = true)
    end
    # Write your tests here.
end
