%% Payload.getInertia()
% Jon Woolfrey
% October 2020
%
% This function gets the inertia of a payload object mapped to the joint
% space of a serial link manipulator.

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

function ret = getInertia(obj)
    ret = obj.mass*obj.J(1:3,:)'*obj.J(1:3,:) ...
        + obj.J(4:6,:)'*obj.I*obj.J(4:6,:);
end