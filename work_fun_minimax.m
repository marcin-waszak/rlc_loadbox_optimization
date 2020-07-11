function [output] = work_fun_minimax(components)
global f_glob wzorzec_glob
f = f_glob;
wzorzec = wzorzec_glob;
output = [((Z_model(components,f)-wzorzec)),(wzorzec-Z_model(components,f))];
end