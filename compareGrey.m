function varargout = compareGrey(varargin)
% COMPAREGREY MATLAB code for compareGrey.fig
%      COMPAREGREY, by itself, creates a new COMPAREGREY or raises the existing
%      singleton*.
%
%      H = COMPAREGREY returns the handle to a new COMPAREGREY or the handle to
%      the existing singleton*.
%
%      COMPAREGREY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMPAREGREY.M with the given input arguments.
%
%      COMPAREGREY('Property','Value',...) creates a new COMPAREGREY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before compareGrey_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to compareGrey_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help compareGrey

% Last Modified by GUIDE v2.5 09-Aug-2016 22:43:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct( 'gui_Name', mfilename, ...
                    'gui_Singleton', gui_Singleton, ...
                    'gui_OpeningFcn', @compareGrey_OpeningFcn, ... 
                    'gui_OutputFcn', @compareGrey_OutputFcn, ... 
                    'gui_LayoutFcn', [] , ...
                    'gui_Callback', []);
if nargin && ischar(varargin{1}) 
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end   
% End initialization code - DO NOT EDIT



% --- Executes just before compareGrey is made visible.
function compareGrey_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to compareGrey (see VARARGIN)

% Choose default command line output for compareGrey
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes compareGrey wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = compareGrey_OutputFcn(hObject, eventdata, handles) 
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
X1 = uigetfile('*.bmp;*.png;*.jpg','Select Image');
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
global X1;
global X2;
global hist1;
global hist2;

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
axes(handles.axes4)
imhist(hist2);

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
set(handles.txtHasil,'String',spersen);

% --- Executes on button press in kembali.
function kembali_Callback(hObject, eventdata, handles)
% hObject    handle to kembali (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SubMenuCompare;
close compareGrey;


% --- Executes on button press in pilihgambar.
function pilihgambar_Callback(hObject, eventdata, handles)
% hObject    handle to pilihgambar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Img2;
global X2;
X2 = uigetfile('*.bmp;*.png;*.jpg','Select Image');
Img2 = imread(X2);
axes(handles.axes2);
imshow(Img2);
guidata(hObject, handles);
