module Mechanisms

using Catalyst
export load_mechanism_from_eqn

function load_mechanism_from_eqn(filepath::String)
    reactions_expr = ""
    parameters = Float64[]

    open(filepath) do f
        for (idx, line) in enumerate(eachline(f))
            line = strip(line)
            isempty(line) && continue
            startswith(line, "#") && continue

            k, rxn = split(line, ",")
            param_name = "k$(idx)"
            reactions_expr *= "$(param_name), $(strip(rxn))\n"
            push!(parameters, parse(Float64, strip(k)))
        end
    end

    # Use Catalyst macro to parse reactions directly from string
    rn = eval(Meta.parse("""
        @reaction_network begin
            $reactions_expr
        end
    """))

    return rn
end

end # module
