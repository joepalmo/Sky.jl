using Sky, Test

@testset "BoxModel Basic Test" begin
    sol = Sky.BoxModel.run_simple_simulation()
    @test length(sol.t) > 0
    @test sol.retcode == :Success
end

