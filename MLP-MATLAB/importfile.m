function [newData1] = importfile(fileToRead1)
%IMPORTFILE(FILETOREAD1)
%  Imports data from the specified file
%  FILETOREAD1:  file to read
DELIMITER = ',';
HEADERLINES = 1;

% Import the file
newData1 = importdata(fileToRead1, DELIMITER, HEADERLINES);

