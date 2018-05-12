function sun_point = init_sun_point(fsw_params)
% ----------------------------------------------------------------------- %
%INIT_SUN_POINT     Initialize the sun pointing controller
%
% UW HuskySat-1, ADCS Team
% 
% Sets all parameters for the sun pointing controller used to acquire the
% sun when the sunsensor is invalid.
% 
% T. Reynolds -- 5.9.18
% ----------------------------------------------------------------------- %

% Sample times
sun_point.sample_time_s     = fsw_params.sample_time_s;

% Initial conditions
sun_point.ic.meas_ss_valid  = 0;
sun_point.ic.meas_ss_body_unit      = [0 0 0];
sun_point.ic.meas_pd_body_unit      = [0 0 0];
sun_point.ic.meas_body_rate_radps   = [0 0 0];
sun_point.ic.error_vec      = [0 0 0];
sun_point.ic.cmd_torque_nm  = [0 0 0];
sun_point.ic.sun_body_unit  = [0;0;1];

% Set gains
J   = fsw_params.bus.inertia;
z   = 1;
wn  = 0.0005 * 2 * pi;
sun_point.prop_gain = wn^2 * J;
sun_point.drv_gain  = 2 * wn * z * J;

end