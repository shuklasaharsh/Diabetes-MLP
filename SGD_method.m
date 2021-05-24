function Weight = SGD_method(Weight, input, correct_Output)
alpha = 0.9;
N = 8;
for k = 1:N
    transposed_input = input(k,:)';
    d = correct_Output(k);
    weighted_Sum = Weight*transposed_input;
    output = Sigmoid(weighted_Sum);
    error = d - output;
    delta = output*(1-output)*error;
    dWeight = alpha*delta*transposed_input;
    Weight(1) = Weight(1) + dWeight(1);
    Weight(2) = Weight(2) + dWeight(2);
    Weight(3) = Weight(3) + dWeight(3);
end
end