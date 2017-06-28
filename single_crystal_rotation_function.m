%% Slip system selection
% This program takes tensile direction in xtal reference frame as input and calculates schmid factor for all slip systems
% Then it selects the slip system with the highest schimd factor

B = zeros(1,3);
N = zeros(1,3);
fprintf('Please enter the loading direction \n')
O= input('');         % crystal_orientation array
d0 = sscanf(O,'%d'); % d becomes column vector
% d0 = Miller(d(1),d(2),d(3),CS);
CS = crystalSymmetry('-43m');
D = Miller(0,0,1,CS);
% D= zeros(11,3);


[SSset, n_SS, m_max] = slip_system_function(d0);
% [b,n] = slip_system_function(d);

for s = 1:1:n_SS
    
    N = SSset(s).n;
    N = N/norm(N);
    B = SSset(s).b;
    B = B/norm(B);
        d = d0;
        for j=1:1:11
            gamma=0.01*(j-1);
            for i=1:1:3
            d(i)= d(i)+ gamma*(dot(d,N))*B(i);
            end

         D(j) = Miller(d(1),d(2),d(3),CS);
        end
figure;
plotrot(D)

end