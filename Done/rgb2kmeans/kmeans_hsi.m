function [C, label, J] = kmeans_hsi(I, cluster)
[m, n, p] = size(I);
X = reshape(double(I), m*n, p);%reshape得到各个点，m*n行，p列
% rng('default');
% C = X(randperm(m*n, k), :);%初始的质心，反正生成了随机数
[k,r]=size(cluster);
C=cluster;
J_prev = inf; iter = 0; J = []; tol = 1e-2;%0.01
while true,
    iter = iter + 1;
%     dist = sum(X.^2, 2)*ones(1, k) + (sum(C.^2, 2)*ones(1, m*n))' - 2*X*C';
    dist = sum(X.^2, 2)*ones(1, k) + (sum(C.^2, 2)*ones(1, m*n))'- 2*X*C';
    [~, label] = min(dist, [], 2) ;%标记属于哪个label，聚类，但是后面的又不懂了
    for i = 1:k,
       C(i, :) = mean(X(label == i , :));%质心
    end
    J_cur = sum(sum((X - C(label, :)).^2, 2));
    J = [J, J_cur];
    display(sprintf('#iteration: %03d, objective fcn: %f', iter, J_cur));
    %‘fro’  A和A‘的积的对角线和的平方根，即sqrt(sum(diag(A'*A)))
    if norm(J_cur-J_prev, 'fro') < tol
        break;
    end
    J_prev = J_cur;
end