function [Y, W, lambda] = LDA(X, L)
%   Linear Discriminant Analysis
%   Created by yoga hariman
%   Copyright 2015
%   https://github.com/yogahariman

    Classes=unique(L)';
    k=numel(Classes);

    na = size(X,2);
    M=mean(X);
    Sw=zeros(na,na);
    Sb=zeros(na,na);
    for j=1:k
        Xj=X(L==Classes(j),:);
        nd=size(Xj,1);
        C=mean(Xj);
        S=zeros(na,na);
        for i=1:nd
            S(:,:)=S(:,:)+(Xj(i,:)-C)'*(Xj(i,:)-C);
        end
        Sw(:,:)=Sw(:,:)+S(:,:);
        Sb(:,:)=Sb(:,:)+nd*(C-M)'*(C-M);
    end
    
%     n=zeros(k,1);
%     C=cell(k,1);
%     M=mean(X);
%     S=cell(k,1);
%     Sw=0;
%     Sb=0;
%     for j=1:k
%         Xj=X(L==Classes(j),:);
%         n(j)=size(Xj,1);
%         C{j}=mean(Xj);
%         S{j}=0;
%         for i=1:n(j)
%             S{j}=S{j}+(Xj(i,:)-C{j})'*(Xj(i,:)-C{j});
%         end
%         Sw=Sw+S{j};
%         Sb=Sb+n(j)*(C{j}-M)'*(C{j}-M);
%     end

    [W, LAMBDA]=eig(Sb,Sw);

    lambda=diag(LAMBDA);

    [lambda, SortOrder]=sort(lambda,'descend');

    W=W(:,SortOrder);

    Y=X*W;

end
