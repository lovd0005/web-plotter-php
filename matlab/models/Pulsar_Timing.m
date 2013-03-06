function [domain, omega] = Pulsar_Timing(f,numpoints)
domain = [1 1/8 1/20] / (365*24*3600);
omega = [1 1 1]*2.0e-8/0.72^2;
end
