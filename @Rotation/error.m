%%Rotation.error()
% Jonathan Woolfrey
%
% Returns the error between this Rotation object and a desired rotation.
% For a unit quaternion Q in H, the following identity holds:
%
%                   Q*Q' = [1, 0 0 0],
%
% where Q' is the conjugate of Q. Therefore, the error in H can be
% expressed as:
%
%                        Qd*Qa',
%
% where Qd is the desired, and Qa is the conjugate of the actual or current
% rotation.
%
% Only the vector component of the quaternion error is required for
% orientation feedback control.


% Copyright (C) Jon Woolfrey, 2019-2020
% 
% This file is part of the Robot Toolbox I developed for MATLAB.
%
% My Robot Toolbox is free software and may be distributed and/or modified
% according to the terms of the GNU General Public Licence v3.0
% (https://www.gnu.org/licenses/gpl-3.0.en.html). A copy should be included
% in the root directory.
%
% I developed this toolbox to simulate sophisticated robot control methods
% for my research, which other packages were lacking. I hope others may
% find it useful so they don't have to endure the same pains I did.
%
% This software is made available without warranty, fitness for use, or
% merchantability. If any public works are distributed that were made
% possible because of this Robot Toolbox, a citation or reference would be
% much appreciated!
%
% jonathan.woolfrey@gmail.com

function ret = error(obj,desired)
    
    %Compute the angle between the quaternions
    % N.B: Normally you'd divide by the norm of the vectors, but quaternions
    %      are unit norm so it's not required here
    angle = acos(obj.quat'*desired.quat);    

    % If the angle is greater than 90 degrees, change the sign
    if angle > pi/2
        desired.quat = -1*desired.quat;
    end
    
    ret = obj.quat(1)*desired.quat(2:4)                 ...
          - desired.quat(1)*obj.quat(2:4)               ...
          - cross(desired.quat(2:4),obj.quat(2:4));
end