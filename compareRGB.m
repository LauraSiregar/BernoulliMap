function varargout = compareRGB(varargin)
% COMPARERGB MATLAB code for compareRGB.fig
%      COMPARERGB, by itself, creates a new COMPARERGB or raises the existing
%      singleton*.
%
%      H = COMPARERGB returns the handle to a new COMPARERGB or the handle to
%      the existing singleton*.
%
%      COMPARERGB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMPARERGB.M with the given input arguments.
%
%      COMPARERGB('Property','Value',...) creates a new COMPARERGB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before compareRGB_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to compareRGB_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help compareRGB

% Last Modified by GUIDE v2.5 10-Aug-2016 09:30:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @compareRGB_OpeningFcn, ...
                   'gui_OutputFcn',  @compareRGB_OutputFcn, ...
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


% --- Executes just before compareRGB is made visible.
function compareRGB_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to compareRGB (see VARARGIN)

% Choose default command line output for compareRGB
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes compareRGB wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = compareRGB_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in select.
function select_Callback(hObject, eventdata, handles)
% hObject    handle to select (see GCBO)
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
global red1;
global green1;
global blue1;
global red2;
global green2;
global blue2;
global X1;
global X2;

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

info1 = imfinfo(X1);
info2 = imfinfo(X2);

form = guidata(gcbo);

set(form.text2,'String',info1.Filename);
set(form.text3,'String',info2.Filename);

set(form.text4,'String',info1.FileSize);
set(form.text5,'String',info2.FileSize);

set(form.text6,'String',info1.Width);
set(form.text7,'String',info2.Width);

set(form.text8,'String',info1.Height);
set(form.text9,'String',info2.Height);

set(form.text10,'String',info1.Format);
set(form.text11,'String',info2.Format);

set(form.text12,'String',info1.BitDepth);
set(form.text13,'String',info2.BitDepth);

set(form.text14,'String',info1.ColorType);
set(form.text15,'String',info2.ColorType);


prosen=analisa(Img1,Img2);
spersen=[num2str(prosen) ' %'];
set(handles.txthasil,'String',spersen);

% --- Executes on button press in pilihgambar.
function pilihgambar_Callback(hObject, eventdata, handles)
% hObject    handle to pilihgambar (see GCBO)
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
close compareRGB;
