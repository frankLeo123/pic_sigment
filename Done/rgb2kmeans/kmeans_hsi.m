function [C, label, J] = kmeans_hsi(I, cluster)
[m, n, p] = size(I);
X = reshape(double(I), m*n, p);%reshape�õ������㣬m*n�У�p��
% rng('default');
% C = X(randperm(m*n, k), :);%��ʼ�����ģ����������������
[k,r]=size(cluster);
C=cluster;
J_prev = inf; iter = 0; J = []; tol = 1e-2;%0.01
while true,
    iter = iter + 1;
%     dist = sum(X.^2, 2)*ones(1, k) + (sum(C.^2, 2)*ones(1, m*n))' - 2*X*C';
    dist = sum(X.^2, 2)*ones(1, k) + (sum(C.^2, 2)*ones(1, m*n))'- 2*X*C';
    [~, label] = min(dist, [], 2) ;%��������ĸ�label�����࣬���Ǻ�����ֲ�����
    for i = 1:k,
       C(i, :) = mean(X(label == i , :));%����
    end
    J_cur = sum(sum((X - C(label, :)).^2, 2));
    J = [J, J_cur];
    display(sprintf('#iteration: %03d, objective fcn: %f', iter, J_cur));
    %��fro��  A��A���Ļ��ĶԽ��ߺ͵�ƽ��������sqrt(sum(diag(A'*A)))
    if norm(J_cur-J_prev, 'fro') < tol
        break;
    end
    J_prev = J_cur;
end