function reaction_wheel = init_reaction_wheel
% UW HuskySat-1, ADCS Team
% Initiates the brushed DC motor model
%   T. Reynolds - 6.23.17


% Initial conditions
reaction_wheel.ic.current   = 0;
reaction_wheel.ic.theta     = 0;
reaction_wheel.ic.omega     = 0;
reaction_wheel.ic.rt1       = 0;
reaction_wheel.ic.deriv1    = 0;

% Motor Characterisitcs
reaction_wheel.resistance   = 20.8;     % Ohms
reaction_wheel.inductance   = 0.071e-3; % Henry
reaction_wheel.load_torque  = 0; %0.326e-3; % Nm (nominal torque)
reaction_wheel.inertia      = 0.0179*(1/10); % kg/m^2
reaction_wheel.damping      = 1e-2;     % Nms - WAG
reaction_wheel.torque_cnst  = 2.34e-3;  % Nm/A
reaction_wheel.delay        = 6.81e-3;  % s

reaction_wheel.num  = reaction_wheel.torque_cnst;
reaction_wheel.den  = [reaction_wheel.inertia*reaction_wheel.inductance ...
                        reaction_wheel.inductance*reaction_wheel.damping + reaction_wheel.resistance*reaction_wheel.inertia ...
                        reaction_wheel.resistance*reaction_wheel.damping + reaction_wheel.torque_cnst^2 ];

% Control Params - tuned with PID tool
reaction_wheel.control.frequency = 1/200;
reaction_wheel.control.kp    = 275843.546307191;
reaction_wheel.control.ki    = 4399399.8100777;
reaction_wheel.control.kd    = -56.0991504171521;
reaction_wheel.control.filter_coeff     = 4917.07172490179;
reaction_wheel.control.setpt_weight_b   = 0.0142681697957121;
reaction_wheel.control.setpt_weight_c   = 0.0142681697957121;