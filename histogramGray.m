function varargout = histogramGray(varargin)
% HISTOGRAMGRAY MATLAB code for histogramGray.fig
%      HISTOGRAMGRAY, by itself, creates a new HISTOGRAMGRAY or raises the existing
%      singleton*.
%
%      H = HISTOGRAMGRAY returns the handle to a new HISTOGRAMGRAY or the handle to
%      the existing singleton*.
%
%      HISTOGRAMGRAY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HISTOGRAMGRAY.M with the given input arguments.
%
%      HISTOGRAMGRAY('Property','Value',...) creates a new HISTOGRAMGRAY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before histogramGray_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to histogramGray_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help histogramGray

% Last Modified by GUIDE v2.5 23-Aug-2016 10:45:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @histogramGray_OpeningFcn, ...
                   'gui_OutputFcn',  @histogramGray_OutputFcn, ...
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


% --- Executes just before histogramGray is made visible.
function histogramGray_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to histogramGray (see VARARGIN)

% Choose default command line output for histogramGray
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes histogramGray wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = histogramGray_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pilihgambar.
function pilihgambar_Callback(hObject, eventdata, handles)
% hObject    handle to pilihgambar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Img1;
global X1;
X1 = uigetfile('*.bmp;*.png;*.jpg','Select Image');
Img1 = imread(X1);
axes(handles.axes5);
imshow(Img1);
guidata(hObject,handles);

% --- Executes on button press in proses.
function proses_Callback(hObject, eventdata, handles)
% hObject    handle to proses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Img1;
% % global Img2;
global X1;
% % global X2;
global hist1;
% % global hist2;

hist1 = Img1;
axes(handles.axes6)
imhist(hist1);

% % hist2 = Img2;
% % axes(handles.axes6)
% % imhist(hist2);

% --- Executes on button press in kembali.
function kembali_Callback(hObject, eventdata, handles)
% hObject    handle to kembali (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SubMenuHistogram;
close histogramGray;
