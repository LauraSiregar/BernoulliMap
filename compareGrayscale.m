function varargout = compareGrayscale(varargin)
% COMPAREGRAYSCALE MATLAB code for compareGrayscale.fig
%      COMPAREGRAYSCALE, by itself, creates a new COMPAREGRAYSCALE or raises the existing
%      singleton*.
%
%      H = COMPAREGRAYSCALE returns the handle to a new COMPAREGRAYSCALE or the handle to
%      the existing singleton*.
%
%      COMPAREGRAYSCALE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMPAREGRAYSCALE.M with the given input arguments.
%
%      COMPAREGRAYSCALE('Property','Value',...) creates a new COMPAREGRAYSCALE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before compareGrayscale_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to compareGrayscale_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help compareGrayscale

% Last Modified by GUIDE v2.5 24-Aug-2016 08:29:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @compareGrayscale_OpeningFcn, ...
                   'gui_OutputFcn',  @compareGrayscale_OutputFcn, ...
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


% --- Executes just before compareGrayscale is made visible.
function compareGrayscale_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to compareGrayscale (see VARARGIN)

% Choose default command line output for compareGrayscale
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes compareGrayscale wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = compareGrayscale_OutputFcn(hObject, eventdata, handles) 
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
global X1;
global X2;
global X3;
global hist1;
global hist2;
global hist3;

% hist1 = rgb2gray(Img1);
% axes(handles.axes3)
% imhist(hist1);

hist1 = Img1;
axes(handles.axes3)
imhist(hist1);

% hist2 = rgb2gray(Img2);
% axes(handles.axes4)
% imhist(hist2);

hist2 = Img2;
axes(handles.axes6)
imhist(hist2);

% hist3 = rgb2gray(Img3);
% axes(handles.axes4)
% imhist(hist2);

hist3 = Img3;
axes(handles.axes4)
imhist(hist3);

info1 = imfinfo(X1);
info2 = imfinfo(X2);
info3 = imfinfo(X3);

form = guidata(gcbo);

set(form.text2,'String',info1.Filename);
set(form.text3,'String',info2.Filename);
set(form.text42,'String',info3.Filename);

set(form.text4,'String',info1.FileSize);
set(form.text5,'String',info2.FileSize);
set(form.text43,'String',info3.FileSize);

set(form.text6,'String',info1.Width);
set(form.text7,'String',info2.Width);
set(form.text44,'String',info3.Width);

set(form.text8,'String',info1.Height);
set(form.text9,'String',info2.Height);
set(form.text45,'String',info3.Height);

set(form.text10,'String',info1.Format);
set(form.text11,'String',info2.Format);
set(form.text46,'String',info3.Format);

set(form.text12,'String',info1.BitDepth);
set(form.text13,'String',info2.BitDepth);
set(form.text47,'String',info3.BitDepth);

set(form.text14,'String',info1.ColorType);
set(form.text15,'String',info2.ColorType);
set(form.text48,'String',info3.ColorType);

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
close compareGrayscale;


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
