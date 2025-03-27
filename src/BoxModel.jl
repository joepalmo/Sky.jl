module BoxModel

using Catalyst, DifferentialEquations, ModelingToolkit

export simple_reaction_network, run_simple_simulation

function simple_reaction_network()
    @reaction_network begin
        k1, NO + O3 --> NO2 + O2
        k2, NO2 --> NO + O
    end
end

function run_simple_simulation()
    rxnsys = simple_reaction_network()

    u0 = [:NO => 1e-9, :O3 => 50e-9, :NO2 => 0.0, :O => 0.0, :O2 => 0.0]
    params = [1e-14, 1e-3]

    prob = ODEProblem(rxnsys, u0, (0.0, 3600.0), params)
    sol = solve(prob, Rosenbrock23())

    return sol
end

end # module
