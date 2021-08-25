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

% function [data,eigenVector,eigenValue,err]=PCA(data,minEigenValue,eigenVector)
% %   Principal Component Analist
% %   Created by PT. Rock Fluid Imaging
% %   Copyright 2009
% %   $Revision: 0.0.0.1 $  $Date: 2009/11/14 09:00:00 $
% %
% %   [data eigenVector err]=PCA(data,minEigenValue,eigenVector)
% %   
% %   example : 
% %       [data eigenVector err]=PCA(data)
% %       [data eigenVector err]=PCA(data,minEigenValue)
% %       data=PCA(data,[],eigenVector)
% %   
% %   data (input) is n-data x n-atb
% %   data (output) is matrix n-data x n-atb transformation selected
% %   eigenVector is vector transformatin data
% %   minEigenValue is minimum limit Eigen
% %   center is mean of data (shift center of coordinat)
% %   err is error message, if zeros then not error
% err=[];
% try
%     status=0;
%     if ~exist('eigenVector','var'),status=1;
%     else
%         if isempty(eigenVector),status=1;end
%     end
%     
%     if status==1
%         center=mean(data,1);
%         % Center X by subtracting off column means
%         shiftData = bsxfun(@minus,data,center);        
%         %shiftData=data-center(ones(size(data,1),1),:);
%         
%         [eigenVector,eigenValue] = eig(cov(shiftData));
% 
%         eigenValue = diag(eigenValue);
%         if exist('minEigenValue','var')
%             if ~isempty(minEigenValue)
%                 eigenIndex=find(eigenValue>minEigenValue);
%             end
%         else
%             eigenIndex=find(eigenValue>mean(eigenValue));
%         end
% 
%         eigenVector=eigenVector(:,eigenIndex);
%     end
%     data = (data*eigenVector);
% catch
%     err=lasterror;
%     err=err.message;
% end

% oldX=rand(100,1);oldY=rand(100,1);
% plot(oldX,oldY,'.');
% meanwX = mean(oldX); meanwY = mean(oldY);
% hold on;plot(meanwX,meanwY,'or')
% 
% shiftX = oldX - meanwX; shiftY = oldY - meanwY;
% figure();plot(shiftX,shiftY,'.');
% hold on;plot(0,0,'or')
% 
% C = cov(shiftX,shiftY);
% [V D]= eig(C);
% RotMat = V';
% z = (RotMat*[shiftX shiftY]')';
% newX = z(:,2); newY = z(:,1);
% figure();plot(newX,newY,'.');
