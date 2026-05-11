%% LAB 1 - Matrix and Vector Operations

clc;
clear;

%% 1. Construct
% (1) Matrix of size m x n
m = 3;
n = 4;
A = [1 2 3 4;
     5 6 7 8;
     9 10 11 12];

disp('Matrix A:');
disp(A);

% (2) Vector of size 1 x n
V = [10 20 30 40];
disp('Vector V:');
disp(V);

%% 2. Construct random matrices

% (1) Uniform distribution (0 to 1)
R_uniform = rand(m,n);

% (2) Normal distribution
R_normal = randn(m,n);

% (3) Random integers from 1 to 100
R_int = randi([1 100], m, n);

% (4) Real numbers from 0 to 1
R_real = rand(m,n);

disp('Random Uniform Matrix:'); disp(R_uniform);
disp('Random Normal Matrix:'); disp(R_normal);
disp('Random Integer Matrix:'); disp(R_int);

%% 3. Find sum
% (1) Sum of all rows
row_sum = sum(A,2);

% (2) Sum of all columns
col_sum = sum(A,1);

% (3) Sum of all entries
total_sum = sum(A(:));

disp('Row Sum:'); disp(row_sum);
disp('Column Sum:'); disp(col_sum);
disp('Total Sum:'); disp(total_sum);

%% 4. Mean, Median, Min, Max

mean_val = mean(A(:));
median_val = median(A(:));
min_val = min(A(:));
max_val = max(A(:));

disp(['Mean = ', num2str(mean_val)]);
disp(['Median = ', num2str(median_val)]);
disp(['Min = ', num2str(min_val)]);
disp(['Max = ', num2str(max_val)]);

%% 5. Find size of matrix and vector

size_A = size(A);
size_V = size(V);

disp('Size of Matrix A:');
disp(size_A);

disp('Size of Vector V:');
disp(size_V);

%% 6. Find entries greater/smaller than a particular number

k = 6;

greater_entries = A(A > k);
smaller_entries = A(A < k);

disp('Entries greater than k:');
disp(greater_entries);

disp('Entries smaller than k:');
disp(smaller_entries);

%% 7. Find inverse of a matrix
% NOTE: Matrix must be square and non-singular

B = [1 2; 3 4];

B_inv = inv(B);

disp('Matrix B:');
disp(B);
disp('Inverse of B:');
disp(B_inv);

%% 8. Construct matrices

n = 4;

% (i) Diagonal matrix
D = diag([1 2 3 4]);

% (ii) Identity matrix
I = eye(n);

% (iii) Zero matrix
Z = zeros(n,n);

disp('Diagonal Matrix:'); disp(D);
disp('Identity Matrix:'); disp(I);
disp('Zero Matrix:'); disp(Z);

%% 9. Product of two matrices

X = [1 2; 3 4];
Y = [5 6; 7 8];

P = X * Y;

disp('Product of X and Y:');
disp(P);

%% 10. Sort entries of matrix and vector

% Sort vector
V_inc = sort(V);                 % increasing
V_dec = sort(V,'descend');       % decreasing

% Sort matrix elements (convert to vector first)
A_inc = sort(A(:));              % increasing
A_dec = sort(A(:),'descend');    % decreasing

disp('Vector sorted increasing:'); disp(V_inc);
disp('Vector sorted decreasing:'); disp(V_dec);

disp('Matrix elements sorted increasing:'); disp(A_inc);
disp('Matrix elements sorted decreasing:'); disp(A_dec);
