function varargout = compareWarna(varargin)
% COMPAREWARNA MATLAB code for compareWarna.fig
%      COMPAREWARNA, by itself, creates a new COMPAREWARNA or raises the existing
%      singleton*.
%
%      H = COMPAREWARNA returns the handle to a new COMPAREWARNA or the handle to
%      the existing singleton*.
%
%      COMPAREWARNA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMPAREWARNA.M with the given input arguments.
%
%      COMPAREWARNA('Property','Value',...) creates a new COMPAREWARNA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before compareWarna_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to compareWarna_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help compareWarna

% Last Modified by GUIDE v2.5 24-Aug-2016 08:20:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @compareWarna_OpeningFcn, ...
                   'gui_OutputFcn',  @compareWarna_OutputFcn, ...
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


% --- Executes just before compareWarna is made visible.
function compareWarna_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to compareWarna (see VARARGIN)

% Choose default command line output for compareWarna
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes compareWarna wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = compareWarna_OutputFcn(hObject, eventdata, handles) 
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
global X1;
X1 = uigetfile('*.bmp;*.png','Select Image');
Img1 = imread(X1);
axes(handles.axes1);
imshow(Img1);
guidata(hObject,handles);

% --- Executes on button press in compare.
function compare_Callback(hObject, eventdata, handles)
% hObject    handle to compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Img1;
global Img2;
global Img3;
global red1;
global green1;
global blue1;
global red2;
global green2;
global blue2;
global red3;
global green3;
global blue3;
global X1;
global X2;
global X3;

red1 = Img1(:,:,1);
axes(handles.axes3);
imhist(red1);

green1 = Img1(:,:,2);
axes(handles.axes4);
imhist(green1);

blue1 = Img1(:,:,3);
axes(handles.axes5);
imhist(blue1);

red2 = Img2(:,:,1);
axes(handles.axes6);
imhist(red2);

green2 = Img2(:,:,2);
axes(handles.axes7);
imhist(green2);

blue2 = Img2(:,:,3);
axes(handles.axes8);
imhist(blue2);

red3 = Img3(:,:,1);
axes(handles.axes10);
imhist(red3);

green3 = Img3(:,:,2);
axes(handles.axes11);
imhist(green3);

blue3 = Img3(:,:,3);
axes(handles.axes12);
imhist(blue3);

info1 = imfinfo(X1);
info2 = imfinfo(X2);
info3 = imfinfo(X3);

form = guidata(gcbo);

set(form.text2,'String',info1.Filename);
set(form.text3,'String',info2.Filename);
set(form.text44,'String',info3.Filename);

set(form.text4,'String',info1.FileSize);
set(form.text5,'String',info2.FileSize);
set(form.text45,'String',info3.FileSize);

set(form.text6,'String',info1.Width);
set(form.text7,'String',info2.Width);
set(form.text46,'String',info3.Width);

set(form.text8,'String',info1.Height);
set(form.text9,'String',info2.Height);
set(form.text47,'String',info3.Height);

set(form.text10,'String',info1.Format);
set(form.text11,'String',info2.Format);
set(form.text48,'String',info3.Format);

set(form.text12,'String',info1.BitDepth);
set(form.text13,'String',info2.BitDepth);
set(form.text49,'String',info3.BitDepth);

set(form.text14,'String',info1.ColorType);
set(form.text15,'String',info2.ColorType);
set(form.text50,'String',info3.ColorType);

% % prosen=analisa(Img1,Img2);
% % spersen=[num2str(prosen) ' %'];
% % set(handles.txthasil,'String',spersen);

% --- Executes on button press in pilihgambar2.
function pilihgambar2_Callback(hObject, eventdata, handles)
% hObject    handle to pilihgambar2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Img2;
global X2;
X2 = uigetfile('*.bmp;*.png','Select file');
Img2 = imread(X2);
axes(handles.axes2);
imshow(Img2);
guidata(hObject,handles);

% --- Executes on button press in kembali.
function kembali_Callback(hObject, eventdata, handles)
% hObject    handle to kembali (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SubMenuCompare;
close compareWarna;


% --- Executes on button press in pilihgambar3.
function pilihgambar3_Callback(hObject, eventdata, handles)
% hObject    handle to pilihgambar3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Img3;
global X3;
X3 = uigetfile('*.bmp;*.png','Select file');
Img3 = imread(X3);
axes(handles.axes9);
imshow(Img3);
guidata(hObject,handles);
