% PA 5

clear;
close all;

nx = 50; 
ny = 50; 
V = zeros(nx,ny);
G = sparse(nx*ny,nx*ny);

for i = 1:nx
    for j = 1:ny
        n = j + (i-1)*ny;

        if i == 1 
            
            G(n,:) = 0; 
            G(n,n) = 1; 

        elseif i == nx

            G(n,:) = 0;
            G(n,n) = n;

        elseif j == 1 

            G(n,:) = 0; 
            G(n,n) = 1; 

        elseif j == ny

            G(n,:) = 0; 
            G(n,n) = n; 

        else 
            nxm = j + (i-2)*ny; 
            nxp = j + (i)*ny;
            nym = j-1 + (i-1)*ny;
            nyp = j+1 + (i-1)*ny;

            G(n,n) = -4;
            G(n,nxm) = -1;
            G(n,nym) = -1;
            G(n,nxp) = -1;
            G(n,nyp) = -1;
        end 
    end
end 
spy(G);

nmodes = 9; % 20
[E,D] = eigs(G ,nmodes,'SM');
figure('name','Eigenvalues')
plot(diag(D), '*');

np = ceil(sqrt(nmodes));
figure('name','Modes')
for k = 1:nmodes
    M = E(:,k);
    for i = 1:nx
        for j = 1:ny
            n = i + (j-1)*nx;
            V(i,j) = M(n);
        end 
        subplot(np,np,k), surf(V,'linestyle','none')
        title(['EV = ' num2str(D(k,k))])
    end
end
