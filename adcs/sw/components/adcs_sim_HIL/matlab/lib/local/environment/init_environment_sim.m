function sim_params = init_environment_sim(fsw_params,sim_params)
% ----------------------------------------------------------------------- %
% UW HuskySat-1, ADCS Team
%
% Initializes the whole environment block used in FSW & SIM.
%
%   Last Edited: T. Reynolds, 8.10.17
% ----------------------------------------------------------------------- %

% Initialize all sub blocks
sim_params.environment.sol_p       = init_solar_pressure(fsw_params);
sim_params.environment.aero_drag   = init_aero_drag();
sim_params.environment.gravity     = init_gravity_field();
sim_params.environment.magnetic    = init_magnetic_field();

sim_params.environment.sgp4        = init_sgp4(fsw_params);
sim_params.environment.PPT         = init_PPT(sim_params);

% Update constant struct
sim_params.constants.mag.orbit_freq = ...
                                sim_params.environment.sgp4.orbit_tle(9) * ...
                                fsw_params.constants.convert.rev2rad * ...
                                fsw_params.constants.time.sec2day;

sim_params.environment.DT_dipole    = [ 2.8868e-04; 2.8868e-04; 2.8868e-04];

end
