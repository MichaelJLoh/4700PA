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


nx = 200;
l = .40E-9;
x = linspace(0,1,nx);
dx = x(2) - x(1);

paras = [1/16, 1/4, 1/2, 75*C.q_0, 0*C.q_0];
pot = @Pot_Dwell;



dx2 = dx*dx;
B = (C.hb^2)/(2*C.m_0);

for i = 1:nx
    Poten(i) = pot(x(i),paras);
    if i == 1
        G(i,i) = B/dx2;
    elseif i == nx
        G(i,i) = B/dx2;
    else
        G(i,i) = B*2/dx2 + Poten(i);
        G(i,i-1) = -B/dx2;
        G(i,i+1) = -B/dx2;
    end
end

[V,D] = eig(G);

[Ds,Pr] = sort(diag(D));
D = D(Pr,Pr);
V = V(:,Pr);

subplot(2,1,1),plot(x*1e9,Poten/C.q_0);
xlabel('x (nm)')
ylabel('Potential (eV)')

subplot(2,1,2),plot(x*1e9,V(:,1:5))
xlabel('x (nm)')
ylabel('Eigenvectors')

E(1) = C.hb^2*pi*pi/(2*C.m_0*1^2)/C.q_0;
E(2) = 4*C.hb^2*pi*pi/(2*C.m_0*1^2)/C.q_0;
E(3) = 9*C.hb^2*pi*pi/(2*C.m_0*1^2)/C.q_0;

display(E)
display((diag(D(1:8,1:8))/C.q_0)')




