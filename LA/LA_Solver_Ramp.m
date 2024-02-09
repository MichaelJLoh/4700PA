ny = 10; %row
nx = 10; %col
V = zeros(ny,nx);
time = 1000;

%BCs
V(:,1) = 1;
V(:,ny) = 0;
V(1,:) = V(2,:);
V(nx, :) = V(nx-1,:);

for t = 1:time

    for i = 2:(ny-1)
        for k = 2:(nx-1)
            V(i,k) = (V(i+1,k) + V(i-1,k) + V(i,k+1) + V(i,k-1))/4;
        end
    end

    %V(:,1) = 1;
    %V(:,ny) = 0;
    V(1,:) = V(2,:);
    V(ny,:) = V(ny-1,:);

    surf(V)
    pause(0.1);

end
