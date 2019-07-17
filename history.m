function output = history(patients, padding)
    output = cell(length(patients), 1);
    for i = 1:length(patients)
        patient = patients{i}(:, 1:40);
        out = cell(1, padding);
        for j = 0:padding - 1  
            
            paddedPatient = patient(1:end - j, :);
            if size(paddedPatient, 1) == 0
                for k = j+1:padding
                    out{k} = zeros(size(patient, 1), size(patient, 2));
                end
                break;
            end
            
            safeAppend = cell(2, 1);
            safeAppend{1} = zeros(j, size(paddedPatient, 2));
            safeAppend{2} = paddedPatient;
            
            out{j+1} = cell2mat(safeAppend);
        end
        output{i} = cell2mat(out);
    end
end