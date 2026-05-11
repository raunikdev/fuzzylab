clc; clear; close all; rng(1);

% Data
N=100; X=[randn(N,2)+2; randn(N,2)-2]; Y=[ones(N,1); -ones(N,1)];

% Add bias term
X=[X ones(2*N,1)];

% Fuzzy membership
c1=mean(X(Y==1,1:2)); c2=mean(X(Y==-1,1:2));
mu=arrayfun(@(i) exp(-norm(X(i,1:2)-(Y(i)==1)*c1-(Y(i)==-1)*c2)),1:2*N)';

% Train FSVM (SGD)
w=zeros(3,1); lr=0.01; C=1;

for epoch=1:500
    for i=1:2*N
        if Y(i)*(X(i,:)*w) < 1
            w = w - lr*(w - C*mu(i)*Y(i)*X(i,:)');
        else
            w = w - lr*w;
        end
    end
end

% Grid
[x1,x2]=meshgrid(linspace(min(X(:,1))-1,max(X(:,1))+1,100));
Xg=[x1(:) x2(:) ones(numel(x1),1)];
z=reshape(Xg*w,size(x1));

% Plot
figure;
subplot(1,2,1);
scatter(X(:,1),X(:,2),40,mu,'filled'); colorbar; title('Membership');

subplot(1,2,2);
gscatter(X(:,1),X(:,2),Y); hold on;
contour(x1,x2,z,[0 0],'k','LineWidth',2);
title('FSVM (No Toolbox)');