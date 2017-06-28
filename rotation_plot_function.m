%% Plot of the tensile axis as it rotates under slip

function [] = rotation_plot_function(D)


P_x=zeros(10);
P_y=zeros(10);

for i=1:1:11
    
    d(1)= D(i,1);
    d(2)= D(i,2);
    d(3)= D(i,3);
    
mod_d=sqrt(d(1)^2+ d(2)^2+ d(3)^2);
unit_d = d/mod_d;

% conversion of uvw pole to sphereical angles (theta (co-latitude) and phi (longitude))

theta = acos(unit_d(3));
phi = atan2(unit_d(2),unit_d(1));

% calculate x,y coordinates of pole in cartesian system

d_x = tan(theta/2)*cos(phi);
d_y = tan(theta/2)*sin(phi);

if i==1 
    p_0x=d_x;
    p_0y=d_y;
else
      P_x(i-1)=d_x;
      P_y(i-1)=d_y;
      
end

end
%     D(j,3)=d(3);

% Plotting stereographic circle and the rotated directions

x = -1:0.05:1;
y = sqrt(1-x.^2);

figure


plot(x,y,':k.','MarkerSize',5)
xlabel('x');
ylabel('y');
hold on
plot(x,-y,':k.','MarkerSize',5)
hold on

plot(p_0x,p_0y,'d','MarkerEdgeColor','r',...
                 'MarkerFaceColor','r',...
                 'MarkerSize',5)
hold on

plot(P_x,P_y,'*','MarkerEdgeColor','b',...
                 'MarkerFaceColor','b',...
                 'MarkerSize',5)

% plot(x,y,'--rs','LineWidth',2,...
%                 'MarkerEdgeColor','k',...
%                 'MarkerFaceColor','g',...
%                 'MarkerSize',10)
%  plot(theta,r_value,'-.+r')
%  xlabel('theta (degree)');
%  ylabel('r_value');
% ss = struct('n',zeros(1,3),'b',zeros(1,3));
% ss(1).n=[1,1,1]; ss(1).b =[0,-1,1];
%x = -pi:.1:pi;
% y = sin(x);
% p = plot(x,y)
% set(gca,'XTick',-pi:pi/2:pi)
% set(gca,'XTickLabel',{'-pi','-pi/2','0','pi/2','pi'})
% xlabel('-\pi \leq \Theta \leq \pi')
% ylabel('sin(\Theta)')
% title('Plot of sin(\Theta)')
% % \Theta appears as a Greek symbol (see String)
% % Annotate the point (-pi/4, sin(-pi/4))
% text(-pi/4,sin(-pi/4),'\leftarrow sin(-\pi\div4)',...
%      'HorizontalAlignment','left')
% % Change the line color to red and
% % set the line width to 2 points 
% set(p,'Color','red','LineWidth',2)  