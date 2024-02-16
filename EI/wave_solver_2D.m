% Set defines a graphics property
set(0,'DefaultFigureWindowStyle','docked') 
global C

%defining constants
C.q_0 = 1.60217653e-19;
C.hb = 1.05457266913e-34;
C.h = C.hb*2*pi;
C.m_0 = 9.10938215E-31;
C.kb = 1.3806504E-24;
C.mu_0 = 1.2566370614E-6;
C.c = 299792485;

nx = 50;
ny = 50;

n = j + (i-1)*ny;

G = zeros(nx);

for i = 1:nx

    for j = 1:ny
        n = j + (i-1)*ny;
        nxm = j + (i-1 -1)*ny;
        nxp = j + (i+1 - 1)*ny;
        nym = j-1 + (i-1)*ny;
        nyp = j+1 + (i-1)*ny;

        if i == 1 || i == nx || j == 1 || j == ny
            G(i,j) = 1;
        else
            G(n,j) = -4;
            G(n,nxm) = 1;
            G(n,nym) = 1;
            G(n,nxp) = 1;
            G(n,nyp) = 1;
            
        end
    end
end
