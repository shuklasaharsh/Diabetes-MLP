function [Train_Data, Test_Data] = Clean_Data(data)
cv = cvpartition(size(data,1),'HoldOut',0.2);
idx = cv.test;
% Separate to training and test data
dataTrain = data(~idx,:);
dataTest  = data(idx,:);
%%
%Handle the 0 values for some features of training set
g=(dataTrain.Glucose==0);
k=(dataTrain.BloodPressure==0);
l=(dataTrain.SkinThickness==0);
m=(dataTrain.Insulin==0);
n=(dataTrain.BMI==0);
o=(dataTrain.DiabetesPedigreeFunction==0);
p=(dataTrain.Age==0);
impractical=[sum(g) sum(k) sum(l) sum(m) sum(n) sum(o) sum(p)];
%%
%Replace those with average of the corresponding columns of training data
g=(dataTrain.Glucose==0);
msa=(dataTrain.Outcome==1);
ks=mean(dataTrain.Glucose(~g & msa));
dataTrain.Glucose(g & msa)=ks;
ks=mean(dataTrain.Glucose(~g & ~msa));
dataTrain.Glucose(g & ~msa)=ks;
g=(dataTrain.BloodPressure==0);
ks=mean(dataTrain.BloodPressure(~g & msa));
dataTrain.BloodPressure(g & msa)=ks;
ks=mean(dataTrain.BloodPressure(~g & ~msa));
dataTrain.BloodPressure(g & ~msa)=ks;
g=(dataTrain.SkinThickness==0);
ks=mean(dataTrain.SkinThickness(~g & msa));
dataTrain.SkinThickness(g & msa)=ks;
ks=mean(dataTrain.SkinThickness(~g & ~msa));
dataTrain.SkinThickness(g & ~msa)=ks;
g=(dataTrain.Insulin==0);
ks=mean(dataTrain.Insulin(~g & msa));
dataTrain.Insulin(g & msa)=ks;
ks=mean(dataTrain.Insulin(~g & ~msa));
dataTrain.Insulin(g & ~msa)=ks;
g=(dataTrain.BMI==0);
ks=mean(dataTrain.BMI(~g & msa));
dataTrain.BMI(g & msa)=ks;
ks=mean(dataTrain.BMI(~g & ~msa));
dataTrain.BMI(g & ~msa)=ks;
g=(dataTrain.DiabetesPedigreeFunction==0);
ks=mean(dataTrain.DiabetesPedigreeFunction(~g & msa));
dataTrain.DiabetesPedigreeFunction(g & msa)=ks;
ks=mean(dataTrain.DiabetesPedigreeFunction(~g & ~msa));
dataTrain.DiabetesPedigreeFunction(g & ~msa)=ks;
dataTrain.Age(p)=mean(dataTrain.Age(~p));
%%
%Handle the 0 values for some features of test set
g=(dataTest.Glucose==0);
k=(dataTest.BloodPressure==0);
l=(dataTest.SkinThickness==0);
m=(dataTest.Insulin==0);
n=(dataTest.BMI==0);
o=(dataTest.DiabetesPedigreeFunction==0);
p=(dataTest.Age==0);
impractical=[sum(g) sum(k) sum(l) sum(m) sum(n) sum(o) sum(p)];
%%
%Replace those with average of the corresponding columns of test data
g=(dataTest.Glucose==0);
msa=(dataTest.Outcome==1);
ks=mean(dataTest.Glucose(~g & msa));
dataTest.Glucose(g & msa)=ks;
ks=mean(dataTest.Glucose(~g & ~msa));
dataTest.Glucose(g & ~msa)=ks;
g=(dataTest.BloodPressure==0);
ks=mean(dataTest.BloodPressure(~g & msa));
dataTest.BloodPressure(g & msa)=ks;
ks=mean(dataTest.BloodPressure(~g & ~msa));
dataTest.BloodPressure(g & ~msa)=ks;
g=(dataTest.SkinThickness==0);
ks=mean(dataTest.SkinThickness(~g & msa));
dataTest.SkinThickness(g & msa)=ks;
ks=mean(dataTest.SkinThickness(~g & ~msa));
dataTest.SkinThickness(g & ~msa)=ks;
g=(dataTest.Insulin==0);
ks=mean(dataTest.Insulin(~g & msa));
dataTest.Insulin(g & msa)=ks;
ks=mean(dataTest.Insulin(~g & ~msa));
dataTest.Insulin(g & ~msa)=ks;
g=(dataTest.BMI==0);
ks=mean(dataTest.BMI(~g & msa));
dataTest.BMI(g & msa)=ks;
ks=mean(dataTest.BMI(~g & ~msa));
dataTest.BMI(g & ~msa)=ks;
g=(dataTest.DiabetesPedigreeFunction==0);
ks=mean(dataTest.DiabetesPedigreeFunction(~g & msa));
dataTest.DiabetesPedigreeFunction(g & msa)=ks;
ks=mean(dataTest.DiabetesPedigreeFunction(~g & ~msa));
dataTest.DiabetesPedigreeFunction(g & ~msa)=ks;
dataTest.Age(p)=mean(dataTest.Age(~p));
%%
% Return
Train_Data = dataTrain;
Test_Data = dataTest;
end
