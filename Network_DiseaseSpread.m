% nfyerukbwf
function dZ = Network_DiseaseSpread(t,z)
n = length(z)/2; % number of towns that are connected

global ConnectionMat
N = 1000; % number of humans
M = 100000; % number of Mosquitoes

b = 0.1; %biting rate

g = 0.5; % rate of recovery rate
m = 2; % Death rate of Mosquitoes

x = z(1:n); % no of infected individuals
y = z(n+1 : 2*n); % no of infected mosquitoes

dX = zeros(n,1);
dY = zeros(n,1);

for i = 1:n
    
    dX(i) = b*(N/n - x(i))*y(i) - g*x(i) + b*(N/n - x(i))*ConnectionMat(i,:)*y;
    dY(i) = b*(M/n - y(i))*x(i) - m*y(i) + b*(M/n - y(i))*ConnectionMat(i,:)*x;
    
end

dZ = [dX ;dY];

end
