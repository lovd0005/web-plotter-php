function result = Ez(OmegaM,OmegaV,z)
result = (OmegaM*(1+z).^3+OmegaV).^0.5;  % dimensionless
end