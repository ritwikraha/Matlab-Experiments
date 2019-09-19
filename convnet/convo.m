%% first we load the MNIST dataset 
digitDatasetPath = fullfile(matlabroot,'toolbox','nnet','nndemos', ...
    'nndatasets','DigitDataset');
imds = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'LabelSource','foldernames');
%% visualizing the image data
figure;
permute = randperm(10000,10);
for i = 1:10
    subplot(2,5,i);
    imshow(imds.Files{permute(i)});
end
%% counting the number of images per label
% splitting the dataset into training and test set
labelCount = countEachLabel(imds)

numTrainFiles = 700;
[imdsTrain,imdsTest] = splitEachLabel(imds,numTrainFiles,'randomize');
%% Constructing the convnet architecture
layers = [
    imageInputLayer([28 28 1])
    
    convolution2dLayer(3,8,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,16,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    fullyConnectedLayer(10)
    softmaxLayer
    classificationLayer];
%% training the architecture using sgdm and learning rate 0.01
options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',4, ...
    'Shuffle','every-epoch', ...
    'ValidationData',imdsTest, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','training-progress');

net = trainNetwork(imdsTrain,layers,options);
%% visualizing the architecture 
analyzeNetwork(net)
%% predicting labels on the validation set
YPred = classify(net,imdsTest);
YTest = imdsTest.Labels;

accuracy = sum(YPred == YTest)/numel(YTest)
%%the end