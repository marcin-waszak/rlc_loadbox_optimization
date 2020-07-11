function [impedance] = Z_model(components, f)
%Returns impedance of model dummy load for given frequencies
%global L3_R C2_R
R0 = components(1);

R1 = components(2);
L1 = components(3)*1e-3;
C1 = components(4)*1e-6;

R2 = components(5);
L2 = components(6)*1e-3;
C2 = components(7)*1e-6;

R3 = components(8);
L3 = components(9)*1e-3;
C3 = components(10)*1e-6;

[niepotrzebne, potrzebne] = size(f);
impedance = zeros(niepotrzebne, potrzebne);
for n=1:1:potrzebne
    w = 2*pi*f(n);

    A1 = 1/R1 + 1/(1i*w*L1) + 1i*w*C1;
    A2 = 1/R2 + 1/(1i*w*L2) + 1i*w*C2;
    A3 = 1/R3 + 1/(1i*w*L3) + 1i*w*C3;
    impedance(n) = abs(R0 + 1/A1 + 1/A2 + 1/A3);
end
end
