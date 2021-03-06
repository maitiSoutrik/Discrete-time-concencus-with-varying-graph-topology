clear all;
close all;
clc;
%% Adjacency Matrix for the given problem
a1 = [0 0 0 0 0 0;
    0 0 0 0 0 0;
    1 0 0 0 0 0;
    0 1 0 0 0 0;
    0 0 1 0 0 0;
    0 0 0 1 0 0];
a2 = [0 0 1 0 0 0;
    1 0 0 0 0 0;
    0 0 0 0 0 0;
    0 0 0 0 0 0;
    0 0 0 0 0 0;
    0 0 0 0 1 0];
a3 = [0 0 0 0 0 0;
    0 0 0 0 0 1;
    0 1 0 0 0 0;
    0 1 0 0 0 0;
    0 0 0 0 0 0;
    0 0 0 0 0 0];

ak(:,:,1) = a1;
ak(:,:,2) = a2;
ak(:,:,3) = a3;
%% In degree matrix
d1 = diag([sum(a1(1,:));sum(a1(2,:));sum(a1(3,:));sum(a1(4,:));sum(a1(5,:));sum(a1(6,:))]);
d2 = diag([sum(a2(1,:));sum(a2(2,:));sum(a2(3,:));sum(a2(4,:));sum(a2(5,:));sum(a2(6,:))]);
d3 = diag([sum(a3(1,:));sum(a3(2,:));sum(a3(3,:));sum(a3(4,:));sum(a3(5,:));sum(a3(6,:))]);

dk(:,:,1) = d1;
dk(:,:,2) = d2;
dk(:,:,3) = d3;
%% Random initial values 
x = (2)*rand(1,6)-1;
x2 = x; 
j = 1;
cnt = 0;
%% For 12222233333 12222233333 cycle
for k = 1:90
    fk(:,:,j) = (inv(eye(6) + dk(:,:,j))) * (eye(6) + ak(:,:,j));
x2(k+1,:) = fk(:,:,j) *x2(k,:)';
if j == 1
    j = j+1;
    cnt = cnt +1;
else
if cnt == 5
j = j + 1;
cnt = 0;
end
cnt = cnt + 1;
if cnt == 5
j = 1;
cnt = 0;
end
end
end
%% Plotting states vs. time
figure;
plot (1:91,x2,'LineWidth',2)
legend('1','2','3','4','5','6')
title('States vs. Time ')
xlabel('Time');ylabel('Node States');