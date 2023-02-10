clear;
close all;

nx = 100; % size x
ny = 100; % size y
ni = 10000; % iteration 
V = zeros(nx,ny);

V(:,1) = 0;
V(:,ny) = 0;

V(1,:) = 1;
V(nx,:) = 0;

SidesToZero = 1;
for k = 1:ni % iterative loop
    for i = 2:nx-1 % loops over matrix x, m
        for j = 2:ny-1 % loops over matrix y, n

            V(i,j) = (V(i,j+1)+V(i,j-1)+V(i+1,j)+V(i-1,j))/4;

        end
    
    end
   % V(:,1) = 0;
     V(:,1) = V(:,2);
   % V(:,ny) = 0;
     V(:,ny) = V(:,ny-1);

    V(1,:) = 1;
    V(nx,:) = 0;
    if mod(k,50) == 0
        surf(V')
        pause(0.05)
    end

end

[Ex,Ey] = gradient(V);

figure
quiver(-Ex',Ey',10)