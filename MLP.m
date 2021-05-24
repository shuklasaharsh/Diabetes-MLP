%%Boiler Plate
%
clc
clear all
close all
warning off

%%
% Including data
data = Get_Data();
[dataTrain , dataTest] = Clean_Data(data);
dataTrain = Create_Matrix(dataTrain);
dataTest = Create_Matrix(dataTest);

%%
epochs = input('Enter number of epochs: ');
correct_output_Train = dataTrain(:,9);
input = dataTrain(:,1:8);
%%
%Train model using Train function
Final_Weights = Train(input, correct_output_Train, epochs);

%%
%Test
Test_Outputs = dataTest(:,9);
dataTest = dataTest(:,1:8);
load('Trained_Network.mat');
l = length(dataTest);
O = [];
for k = 1:l
    transposed_Input = dataTest(k,:)';
    weighted_Sum = Weight*transposed_Input;
    O(k) = Sigmoid(weighted_Sum);
end
%%
% Accuracy
Q_matrix = [];
for k = 1:l
    Q_matrix(k) = abs(Test_Outputs(k) - O(k));
end

Accuracy = (sum(Q_matrix)/length(Q_matrix))*100;

disp(Accuracy);