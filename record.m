

%%% This program is used to record the speech sample of subject %%%
Time = 1;  % Time for one sample recording
Id = '1';  %Subject id
fs = 8000; %Sampling Frequency
nBits = 8;  % Number of bits
SRecoder = audiorecorder(fs, nBits, 1);
for i=1:70
if (i>0 && i<11)
Word = 'run';
elseif (i>10 && i<21)
Word = 'stop';
elseif (i>20 && i<31)
Word = 'back';
elseif (i>30 && i<41)
Word = 'left';
elseif (i>40 && i<51)
Word = 'right';
elseif (i>50 && i<61)
Word = 'fast';
elseif (i>60 && i<71)
Word = 'slow';
end
fprintf('Say ');
fprintf(Word);
fprintf(' immediately after press enter');
input('');
disp('Start speaking.');
recordblocking(SRecoder, Time);
disp('End of Recording.');
myRecording = getaudiodata(SRecoder);  %To get Recorded Data
sound(myRecording,fs);  % For play the recorded data 

%% recorded sample File Name Id_word_datestr.wav  and to save it in specified Folder
filename = strcat(Id, '_');   
filename = strcat(filename, Word);
filename = strcat(filename, '_');
filename = strcat(filename, datestr(now, 30));
filename = strcat(filename, '.wav');
filename = strcat('foldername/',filename);
audiowrite(filename, myRecording, fs)  % Save recording sample
end
