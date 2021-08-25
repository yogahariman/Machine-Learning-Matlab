function [Y,W,lambda]=PCA(X)
%   Principal Component Analist
%   Created by yoga hariman
%   Copyright 2009
%   $Revision: 0.0.0.1 $  $Date: 2009/11/14 09:00:00 $
%
%   [data eigenVector err]=PCA(data,minEigenValue,eigenVector)
%   
%   example : 
%       [data eigenVector err]=PCA(data)
%       [data eigenVector err]=PCA(data,minEigenValue)
%       data=PCA(data,[],eigenVector)
%   
%   data (input) is n-data x n-atb
%   data (output) is matrix n-data x n-atb transformation selected
%   eigenVector is vector transformatin data
%   minEigenValue is minimum limit Eigen
%   center is mean of data (shift center of coordinat)
%   err is error message, if zeros then not error
center=mean(X,1);
% Center X by subtracting off column means
shiftData = bsxfun(@minus,X,center);
%shiftData=data-center(ones(size(data,1),1),:);

[W,lambda] = eig(cov(shiftData));

lambda = diag(lambda);
[lambda, SortOrder]=sort(lambda,'descend');
W=W(:,SortOrder);

Y = X*W;
