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

    for i = 2:(ny-1)
        for k = 2:(nx-1)
            V(i,k) = (V(i+1,k) + V(i-1,k) + V(i,k+1) + V(i,k-1))/4;
        end
    end

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
