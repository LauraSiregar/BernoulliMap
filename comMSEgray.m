function varargout = comMSEgray(varargin)
% COMMSEGRAY MATLAB code for comMSEgray.fig
%      COMMSEGRAY, by itself, creates a new COMMSEGRAY or raises the existing
%      singleton*.
%
%      H = COMMSEGRAY returns the handle to a new COMMSEGRAY or the handle to
%      the existing singleton*.
%
%      COMMSEGRAY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMMSEGRAY.M with the given input arguments.
%
%      COMMSEGRAY('Property','Value',...) creates a new COMMSEGRAY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before comMSEgray_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to comMSEgray_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help comMSEgray

% Last Modified by GUIDE v2.5 23-Aug-2016 09:57:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @comMSEgray_OpeningFcn, ...
                   'gui_OutputFcn',  @comMSEgray_OutputFcn, ...
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


% --- Executes just before comMSEgray is made visible.
function comMSEgray_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to comMSEgray (see VARARGIN)

% Choose default command line output for comMSEgray
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes comMSEgray wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = comMSEgray_OutputFcn(hObject, eventdata, handles) 
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

% --- Executes on button press in proses.
function proses_Callback(hObject, eventdata, handles)
% hObject    handle to proses (see GCBO)
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

Img2b=Img2;
deteksi2=edge(Img2b,'canny');
axes(handles.axes3)
imshow(deteksi2);
guidata(hObject,handles);

Img1b=Img1;
deteksi1=edge(Img1b,'canny');
axes(handles.axes4)
imshow(deteksi1);
guidata(hObject,handles);

form = guidata(gcbo);

set(form.text12,'String',info1.Filename);
set(form.text13,'String',info2.Filename);

set(form.text14,'String',info1.FileSize);
set(form.text15,'String',info2.FileSize);

set(form.text16,'String',info1.Width);
set(form.text17,'String',info2.Width);
o=get(handles.text16,'String');
p=get(handles.text17,'String');
h=strcmp(o,p);

set(form.text18,'String',info1.Height);
set(form.text19,'String',info2.Height);
v=get(handles.text18,'String');
f=get(handles.text19,'String');
j=strcmp(v,f);

set(form.text20,'String',info1.Format);
set(form.text21,'String',info2.Format);

set(form.text22,'String',info1.BitDepth);
set(form.text23,'String',info2.BitDepth);

set(form.text24,'String',info1.ColorType);
set(form.text25,'String',info2.ColorType);


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

% % prosen=analisa(Img1,Img2);
% % spersen=[num2str(prosen) ' %'];
% % set(handles.txthasil,'String',spersen);

I = double(Img1);
Ihat = double (Img2);

% Read the dimensions of the image.
[rows columns ~] = size(I);

% Calculate mean square error of R, G, B.   
mseImage = (double(I) - double(Ihat)) .^ 2;
[rows, columns] = size (I);
mse = sum(mseImage(:)) / (rows * columns);


% Calculate text27 (Peak Signal to noise ratio).
psnr = 10 * log10( 255^2 / mse);
set(handles.mse,'String',num2str(mse,'%7.2f dB'));
set(handles.psnr,'String',num2str(psnr,'%7.2f dB'));
end
end



% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mau=questdlg(['Membersihkan ' get(handles.figure1,'Name')''],['BERSIHKAN'],'Ya','Tidak','Ya');
if strcmp(mau,'Tidak')
return;
else
    set(handles.axes1,'Userdata',[]);
    set(handles.axes2,'Userdata',[]); 
    set(handles.text12,'String','');
    set(handles.text13,'String','');
    set(handles.text14,'String','');
    set(handles.text15,'String','');
    set(handles.text16,'String','');
    set(handles.text17,'String','');
    set(handles.text18,'String','');
    set(handles.text19,'String','');
    set(handles.text20,'String','');
    set(handles.text21,'String','');
    set(handles.text22,'String','');
    set(handles.text23,'String','');
    set(handles.text24,'String','');
    set(handles.text25,'String','');
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
close comMSEgray;
SubMenuPSNR;


function mse_Callback(hObject, eventdata, handles)
% hObject    handle to mse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mse as text
%        str2double(get(hObject,'String')) returns contents of mse as a double


% --- Executes during object creation, after setting all properties.
function mse_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function psnr_Callback(hObject, eventdata, handles)
% hObject    handle to psnr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of psnr as text
%        str2double(get(hObject,'String')) returns contents of psnr as a double


% --- Executes during object creation, after setting all properties.
function psnr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to psnr (see GCBO)
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
