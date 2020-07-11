function [output] = work_fun(components)
global f_glob wzorzec_glob
f = f_glob;
wzorzec = wzorzec_glob;
output = max(abs((Z_model(components,f))-(wzorzec)));
end