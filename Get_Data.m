function data = Get_Data(~)
    data=readtable('./diabetes data.csv');
    a=sum(ismissing(data));

    %%
    % Feature Scaling
    data.Pregnancies=(data.Pregnancies-min(data.Pregnancies))/(max(data.Pregnancies)-min(data.Pregnancies));
    data.Glucose=(data.Glucose-min(data.Glucose))/(max(data.Glucose)-min(data.Glucose));
    data.BloodPressure=(data.BloodPressure-min(data.BloodPressure))/(max(data.BloodPressure)-min(data.BloodPressure));
    data.SkinThickness=(data.SkinThickness-min(data.SkinThickness))/(max(data.SkinThickness)-min(data.SkinThickness));
    data.Insulin=(data.Insulin-min(data.Insulin))/(max(data.Insulin)-min(data.Insulin));
    data.BMI=(data.BMI-min(data.BMI))/(max(data.BMI)-min(data.BMI));
    data.DiabetesPedigreeFunction=(data.DiabetesPedigreeFunction-min(data.DiabetesPedigreeFunction))/(max(data.DiabetesPedigreeFunction)-min(data.DiabetesPedigreeFunction));
    data.Age=(data.Age-min(data.Age))/(max(data.Age)-min(data.Age));
end