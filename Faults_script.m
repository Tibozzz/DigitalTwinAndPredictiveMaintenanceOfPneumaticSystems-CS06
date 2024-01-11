clc
 clear
close all

model = 'Modelisation_pneumatic_system0x2840x29';
load_system(model);

T_init_sweep  = (223.15:10:373.15);
A_valve_sweep = (1e-10:5.3348e-08:8.0032e-07);
A_piston_sweep = (0.002:((0.02-0.002)/15):0.02);

% A_piston_sweep = [0.0056 0.0145 0.02];  
% T_init_sweep = [233.15 318.15 363.15];
% A_valve_sweep =[2.1e-7 5e-7 8e-7];


numSims_T   = numel(T_init_sweep);
numSims_valve = numel(A_valve_sweep);
numSims_piston_area = numel(A_piston_sweep);


simIn_Pipe_A_T(1:numSims_T) = Simulink.SimulationInput(model);
simIn_Pipe_B_T(1:numSims_T) = Simulink.SimulationInput(model);
simIn_Piston_T(1:numSims_T) = Simulink.SimulationInput(model);

simIn_valve(1:numSims_valve) = Simulink.SimulationInput(model);
simIn_piston_area(1:numSims_piston_area) = Simulink.SimulationInput(model);

for idx = 1:numSims_T
     %simIn_Pipe_A_T(idx) = simIn_Pipe_A_T(idx).setBlockParameter([model '/Pipe A'], 't_init', num2str(T_init_sweep(idx)));
    % simIn_Pipe_B_T(idx) = simIn_Pipe_B_T(idx).setBlockParameter([model '/Pipe B'], 't_init', num2str(T_init_sweep(idx)));
     %simIn_Piston_T(idx) = simIn_Piston_T(idx).setBlockParameter([model '/Double-Acting Actuator'], 't_init', num2str(T_init_sweep(idx)));

    % simIn_valve(idx) = simIn_valve(idx).setBlockParameter([model '/Directional Valve'], 'A_leakage', num2str(A_valve_sweep(idx)));
      simIn_piston_area(idx) = simIn_piston_area(idx).setBlockParameter([model '/Double-Acting Actuator'], 'A_piston', num2str(A_piston_sweep(idx)));

end



  %simOut_Pipe_A_T = parsim(simIn_Pipe_A_T,'ShowSimulationManager','on');
 % simOut_Pipe_B_T = parsim(simIn_Pipe_B_T,'ShowSimulationManager','on');
 %simOut_piston_T = parsim(simIn_Piston_T,'ShowSimulationManager','on');
% simOut_valve = parsim(simIn_valve,'ShowSimulationManager','on');
 simOut_piston_area = parsim(simIn_piston_area,'ShowSimulationManager','on');

