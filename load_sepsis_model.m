function model = load_sepsis_model()
    %load array of trees as random forest model
    loadedObj = load('models.mat');
    model = loadedObj.models;
end
