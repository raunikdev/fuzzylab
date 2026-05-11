clc; clear; close all;

%% Example Discrete Values
x = -5:5;

% Membership Functions
A = 1 ./ (1 + abs(x));        % A: close to 0
B = 1 ./ (1 + abs(x - 2));    % B: close to 2

disp('Values of x:'); disp(x);
disp('Membership A (close to 0):'); disp(A);
disp('Membership B (close to 2):'); disp(B);

%% 1. Complement Functions (Example)
disp('--- Complement Functions Example ---');

% Standard
C1_A = 1 - A;

% Cosine
C2_A = 0.5 * (1 + cos(pi * A));

% Yager (w = 2)
w = 2;
C3_A = (1 - A.^w).^(1/w);

disp('Standard Complement of A:'); disp(C1_A);
disp('Cosine Complement of A:'); disp(C2_A);
disp('Yager Complement of A:'); disp(C3_A);

% Plot
figure;
stem(x, C1_A, 'k','filled'); hold on;
stem(x, C2_A, 'r');
stem(x, C3_A, 'b');
title('Complement of A (Example)');
legend('Standard','Cosine','Yager');
grid on;

%% 2. Standard Union & Intersection (Example)
disp('--- Standard Union & Intersection ---');

union_std = max(A, B);
inter_std = min(A, B);

disp('Standard Union:'); disp(union_std);
disp('Standard Intersection:'); disp(inter_std);

% Plot
figure;
stem(x, A, 'b','filled'); hold on;
stem(x, B, 'r');
stem(x, union_std, 'k');
stem(x, inter_std, 'g');
title('Standard Union & Intersection');
legend('A','B','Union','Intersection');
grid on;

%% 3. Yager Union & Intersection (Example)
disp('--- Yager Union & Intersection ---');

w = 2;

union_yager = min(1, (A.^w + B.^w).^(1/w));
inter_yager = 1 - min(1, ((1-A).^w + (1-B).^w).^(1/w));

disp('Yager Union:'); disp(union_yager);
disp('Yager Intersection:'); disp(inter_yager);

% Plot
figure;
stem(x, A, 'b','filled'); hold on;
stem(x, B, 'r');
stem(x, union_yager, 'k');
stem(x, inter_yager, 'g');
title('Yager Union & Intersection');
legend('A','B','Yager Union','Yager Intersection');
grid on;

%% 4. Continuous Example (Visualization)
x_cont = -5:0.01:5;

A_cont = 1 ./ (1 + abs(x_cont));
B_cont = 1 ./ (1 + abs(x_cont - 2));

union_std_c = max(A_cont, B_cont);
inter_std_c = min(A_cont, B_cont);

figure;
plot(x_cont, A_cont, 'b', x_cont, B_cont, 'r', 'LineWidth', 2); hold on;
plot(x_cont, union_std_c, '--k', x_cont, inter_std_c, '--g', 'LineWidth', 2);
title('Continuous Example (Standard)');
legend('A','B','Union','Intersection');
grid on;