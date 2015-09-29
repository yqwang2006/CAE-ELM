 function [OutputData,OutputWeight] = AE_train(inputData, InputWeight, BiasofHiddenNeurons, param)
%disp('Now in RELM_AE function');

P=inputData;
clear inputData;                                   %   Release raw training data array

ActivationFunction = param.Actfunc;
%%%%%%%%%%% Load testing dataset
NumberofTrainingData=size(P,2);%P:784*5000
NumberofInputNeurons=size(P,1);
NumberofHiddenNeurons = param.hiddenNum;
%%%%%%%%%%% Calculate weights & biases
C = param.C;

H=InputWeight*P;
ind=ones(1,NumberofTrainingData);
BiasMatrix=BiasofHiddenNeurons(:,ind);              %   Extend the bias matrix BiasofHiddenNeurons to match the demention of H
H=H+BiasMatrix;

%%%%%%%%%%% Calculate hidden neuron output matrix H
H = Actfunc(H, ActivationFunction);
                                   %   Release the temparary array for calculation of hidden neuron output matrix H

%%%%%%%%%%% Calculate output weights OutputWeight (beta_i)
%OutputWeight=pinv(H') * T';                        % implementation without regularization factor //refer to 2006 Neurocomputing paper
if NumberofHiddenNeurons == NumberofInputNeurons
    [~,OutputWeight,~] = procrustNew( P' ,H');
else
%     OutputWeight=inv(eye(size(H,1))/C+H * H') * H * T';   % faster method 1 //refer to 2012 IEEE TSMC-B paper
        rhohats = mean(H,2);
        rhoValue = 0.1;
        rho = rhoValue;
        KLsum = sum(rho * log(rho ./ rhohats) + (1-rho) * log((1-rho) ./ (1-rhohats)));
        clear rhohats;
        Hsquare =  H * H';
        HsquareL = diag(max(Hsquare,[],2));
        OutputWeight=( ( eye(size(H,1)).*KLsum +HsquareL )*(1/C)+Hsquare) \ (H * P');
end
clear H HsquareL Hsquare ;

OutputData = AE_ff(P,OutputWeight,BiasofHiddenNeurons,ActivationFunction);

clear P;

end



