clc
clear
close all

fileDir = 'Chemin du dossier contenant les documents';
outfile = 'Chemin du document final';
addpath(fileDir);
fileNames = dir(fileDir);
fileNames = {fileNames.name};
fileNames = fileNames(cellfun(...
    @(f)contains(f,'.xls'),fileNames));
data = [];
for f = 1:numel(fileNames),
    fTable = readtable(fileNames{f});    
    data = [data; fTable];
end

writetable(data, outfile);