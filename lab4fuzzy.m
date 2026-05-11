clc;
clear;
close all;

% Sample Data (you can replace this)
X = [1 2; 2 3; 3 4; 5 6; 6 7; 7 8];

[n, dim] = size(X);
c = 2;              % number of clusters
m = 2;              % fuzziness parameter
max_iter = 100;

tol = 1e-5;         % convergence tolerance

% Initialize membership matrix U
U = rand(n, c);
U = U ./ sum(U, 2);   % normalize rows

for iter = 1:max_iter
    U_old = U;

    % Compute cluster centers
    centers = zeros(c, dim);
    for j = 1:c
        numerator = sum((U(:,j).^m) .* X);
        denominator = sum(U(:,j).^m);
        centers(j,:) = numerator / denominator;
    end

    % Update membership matrix
    for i = 1:n
        for j = 1:c
            denom = 0;
            for k = 1:c
                dist_ratio = norm(X(i,:) - centers(j,:)) / ...
                             norm(X(i,:) - centers(k,:));
                denom = denom + dist_ratio^(2/(m-1));
            end
            U(i,j) = 1 / denom;
        end
    end

    % Check convergence
    if max(max(abs(U - U_old))) < tol
        break;
    end
end

% Assign labels (hard clustering for display)
[~, labels] = max(U, [], 2);

% Display Output
fprintf('Fuzzy C-Means completed in %d iterations\n\n', iter);

fprintf('Cluster Centers:\n');
disp(centers);

fprintf('First 10 Membership Values:\n');
disp(U(1:min(10,n),:));

fprintf('First 10 Data Point Labels:\n');
disp(labels(1:min(10,n)));

% Plot results
figure;
hold on;

colors = lines(c);
for i = 1:c
    scatter(X(labels==i,1), X(labels==i,2), 40, colors(i,:), 'filled');
end

% Plot centers
plot(centers(:,1), centers(:,2), 'kx', 'MarkerSize', 15, 'LineWidth', 3);

title('Fuzzy C-Means Clustering (m = 2)');
xlabel('Feature 1');
ylabel('Feature 2');
grid on;
hold off;
