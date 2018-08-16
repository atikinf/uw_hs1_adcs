%----------------------------------------------------------------------- %
%SIM_INIT Initialize all parameters used in simulations
%
% UW HuskySat-1, ADCS Team
%
% Initializes all simulation parameters for 'adcs_sim_main.slx'. This is
% the first (and only) file that needs to be called/run to do a full
% simulation. Make sure your cd is the same folder where sim_init is found
% before you run this.
%
% Last Edited: T. Reynolds  1.29.18
% Last Edited: N. Filippov  8.3.18
% ----------------------------------------------------------------------- %


%% important
% run 'unloadlibrary('aardvark') 
% in the command window before running sim

% Start fresh
clear variables; close all; clc
addpath(genpath(pwd))
addpath(genpath('../../adcs_fsw/matlab/'))
addpath(genpath('../../adcs_bdot/matlab/'))
addpath(genpath('../../adcs_mpc/matlab/'))

% Load bus stub definitions
load('bus_definitions.mat')
load('bus_definitions_fsw.mat')

% Load parameters for both flight software and simulation
fsw_params              = init_fsw_params();
[sim_params,fsw_params] = init_sim_params(fsw_params);
fsw_params.bdot         = init_bdot_controller(fsw_params);

% (toSat) Load sim and set params
run_time    = 604800;
mdl         = 'adcs_sim_main1';
load_system(mdl);
set_param(mdl,'StopTime', num2str(run_time));

% fromSat DAQ init

% (fromSat) clean up
instrreset;