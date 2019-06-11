function [score, label] = get_sepsis_score(data, model)
%include all available data
selvital = [1:40];

%number of trees in forest
nom = size(model.data);

%imputation
X = data(:,selvital); 
X = fillmissing(X,'previous');
X = fillmissing(X,'constant',0);

%produce predictions for all trees
outp = [];
for i = 1:nom
    outp(:, i) = predict(model.data{i}, X);
end

%voting on scores
scores = mean(outp,2);
score = scores(end);
label = double(score > 0.5);
end
