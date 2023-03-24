doPlot = 1;
dt = 15e-15;
TStop = 1000 * dt;
InitDist = 0.0;
Method = 'FD'; % VE -- verlot; FD -- Forward Difference

% Mass0 = 14 * C.am; % Silicon
% Mass1 = 5 * C.am; % Argon
Mass0 = 10e14 * C.am; 
Mass1 = 1e5 * C.am; 

AtomSpacing = 0.5430710e-9;
LJSigma = AtomSpacing / 2^(1/6);
LJEpsilon = 1e-21;

PhiCutoff = 3 * AtomSpacing * 1.1;

T = 10e7;

% https://ned.ipac.caltech.edu/level5/March01/Battaner/node11.html

AddCircAtomicArray(10, 5, 10, 0, 0, 0, T, 0);
% AddCircAtomicArray(rad, X0, Y0, VX0, VY0, InitDist, Temp, Type)

Size = 20 * AtomSpacing;
Limits = [-Size +Size -Size +Size]; % square is good
PlDelt = 5*dt;
MarkerSize = 10;
PlotFile = 'Block.gif';
doPlotImage = 0;
PlotSize = [100, 100, 1049, 1049];

ScaleV = .2e-11;
ScaleF = 20;
