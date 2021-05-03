clc;
clear;
close all;

data=load('iris');

X = data.Inputs';
T = data.Targets';
L = vec2ind(T')';

%% Linear Discriminant Analysis (aka. Fisher Discriminant Analysis)

[Y, W, lambda] = LDA(X, L);

%% Plot Results

figure;

D = size(X,2);
for d=1:D
    % Original Data
    subplot(D,2,2*d-1);
    plot(X(:,d));
    ylabel(['x_' num2str(d)]);
    if d==D
        xlabel('Sample Index');
    end
    if d==1
        title('Original Data');
    end
    grid on;
    
    % Transformed Data
    subplot(D,2,2*d);
    plot(Y(:,d));
    ylabel(['y_' num2str(d)]);
    if d==D
        xlabel('Sample Index');
    end
    if d==1
        title('LDA Output');
    end
    grid on;
    
end
