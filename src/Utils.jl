module Utils

export default_met_conditions, default_photolysis_rates

function default_met_conditions(lat, lon, SZA)
    Dict(:T => 298.15, :P => 1013.25, :RH => 0.5, :SZA => SZA)
end

function default_photolysis_rates(lat, lon, SZA)
    Dict(:JNO2 => 1e-3, :JO3 => 1e-5)  # temporary placeholders
end

end # module
