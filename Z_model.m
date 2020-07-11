function [impedance] = Z_model(components, f)
%Returns impedance of model dummy load for given frequencies
global L3_R C2_R
R1 = components(1);
R2 = components(2);
R3 = components(3);
R4 = components(7);
L1 = components(4)*1e-3;
L2 = components(5)*1e-3;
L3 = components(8)*1e-3;
C1 = components(6)*1e-6;
C2 = components(9)*1e-6;
[niepotrzebne, potrzebne] = size(f);
impedance = zeros(niepotrzebne, potrzebne);
for n=1:1:potrzebne
    w = 2*pi*f(n);
    %impedance(n) = abs(R1 + (1i*w*R2*L1/(R2+1i*w*L1)) + (1/((1i*w*R3*L2/(R3+1i*w*L2))-(1/(1i*w*C1)))));
    %impedance(n) = abs(R1 + (1i*w*R2*L1/(R2+1i*w*L1)) + 1/sqrt((1/R3)^2+(1/(1i*w*L2)-1i*w*C1)^2));
    %impedance(n) = abs(R1 + 1/((1/R2)+(1/(1i*w*L1))) + 1/sqrt((1/R3)^2+(1/(1i*w*L2)-1i*w*C1)^2));
    z_rez = (1/((R4+1i*w*L3)/(1i*w*R4*L3)-(1i*w*C2)));
    impedance(n) = abs(R1 + (1i*w*R2*L1/(R2+1i*w*L1)) + (1/((R3+1i*w*L2)/(1i*w*R3*L2)-(1i*w*C1))) );
end
end