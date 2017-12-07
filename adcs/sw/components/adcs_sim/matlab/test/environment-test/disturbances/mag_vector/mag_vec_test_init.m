%% Magnetic vector unit test init file

% Test 1: 

% UW HuskySat-1, ADCS Subsystem
%  Last Update: T. Reynolds 12.5.17
%% Load paths and stuff needed
clear variables;

% Load bus stub definitions
load('bus_definitions.mat')

% Load parameters for both flight software and simulation
fsw_params = init_fsw_params();
[sim_params,fsw_params] = init_sim_params(fsw_params);
fsw_params.bdot     = init_bdot_controller(fsw_params);



%% Test 1

% Overrides

% -----

% Simulation parameters
run_time    = num2str(t_end);
mdl         = 'mag_vec_test';
load_system(mdl);
set_param(mdl, 'StopTime', run_time);
sim(mdl);

% ----- Analyze Results ----- %
%   extract pos/vel/time data from sim
dt_aero = logsout.getElement('dt_aero').Values.Data;
dt_aero_time = logsout.getElement('dt_aero').Values.Time;


% ----- Plot Results ----- %

%save('workspace-disturbances-test1.mat')

