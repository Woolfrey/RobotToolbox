%% MobileManipulator.invDynamics()
% Jon Woolfrey
% This is a work in progress.

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

function ret = invDynamics(obj,acc,vel,Kd,pos,Kp)

    if nargin < 5
        pos = zeros(obj.arm.n,1);
        Kp = 0;
    end
    if nargin < 3
        vel = zeros(obj.arm.n,1);
        Kd = 0;
    end
    
    ret = obj.arm.invDynamics(acc,vel,Kd,pos,Kp) + obj.torque;
end