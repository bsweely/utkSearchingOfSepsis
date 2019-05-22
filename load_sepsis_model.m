function model = load_sepsis_model()
    %import decision tree prediciton fct
    import classreg.learning.classif.CompactClassificationTree.*;
    
    %load array of trees as random forest model
    loadedObj = load('models.mat');
    model = loadedObj.models;
end
