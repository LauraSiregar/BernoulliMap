function varargout = dekripsi(varargin)
% DEKRIPSI MATLAB code for dekripsi.fig
%      DEKRIPSI, by itself, creates a new DEKRIPSI or raises the existing
%      singleton*.
%
%      H = DEKRIPSI returns the handle to a new DEKRIPSI or the handle to
%      the existing singleton*.
%
%      DEKRIPSI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEKRIPSI.M with the given input arguments.
%
%      DEKRIPSI('Property','Value',...) creates a new DEKRIPSI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dekripsi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dekripsi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dekripsi

% Last Modified by GUIDE v2.5 14-Aug-2016 19:34:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dekripsi_OpeningFcn, ...
                   'gui_OutputFcn',  @dekripsi_OutputFcn, ...
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


% --- Executes just before dekripsi is made visible.
function dekripsi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dekripsi (see VARARGIN)

% Choose default command line output for dekripsi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dekripsi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = dekripsi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in buka_gambar.
function buka_gambar_Callback(hObject, eventdata, handles)
% hObject    handle to buka_gambar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% [handles.namafile,handles.direktori]=uigetfile({'*.bmp;*.jpg;*.png','file citra(*.bmp,*.jpg)';'*.bmp','file bitmap(*.bmp)';'*.jpg','file jpg(*.jpg)';'*.*','semua file(*.*)'},'buka file citra host/asli');
% 
% Img=imread(fullfile(handles.direktori,handles.namafile));    
% if size(Img,1)>1
%     set(handles.figure1,'CurrentAxes',handles.axes1);
%     set(imshow(Img));  
%        set(handles.axes1,'Userdata',Img);
%     mypaths=[handles.direktori,handles.namafile];
%     set(handles.edPath,'string',mypaths);
% end
global Img;
X = uigetfile({'*.bmp';'*.png';'*.jpg'},'Pilih Gambar') 
Img = imread(X);
axes(handles.axes1);
imshow(Img);
guidata(hObject, handles);


% --- Executes on button press in dekripsi.
function dekripsi_Callback(hObject, eventdata, handles)
% hObject    handle to dekripsi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Img;
global DecImg;
global key;
global A;
global B;
form = guidata(gcbo);
A=str2double(get(form.edit1,'String'));
B=str2double(get(form.edit2,'String'));
[n m k] = size(Img);
tic
key = bernoulli(Img,n*m,A,B);
DecImg = proses(Img, key);
timeEnc = toc;
axes(handles.axes2)
imshow(DecImg); set(form.text4,'String',num2str(timeEnc)); guidata(hObject, handles);


% --- Executes on button press in kembali.
function kembali_Callback(hObject, eventdata, handles)
% hObject    handle to kembali (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
menu_utama;
close dekripsi;

% --- Executes on button press in simpan.
function simpan_Callback(hObject, eventdata, handles)
% hObject    handle to simpan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global DecImg;
[filename] = uiputfile({'*.bmp';'*.png';'*.jpg'},'simpan gambar'); imwrite(DecImg,[filename]);



function edPath_Callback(hObject, eventdata, handles)
% hObject    handle to edPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edPath as text
%        str2double(get(hObject,'String')) returns contents of edPath as a double


% --- Executes during object creation, after setting all properties.
function edPath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
