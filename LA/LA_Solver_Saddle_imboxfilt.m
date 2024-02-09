ny = 100; %row
nx = 100; %col
V = zeros(ny,nx);
time = 1000;

%BCs
V(:,1) = 1; %Left
V(:,ny) = 1; % Right
V(1,:) = 0; %Top
V(nx, :) = 0; %Bottom

for t = 1:time

    V(:,1) = 1; %Left
    V(:,ny) = 1; % Right
    V(1,:) = 0; %Top
    V(nx, :) = 0; %Bottom
    
    V = imboxfilt(V,3);
     

    %V(1,:) = V(2,:);
    %V(ny,:) = V(ny-1,:);

    [Ex,Ey] = gradient(-V);

    if (mod(t,50) == 0)
    subplot(2,1,1)
    surf(V)

    subplot(2,1,2)
    quiver(Ex,Ey);
    pause(.1);
    
    end
    
end
