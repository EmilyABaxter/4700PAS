doPlot = 1;
dt = 5e-15;
TStop = 3000 * dt;
InitDist = 0.0;
Method = 'VE'; % VE -- verlot; FD -- Forward Difference

Mass0 = 10 * C.am; % Silicon
Mass1 = 2 * C.am; % Argon

AtomSpacing = 0.5430710e-9;
LJSigma = AtomSpacing / 2^(1 / 6);
LJEpsilon = 1e-21;

PhiCutoff = 3 * AtomSpacing * 1.1;

T = 30;

%AddRectAtomicArray(10, 10, 0, 0, 0, 0, 0, T, 0);
% vy0 = -sqrt(0.02*Ep/Mass1);
% AddRectAtomicArray(4,4,0,12*AtomSpacing,0,vy0,0,T,1);
Ep = 2;
AddCircAtomicArray(10, 4, 2/3, 0, 0, 0, T, 0);
%AddCircAtomicArray(5, 0, 0, (3^2)/((2)^2), (0.2^2)/((2)^2), 5 , Ep * C.q_0, 5);
% AddCircAtomicArray(rad, X0, Y0, VX0, VY0, InitDist, Temp, Type)
% AddParticleStream(50, 10, 100, -pi / 2, 1, Ep * C.q_0, 5);
% AddParticleStream(5, 0.1, 10, -pi / 2, 1, Ep * C.q_0, 5);
% AddParticleStream(num, x0, y0, PartAng, Type, Ep, Seper)

Size = 10*AtomSpacing;
% Limits = [-Size +Size -Size +Size]; % square is good
% Limits = [-Size +Size -Size +Size];
PlDelt = 5 * dt;

PlotFile = 'BlockSt.gif';
PlotPosOnly = 1;
doPlotImage = 0;
PlotSize = [100, 100, 1049, 1049];

ScaleV = .02e-11;
ScaleF = 10;
