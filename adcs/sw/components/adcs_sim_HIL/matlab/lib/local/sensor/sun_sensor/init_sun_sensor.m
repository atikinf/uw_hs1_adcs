function sunsensor = init_sun_sensor( )
% ----------------------------------------------------------------------- %
%INIT_SUN_SENSOR    Sim Sun Sensor Model Init File
%
% UW HuskySat-1, ADCS System
%
% T. Reynolds: 5.22.17
% ----------------------------------------------------------------------- %

deg2rad     = pi/180;

sunsensor.sample_time_s = (1/20);  % [Hz]

% Variance estimates for each axis
sunsensor.deg_err       = 0.1;
sunsensor.varx          = deg2rad * sunsensor.deg_err/(50*sqrt(3));
sunsensor.vary          = deg2rad * sunsensor.deg_err/(50*sqrt(3));
sunsensor.varz          = deg2rad * sunsensor.deg_err/(50*sqrt(3));

sunsensor.range_deg     = 60;

sunsensor.noise         = 1;        % noise on/off
sunsensor.resolution    = 1e-6;     % resolution
sunsensor.valid_pct     = 99;       % over 10 seconds

end