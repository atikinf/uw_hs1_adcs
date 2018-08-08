function DCM = my_quat2dcm( q )

% UW HuskySat-1, ADCS Subsystem
% Last Update: T. Reynolds 9.1.17

% Transforms a quaternion into a standard rotation matrix (DCM). Uses the
% same operations as the MATLAB built in function - but is rewritten for
% code generation.

if length(q) ~= 4
    if length(q) == 3
        q   = reshape(q,3,1);
        q   = [q; 0];
    else
        error('Input is not a quaternion')
    end
end

q   = q/norm(q);

DCM = zeros(3,3);

DCM(1,1) = q(1).^2 + q(2).^2 - q(3).^2 - q(4).^2;
DCM(1,2) = 2.*(q(2).*q(3) + q(1).*q(4));
DCM(1,3) = 2.*(q(2).*q(4) - q(1).*q(3));
DCM(2,1) = 2.*(q(2).*q(3) - q(1).*q(4));
DCM(2,2) = q(1).^2 - q(2).^2 + q(3).^2 - q(4).^2;
DCM(2,3) = 2.*(q(3).*q(4) + q(1).*q(2));
DCM(3,1) = 2.*(q(2).*q(4) + q(1).*q(3));
DCM(3,2) = 2.*(q(3).*q(4) - q(1).*q(2));
DCM(3,3) = q(1).^2 - q(2).^2 - q(3).^2 + q(4).^2;

end

