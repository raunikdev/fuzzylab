clc; clear; close all;

%% 1. Plot basic functions
x = -10:0.01:10;
figure;

funcs = {x.^2, x.^3, sin(x), cos(x), tan(x)};
titles = {'x^2','x^3','sin(x)','cos(x)','tan(x)'};

for i = 1:5
    subplot(3,2,i);
    plot(x, funcs{i}, 'LineWidth', 2);
    title(['f(x) = ' titles{i}]);
    grid on;
    if i == 5, ylim([-10 10]); end
end

%% 2. Plot sin and cos together
x = -2*pi:0.01:2*pi;
figure;
plot(x, sin(x), 'r', x, cos(x), 'b', 'LineWidth', 2);
title('sin(x) and cos(x)');
legend('sin(x)','cos(x)');
grid on;

%% 3. Discrete Membership Functions
x = -5:5;
A = {1./(1+abs(x)), 1./(1+abs(x-5)), 1./(1+abs(x+5))};
names = {'0','5','-5'};

figure;
for i = 1:3
    subplot(3,1,i);
    stem(x, A{i}, 'filled');
    title(['x close to ' names{i}]);
    ylim([0 1.1]); grid on;
end

%% 4. Continuous Membership Function
x = -5:0.01:5;
figure;
plot(x, 1./(1+x.^2), 'LineWidth', 2);
title('A = 1/(1+x^2)');
xlabel('x'); ylabel('Membership');
ylim([0 1.1]); grid on;

%% Complement Functions
a = 0:0.001:1;

C1 = 1 - a;
C2 = 0.5*(1 + cos(pi*a));
w = 2; C3 = (1 - a.^w).^(1/w);

figure;
plot(a, C1, 'k', a, C2, 'r', a, C3, 'b', 'LineWidth', 2);
title('Complement Functions');
legend('1-a','Cosine','Yager'); grid on;

%% Yager for different w
w_vals = [0.5 1 2 5];
figure; hold on;
for w = w_vals
    plot(a, (1 - a.^w).^(1/w), 'LineWidth', 2);
end
title('Yager Complement');
legend('0.5','1','2','5'); grid on; hold off;

%% Apply Complements to Membership Functions
x = -5:5;
A = {1./(1+abs(x)), 1./(1+abs(x-5)), 1./(1+abs(x+5))};
names = {'0','5','-5'};

for i = 1:3
    Acur = A{i};
    C1 = 1 - Acur;
    C2 = 0.5*(1 + cos(pi*Acur));
    C3 = (1 - Acur.^2).^(1/2);

    figure;
    stem(x, C1, 'k','filled'); hold on;
    stem(x, C2, 'r');
    stem(x, C3, 'b');
    title(['Complements (x close to ' names{i} ')']);
    legend('1-a','Cosine','Yager');
    grid on; hold off;
end