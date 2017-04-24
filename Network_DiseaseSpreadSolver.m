%
% 
% Network disease spread solver
%
%
function [] = Network_DiseaseSpreadSolver()
TimeScale = [0 1];
IC = [50; 4000; 60; 70; 55; 42; 73; 100; 200; 320; 1200; 450; 10; 5];
n = length(IC)/2; % number of towns that are connected
global ConnectionMat
ConnectionMat = [0 1 1 1 0 0 0; 1 0 1 0 1 0 0; 1 1 0 1 0 1 0; ...
                 1 0 1 0 0 1 0; 0 1 0 0 0 1 1; 0 0 1 1 1 0 1;...
                 0 0 0 0 1 1 0];
             
WData = load('Weather.mat');
Weather = WData.Weather;
global Temp
Temp = zeros(24,7); % per month for 2 years per county

for i = 1:24
    for j = 1:7
        Temp(i,j) = Weather(4*i - 1,j);
    end
end

for i = 1:n
    for j = i:n
        ConnectionMat(j,i) = ConnectionMat(i,j);
        if i == j
            ConnectionMat(i,j) = 0;
        end
    end
end



%ConnectionMat = zeros(n);
Connectivity = mean(sum(ConnectionMat));

[t, z] = ode45(@Network_DiseaseSpread, TimeScale, IC);
figure()
plot(t,z(:,1:n))
end