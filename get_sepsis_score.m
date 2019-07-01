function [score, label] = get_sepsis_score(data, model)
%include all available data
selvital = [1:40];

%imputation
X = data(:,selvital); 
X = fillmissing(X,'previous');
X = fillmissing(X,'constant',0);

%make prediction based on current data
scores = predict(model.data, X);

%use last timestamp as most recent score
score = scores(end);
label = score;
end
