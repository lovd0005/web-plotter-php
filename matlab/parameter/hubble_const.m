function [ output_args ] = hubble_const( z )
%HUBBLE_CONST Summary of this function goes here
%   Detailed explanation goes here

constant;

output_args = H0*sqrt(0.7+0.3*(1+z).^3);

end

