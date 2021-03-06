function [ cmd_processing ] = init_cmd_processing(fsw_params)
% ----------------------------------------------------------------------- %
% UW HuskySat-1, ADCS Team
%
%   Parameters used in command processing library.
%
% Last Edited: T. Reynolds 4.18.18
% ----------------------------------------------------------------------- %

% Initial conditions


% Digital value range for MTQs
cmd_processing.digital_value    = 100;

% Conversions for MTQs
cmd_processing.dv_2_m_X   = ...
                        fsw_params.actuators.magnetorquer.max_dipole_x /...
                            cmd_processing.digital_value;
cmd_processing.m_2_dv_X   = 1/cmd_processing.dv_2_m_X;

cmd_processing.dv_2_m_Y   = ...
                        fsw_params.actuators.magnetorquer.max_dipole_y /...
                            cmd_processing.digital_value;
cmd_processing.m_2_dv_Y   = 1/cmd_processing.dv_2_m_Y;

cmd_processing.dv_2_m_Z   = ...
                        fsw_params.actuators.magnetorquer.max_dipole_z /...
                            cmd_processing.digital_value;
cmd_processing.m_2_dv_Z   = 1/cmd_processing.dv_2_m_Z;

end

