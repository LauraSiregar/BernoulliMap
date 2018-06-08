function varargout = comMSE(varargin)
% COMMSE MATLAB code for comMSE.fig
%      COMMSE, by itself, creates a new COMMSE or raises the existing
%      singleton*.
%
%      H = COMMSE returns the handle to a new COMMSE or the handle to
%      the existing singleton*.
%
%      COMMSE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMMSE.M with the given input arguments.
%
%      COMMSE('Property','Value',...) creates a new COMMSE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before comMSE_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to comMSE_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help comMSE

% Last Modified by GUIDE v2.5 23-Aug-2016 19:20:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @comMSE_OpeningFcn, ...
                   'gui_OutputFcn',  @comMSE_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before comMSE is made visible.
function comMSE_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to comMSE (see VARARGIN)

% Choose default command line output for comMSE
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes comMSE wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = comMSE_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pilihgambar1.
function pilihgambar1_Callback(hObject, eventdata, handles)
% hObject    handle to pilihgambar1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Img1;
global info1;
Img1=[];
[filename1,pathfile1]= uigetfile({'*.bmp; *.png'},'pilih gambar');
if isequal(filename1,0)
return;
end

Img1 = imread(strcat(pathfile1,filename1));
fullpath1=fullfile(pathfile1,filename1);
info1 = imfinfo(fullpath1);
axes(handles.axes1)
imshow(Img1);

set(handles.axes1,'Userdata',Img1);
guidata(hObject,handles);

% --- Executes on button press in pilihgambar2.
function pilihgambar2_Callback(hObject, eventdata, handles)
% hObject    handle to pilihgambar2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Img2;
global info2;
Img2=[];
[filename2,pathfile2] = uigetfile({'*.bmp; *.png'},'pilih gambar');
if isequal(filename2,0)
return;
end

Img2 = imread(strcat(pathfile2,filename2));
fullpath2=fullfile(pathfile2,filename2);
info2 = imfinfo(fullpath2);
axes(handles.axes2)
imshow(Img2);

set(handles.axes2,'Userdata',Img2);
guidata(hObject,handles);

% --- Executes on button press in btnProses.
function btnProses_Callback(hObject, eventdata, handles)
% hObject    handle to btnProses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Img1;
global Img2;
global info1;
global info2;
cocok =0;
nilai_putih=0;
nilai_hitam=0;

Img1=get(handles.axes1,'Userdata');
Img2=get(handles.axes2,'Userdata');

if isequal(Img1,[])
warndlg('Tidak Ada Gambar 1, Silahkan Masukkan Gambar 1 !!',['PERINGATAN'])
elseif isequal(Img2,[])
    warndlg('Tidak Ada Gambar 2, Silahkan Masukkan Gambar 2 !!',['PERINGATAN'])
else

Img2b=rgb2gray(Img2);
deteksi2=edge(Img2b,'canny');
axes(handles.axes3)
imshow(deteksi2);
guidata(hObject,handles);

Img1b=rgb2gray(Img1);
deteksi1=edge(Img1b,'canny');
axes(handles.axes4)
imshow(deteksi1);
guidata(hObject,handles);

form = guidata(gcbo);

set(form.text36,'String',info1.Filename);
set(form.text37,'String',info2.Filename);

set(form.text38,'String',info1.FileSize);
set(form.text39,'String',info2.FileSize);

set(form.text40,'String',info1.Width);
set(form.text41,'String',info2.Width);
o=get(handles.text40,'String');
p=get(handles.text41,'String');
h=strcmp(o,p);

set(form.text42,'String',info1.Height);
set(form.text43,'String',info2.Height);
v=get(handles.text42,'String');
f=get(handles.text43,'String');
j=strcmp(v,f);

set(form.text44,'String',info1.Format);
set(form.text45,'String',info2.Format);

set(form.text46,'String',info1.BitDepth);
set(form.text47,'String',info2.BitDepth);

set(form.text48,'String',info1.ColorType);
set(form.text49,'String',info2.ColorType);


if (h==0 || j==0);
warndlg('Lebar atau Tinggi Gambar Tidak Sama Sehingga MSE dan PSNR Tidak Ada',['PERINGATAN'])
else
for k=1:1:256
    for l=1:1:256
        if(deteksi1(k,l)==1)
            nilai_putih = nilai_putih+1;
        else
            nilai_hitam = nilai_hitam+1;
        end
    end
end

for i = 1:1:256
    for j = 1:1:256
       if(deteksi1(i,j)==1)&&(deteksi2(i,j)==1)
           cocok=cocok+1;
       else
      end
   end
end
total_data=nilai_putih;
persen=(cocok/total_data)*100;    
set(form.txtHasil,'String',[(num2str(persen)),' %']);  
% % total_data=nilai_putih;
% % persen=(cocok/total_data)*100;    
% % set(form.persen,'String',[(num2str(persen,'%7.2f')),' %']);


I = Img1;
Ihat = Img2;

% Read the dimensions of the image.
[rows columns ~] = size(I);

% Calculate mean square error of R, G, B.   
mseRImage = (double(I(:,:,1)) - double(Ihat(:,:,1))) .^ 2;
mseGImage = (double(I(:,:,2)) - double(Ihat(:,:,2))) .^ 2;
mseBImage = (double(I(:,:,3)) - double(Ihat(:,:,3))) .^ 2;


mseR = sum(sum(mseRImage)) / (rows * columns);
mseG = sum(sum(mseGImage)) / (rows * columns);
mseB = sum(sum(mseBImage)) / (rows * columns);


% Average mean square error of R, G, B.
mse = (mseR + mseG + mseB)/3;

% Calculate text3 (Peak Signal to noise ratio).
psnr = 10 * log10( 255^2 / mse);
set(handles.mse,'String',num2str(mse,'%7.2f dB'));
set(handles.psnr,'String',num2str(psnr,'%7.2f dB'));
end
end


% --- Executes on button press in btnReset.
function btnReset_Callback(hObject, eventdata, handles)
% hObject    handle to btnReset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mau=questdlg(['Membersihkan ' get(handles.figure1,'Name')''],['BERSIHKAN'],'Ya','Tidak','Ya');
if strcmp(mau,'Tidak')
return;
else
    set(handles.axes1,'Userdata',[]);
    set(handles.axes2,'Userdata',[]); 
    set(handles.text36,'String','');
    set(handles.text37,'String','');
    set(handles.text38,'String','');
    set(handles.text39,'String','');
    set(handles.text40,'String','');
    set(handles.text41,'String','');
    set(handles.text42,'String','');
    set(handles.text43,'String','');
    set(handles.text44,'String','');
    set(handles.text45,'String','');
    set(handles.text46,'String','');
    set(handles.text47,'String','');
    set(handles.text48,'String','');
    set(handles.text49,'String','');
    set(handles.mse,'String','');
    set(handles.psnr,'String','');
    set(handles.txtHasil,'String','');
   
     arrayfun(@cla,findall(0,'type','axes'))
     cla(handles.axes1,'reset');
     cla(handles.axes2,'reset');
     cla(handles.axes3,'reset');
     cla(handles.axes4,'reset');
     
     set(handles.axes1,'visible','off')
     set(handles.axes2,'visible','off')
     set(handles.axes3,'visible','off')
     set(handles.axes4,'visible','off')
hm = msgbox('Membersihkan Sukses',' BERSIHKAN','help');
end

% --- Executes on button press in kembali.
function kembali_Callback(hObject, eventdata, handles)
% hObject    handle to kembali (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close comMSE;
SubMenuPSNR;


function mse_Callback(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text2 as text
%        str2double(get(hObject,'String')) returns contents of text2 as a double


% --- Executes during object creation, after setting all properties.
function mse_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function psnr_Callback(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text3 as text
%        str2double(get(hObject,'String')) returns contents of text3 as a double


% --- Executes during object creation, after setting all properties.
function psnr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function persen_Callback(hObject, eventdata, handles)
% hObject    handle to persen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of persen as text
%        str2double(get(hObject,'String')) returns contents of persen as a double


% --- Executes during object creation, after setting all properties.
function persen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to persen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pilihgambar1.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pilihgambar1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pilihgambar2.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pilihgambar2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnProses.
function proses_Callback(hObject, eventdata, handles)
% hObject    handle to btnProses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnReset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to btnReset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in kembali.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to kembali (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to mse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mse as text
%        str2double(get(hObject,'String')) returns contents of mse as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to psnr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of psnr as text
%        str2double(get(hObject,'String')) returns contents of psnr as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to psnr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to persen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of persen as text
%        str2double(get(hObject,'String')) returns contents of persen as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to persen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
