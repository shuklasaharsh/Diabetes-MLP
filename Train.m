function Weight = Train(input, correct_Output, epochs)
    Weight = 2*rand(1,8) - 1;
    for epoch = 1:epochs
        Weight = SGD_method(Weight, input, correct_Output);
    end
    save('Trained_Network.mat')
end